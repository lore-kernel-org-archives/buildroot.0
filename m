Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC60C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE44740B4D;
	Sat, 25 Feb 2023 09:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE44740B4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6s9eU1B9RAH; Sat, 25 Feb 2023 09:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A04440641;
	Sat, 25 Feb 2023 09:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A04440641
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C68F41BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A171D40641
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A171D40641
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XKCNfwrpl_MG for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:44:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F0EF400EC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F0EF400EC
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:44:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 93424E0003;
 Sat, 25 Feb 2023 09:44:24 +0000 (UTC)
Date: Sat, 25 Feb 2023 10:44:23 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225104423.3a9cc6ab@windsurf>
In-Reply-To: <20230224101720.1458102-1-fontaine.fabrice@gmail.com>
References: <20230224101720.1458102-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677318266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/MN7DpqpgPgPBjEPhBjAJTDvaurn1pWDOkdbDy0/Fvo=;
 b=eTCxsBvMrZwLw0ArAkgHKfFpGJ7J9+eoeAVSlpbA/b04D5f4SxIkMMcUZLcHUMjtavCG0/
 YhH/OVR2JAh5ItVhyBgLobwyvA6NS2WFTypOpWXSRuJD/2nZ7kgaQjwRTnogGC1Ly/+sUL
 Ee/ajAFvNlS+lN3bcW9jE3AkPtnwp00cmpXEVyW8pSq69clgcknPHt70HUZs9ryJU54JUU
 SCJsV3oH4WFGu945yAPQpgO6lr76McgnA1ydLs7bvtt65Cofzx/yMvmEfwe9J1wJPNHyms
 fpevbh5TBHGDjtLsbsJ4s6pmcMNXuqxPFiBXcFtG371XcFnFTTQBlMUQsHIwFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eTCxsBvM
Subject: Re: [Buildroot] [PATCH 1/1] package/xscreensaver: add linux-pam
 optional dependency
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 24 Feb 2023 11:17:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> +XSCREENSAVER_CONF_OPTS += --with-pam=yes
> +XSCREENSAVER_DEPENDENCIES += linux-pam
> +else
> +XSCREENSAVER_CONF_OPTS += --with-pam=no
> +endif

Any reason not to use --with-pam/--without-pam like we do in Buildroot,
rather than --with-pam=yes/--with-pam=no?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
