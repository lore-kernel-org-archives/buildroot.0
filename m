Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66067C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2D6C60B19;
	Sun, 14 Aug 2022 10:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2D6C60B19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xPiE62GMZpCI; Sun, 14 Aug 2022 10:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37352607E3;
	Sun, 14 Aug 2022 10:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37352607E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69AFF1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44E86607E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44E86607E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IbvAR0RLRTdU for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:05:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDF8C6076A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDF8C6076A
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:04:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EC3461BF203;
 Sun, 14 Aug 2022 10:04:56 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:04:55 +0200
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20220814120455.53151ef2@windsurf>
In-Reply-To: <31a721f471c341e60d84542d8f94ea6df35269cf.1660291270.git.stefan@agner.ch>
References: <31a721f471c341e60d84542d8f94ea6df35269cf.1660291270.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660471497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8MVjHTZTz63jJ162O6MB51MWbSn27Gv8/xQdXbZb0g=;
 b=kNoCuvp4x8yScXv3hejlAn1yUPhNv6x8yvbWzXnPub8fkjrL0DfYFj74rZuikSFjHaisWi
 6tSd3MDevz23r5jmuQMd/0t0dox/Ix9edjuiH+DapMX8K+TIs554rbTPT6/Ov5S5WaETe7
 mq/d2vsdMabQcOh+vGhHBveqQMdQfQ7o0D6XRBNFne7L9+7ZTOS6kFTO/2E/om6H8jwfed
 El3cRdfKu5j1EPVmVCHEp9oT6GD8Bi9sZqrAhScvvyIgyVsl/NpICZ9J1BCgom6JlUhFZb
 kfwlFgittO/rkxLG8knmqIWbsawi+wqveky7I4A2UFe190nsO7eQoNSjsmjFWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kNoCuvp4
Subject: Re: [Buildroot] [PATCH v3] package/dbus-broker: bump to release 32
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: nolange79@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Aug 2022 10:07:49 +0200
Stefan Agner <stefan@agner.ch> wrote:

> The new releases mostly contain bug fixes. The build system has been
> prepared to use AppArmor library, but since actual support is still
> missing it is not worth yet to enable build infrastructure in
> Buildroot.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/dbus-broker/dbus-broker.hash | 16 +++++++++++++++-
>  package/dbus-broker/dbus-broker.mk   | 16 ++++++++--------
>  2 files changed, 23 insertions(+), 9 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
