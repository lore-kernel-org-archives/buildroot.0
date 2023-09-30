Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014E2E77376
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A65741585;
	Sat, 30 Sep 2023 15:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A65741585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhaYkbHpExTo; Sat, 30 Sep 2023 15:21:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 597654158C;
	Sat, 30 Sep 2023 15:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 597654158C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 717141BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49C4760F62
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49C4760F62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jkGz7IvaU6MI for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:20:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DA1F60F27
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DA1F60F27
Received: by mail.gandi.net (Postfix) with ESMTPSA id E53481C0004;
 Sat, 30 Sep 2023 15:20:36 +0000 (UTC)
Date: Sat, 30 Sep 2023 17:20:36 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20230930172036.6a5e5526@windsurf>
In-Reply-To: <20230921215633.34828-2-brandon.maier@collins.com>
References: <20230921215633.34828-1-brandon.maier@collins.com>
 <20230921215633.34828-2-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696087237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kXoSej1RvhAmc1E0dGbfgikc5qSQlQPc8QVZjxxEHf0=;
 b=Wj01wZznavtHJgA4wK84tg9BLwHfwcpXMeMVSv0BdtPydkLNzfmUmyPQAnP6JtI2vmYtg0
 xZcl1HTSVTd0DZz7r2ZvUVgJnk2jF0AUjP26c1stGT92tgGdF6nHJ00tQA4Rsx50C9+RfD
 Ux1+Fw98+V0aVNfaoe4+4ziKCXwr0b3Iw37992bXqzPPWr14XN55upVM9H66jAe1oDL1JL
 zLHeHe/iLGo+uXSFXkauAbgLC2F5xoFi1vkpPslrfWSwALkF5kGs6hw1ea3ASWjEtOAD1A
 jyxPObCqoN13PvgC5q+uuEmGoeJ2wODpnreh1+9eNH7Ayt1gyLhzHPcnMzzn+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wj01wZzn
Subject: Re: [Buildroot] [PATCH 2/4] board/freescale: fix imx
 arm-trusted-firmware for GCC12
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
Cc: Maeva Manuel <maeva.manuel@oss.nxp.com>,
 Gilles Talis <gilles.talis@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 21 Sep 2023 21:56:31 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> The arm-trusted-firmware package for IMX boards fails due to a GCC bug.
> See the attached patch description for detail.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  ...Makefile-Suppress-array-bounds-error.patch | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 board/freescale/common/patches/arm-trusted-firmware/0002-LF-7968-01-fix-Makefile-Suppress-array-bounds-error.patch

Applied to master after adding references to the Gitlab CI failures
fixed by this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
