Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329EEC001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA3D160D89;
	Sun, 30 Jul 2023 10:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA3D160D89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s2VCisUveRBf; Sun, 30 Jul 2023 10:14:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C70160B9F;
	Sun, 30 Jul 2023 10:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C70160B9F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88BF11BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FAAE81E05
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FAAE81E05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lWtLA6s76_Ai for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:12:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4703081E04
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4703081E04
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76EE020002;
 Sun, 30 Jul 2023 10:12:44 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:12:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730121243.5dc3fe26@windsurf>
In-Reply-To: <20230730071422.1091893-1-bernd@kuhls.net>
References: <20230730071422.1091893-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690711964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dwrvpc/jfn9r1PaCTLk9mq8BETAcn9FPz36RO/9xPnw=;
 b=WH8W87qxj3JY5k2gd78wgo8GGB5WO2inr2iLGhML/xp0cEd006Y618PhnCHX4W9VYWg+dg
 1NsDA1aPbtCZ/30PIUxLeXFEkkQ1i2kQCc4dtCWbiBhAlPridY88GbQPBjkMVNfQ4xsw8a
 RkH7aw+n1FiXL4g2Jhh9lMmdHM6PO1wX3+DzXOYaHDF3cHLNnuAOPQ3u2MIuxr+vPnF+kn
 OIELKXEYjF5TgxDzDkTQqIUOCMKBWlIIP5Gxam9bAuUts+ZQl+dM3FJlzATBDWPJs/OfmY
 afB98ZtYtDMz+LzjKquBZEEpSx2gQ56p9CQgLtzm0pZd6rwB0+UPRaPMDFhI/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WH8W87qx
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-pam: fix musl build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Jul 2023 09:14:22 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> The bump to version 1.5.3 with buildroot commit
> f8147e27cdac8f998ec6644a09ce4e8d62b6433c added the file patched.
> 
> Please note that the next version will include
> https://github.com/linux-pam/linux-pam/commit/5fa961fd3b5b8cf5ba1a0cf49b10ebf79e273e96
> which adds --enable-examples as configure option to disable examples.
> This patch, although it would also fix the problem, is not added instead
> to avoid autoreconf.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1d9/1d96d4c57969536c14340ae5542e62a9459246f9/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...-examples-tty_conv-fix-build-on-musl.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/linux-pam/0001-examples-tty_conv-fix-build-on-musl.patch

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
