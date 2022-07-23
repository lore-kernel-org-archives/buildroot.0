Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A88C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA92860E14;
	Sat, 23 Jul 2022 20:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA92860E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Evv3aqx4be6Q; Sat, 23 Jul 2022 20:25:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3834961B15;
	Sat, 23 Jul 2022 20:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3834961B15
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4F2E1BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4801E61B16
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4801E61B16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UpVSnSzSponH for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:25:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14B0661B14
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14B0661B14
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:25:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D83FF20004;
 Sat, 23 Jul 2022 20:25:11 +0000 (UTC)
Date: Sat, 23 Jul 2022 22:25:10 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220723222510.3eb766d3@windsurf>
In-Reply-To: <20220723212807.4912-1-fontaine.fabrice@gmail.com>
References: <20220723212807.4912-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658607912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CoCihlJI5x3eBOEYijcykdMrFX2Y8g4mo5CRbhmQJnY=;
 b=i0yWaQ7LY2DxeK9MfPDmjY+Q+4Ine5vTBtUn7wYTBZlgPkm7wcltolMJTKlDmpCeFcNlCZ
 s20fJDt0t+7NoENpMfs502f72gcK3fJyekK70SknOgf8F3iKKNgpA6MkbtVEPwmgMFmq1L
 daclhExuccia5uzfLRic6djx9xxpJ9otHuwnWsiFirLscm3CwEm10JSzftLjmSVwiz4L4K
 58LvwZA8gY94Hb6kSaIkNrtUN+18pwppk89BQ4e8mlKCja7QeIJsLeeSmx8WIEtIrDkrjC
 V3UTQkp+UOjGNO0Kwn140DXwdg+7apWr2asGrhNmDT13AdmX7c1UroshWqVNjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i0yWaQ7L
Subject: Re: [Buildroot] [PATCH 1/1] package/ntpsec: depends on python3
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 23 Jul 2022 23:28:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Depends on python3 instead of selecting it to avoid the following build
> failure raised since the addition of the package in commit
> 27b8d0ba8c4004819e092fb81c0f64f284b3aa4a:
> 
> Makefile:576: *** libffi is in the dependency chain of python3 that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2893c213f49d37a0878dcf14ec68ef991471c70f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Gaah, my bad, I forgot to propagate the dependencies of python3.

The correct fix is:

        depends on BR2_USE_MMU # python3
        depends on BR2_TOOLCHAIN_HAS_THREADS # python3
        depends on !BR2_STATIC_LIBS # python3
	select BR2_PACKAGE_PYTHON3

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
