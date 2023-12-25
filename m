Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2569CC3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 20:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBAD240165;
	Mon, 25 Dec 2023 20:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBAD240165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tO6-7lHb-2Xi; Mon, 25 Dec 2023 20:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D29FA405F5;
	Mon, 25 Dec 2023 20:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D29FA405F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A66651BF94D
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EE9480F57
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EE9480F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W1klaX6prof2 for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 20:45:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 020F480EC9
 for <buildroot@busybox.net>; Mon, 25 Dec 2023 20:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 020F480EC9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E51EC0002;
 Mon, 25 Dec 2023 20:45:31 +0000 (UTC)
Date: Mon, 25 Dec 2023 21:45:30 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20231225214530.2cc11b09@windsurf>
In-Reply-To: <20231225193833.87941-1-francois.perrad@gadz.org>
References: <20231225193833.87941-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703537132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YPGMsAXgIulMo8ZoVsiAeZIVSvhbIxP4/+uwqA5/Nb0=;
 b=NYGyutw65xiCmQTk2CA5Tp5qy4yyjjDCzGvbZ2mhDd1JWwtGcDLPIgo+j8/QdRh+sI5TZo
 2x9i9SPAt60EJzYYuDuP2pLbIabrf7I1UpE5/5xubS35CniC4c77tcQUi6lvWE3fTroFa/
 hhSwz6WkBw9lr0cDn6LTI37ksxPq02dkmewPlDOc/SHR10Sr4aCTyzwSU4pajO2ok8xTff
 wdlSiAAO9KkPIGXaJhwFnk/qi02p346x7TwCEuU5q45RyomUYckYMv0UAWYOLqv9FG6jdl
 Puy6+oUi6ozGW8BEJch+2oKfjsBlmBEZh0AxQ+B2P2Xxb8CNejgORsNQ7CxCPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NYGyutw6
Subject: Re: [Buildroot] [PATCH] package/dbus: bump to version 1.14.10
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 25 Dec 2023 20:38:33 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/dbus/dbus.hash | 4 ++--
>  package/dbus/dbus.mk   | 2 +-
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
