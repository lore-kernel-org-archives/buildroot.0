Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17FBECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 09:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46CBC40121;
	Sat, 17 Sep 2022 09:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46CBC40121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3QHRLpmuStUt; Sat, 17 Sep 2022 09:54:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FBE740223;
	Sat, 17 Sep 2022 09:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FBE740223
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73A741BF82D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EEC8610FA
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EEC8610FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O0lO9_0bzgDR for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 09:54:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F362D6110E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F362D6110E
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 09:54:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A3C1A1C0008;
 Sat, 17 Sep 2022 09:53:59 +0000 (UTC)
Date: Sat, 17 Sep 2022 11:53:58 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220917115358.7207b411@windsurf>
In-Reply-To: <20220911213904.189808-1-fontaine.fabrice@gmail.com>
References: <20220911213904.189808-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663408440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CpyPbALguBIEKW3hbLyL4/V7btrCKbz8rRrAxCnJJKY=;
 b=CJnzobJVk28t8sxp9NyyAl0EMLttb4FDR2Uoe3cM53VSnrgjGAxPwceYK0uCm096njqrDe
 qgd4FhP4ZuPuTy7xLFRpVTDIzvBBK36NI0T9EjDruPv9asWR4vUKngQTUqFvOngM/BhwK/
 BUe5uoCLHqnxgR2lFnjJJZ41MY9wMtt5uIAtoBlVWjcMX9ogl75zwz5mmx8pIOYKAT+cRc
 NmWaf3mX59V0fuRk+tbZXr8lJfMr/YZ7aQGd9ggoe1NVIi88GUalXo6zUAV6xyYzMRyJJY
 3Mor4QxDG2Ge0q+dKoL5AAbppPZz864ALEheOyHp1CLzky6IsvJCBtGJ23gLCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CJnzobJV
Subject: Re: [Buildroot] [PATCH 1/1] package/libqb: bump to version 2.0.6
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Sep 2022 23:39:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/ClusterLabs/libqb/releases/tag/v2.0.6
> https://github.com/ClusterLabs/libqb/releases/tag/v2.0.5
> https://github.com/ClusterLabs/libqb/releases/tag/v2.0.4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libqb/libqb.hash | 4 ++--
>  package/libqb/libqb.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
