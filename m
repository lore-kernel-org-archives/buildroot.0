Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EEAC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E6A1813F1;
	Wed, 27 Jul 2022 07:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E6A1813F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rHQ9gT7UIL7s; Wed, 27 Jul 2022 07:29:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A92E81310;
	Wed, 27 Jul 2022 07:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A92E81310
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E30951BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD51360ACC
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD51360ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cfPxr0j-14Ct for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:29:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80DFD60AC0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80DFD60AC0
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:29:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8233E240005;
 Wed, 27 Jul 2022 07:29:35 +0000 (UTC)
Date: Wed, 27 Jul 2022 09:29:34 +0200
To: Gilles Talis <gilles.talis@gmail.com>
Message-ID: <20220727092934.73f3404c@windsurf>
In-Reply-To: <20220116175320.453041-1-gilles.talis@gmail.com>
References: <20220116175320.453041-1-gilles.talis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658906975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/cIkqzmIhn7oYU95IQidogBmTl85sBJFeiUQDB3MKE=;
 b=BnWBgiZ5aMFatgNdkSjx7VYZLyN5qVIvxz+zYvp7fw0PLdnFthByu140B9gq7+LG11AWMV
 wOwZg54tRsgUt2jQHtB0yoDDKYoNbyG2SDjvYMgD7plA6sTJ2pkU/cSLSiSbRcDCdOJEun
 21WLQnER8SnS9MkrXTtiYYG1QF3NP4dJxOgK4zSmRgmAtob6ZrVr1dUWMp1Er5/GKJowZz
 iji3PLvyaXv477pP6IVBMLHVaTHJCK1woHT0Yh/TmsJHMZS3ADDQWrEVnFymjPs87pqO1H
 4i6Q/KrZscHgIupBr8S6r08eWje9mzr70Eo+ef4fMAFWFDsxjvS/V/ZSj/ifUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BnWBgiZ5
Subject: Re: [Buildroot] [PATCH 1/2] package/opencl-clhpp: new package
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

Hello Gilles,

On Sun, 16 Jan 2022 18:53:19 +0100
Gilles Talis <gilles.talis@gmail.com> wrote:


> diff --git a/package/opencl-clhpp/Config.in b/package/opencl-clhpp/Config.in
> new file mode 100644
> index 0000000000..12045be055
> --- /dev/null
> +++ b/package/opencl-clhpp/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_OPENCL_CLHPP
> +	bool "opencl-clhpp"
> +	depends on BR2_INSTALL_LIBSTDCPP

I've added a dependency on BR2_PACKAGE_HAS_LIBOPENCL here. While it is
not needed for this package to build (because it now only install
headers), all users of opencl-clhpp will need to have this dependency.

> diff --git a/package/opencl-clhpp/opencl-clhpp.hash b/package/opencl-clhpp/opencl-clhpp.hash
> new file mode 100644
> index 0000000000..27b27cd80c
> --- /dev/null
> +++ b/package/opencl-clhpp/opencl-clhpp.hash
> @@ -0,0 +1,3 @@
> +# Locally Computed
> +sha256  869456032e60787eed9fceaeaf6c6cb4452bc0ff97e0f5a271510145a1c8f4d4  opencl-clhpp-2.0.16.tar.gz
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
> diff --git a/package/opencl-clhpp/opencl-clhpp.mk b/package/opencl-clhpp/opencl-clhpp.mk
> new file mode 100644
> index 0000000000..610cd45b62
> --- /dev/null
> +++ b/package/opencl-clhpp/opencl-clhpp.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# opencl-clhpp
> +#
> +################################################################################
> +
> +OPENCL_CLHPP_VERSION = 2.0.16
> +OPENCL_CLHPP_SITE = $(call github,KhronosGroup,OpenCL-CLHPP,v$(OPENCL_CLHPP_VERSION))
> +OPENCL_CLHPP_LICENSE = Apache-2.0
> +OPENCL_CLHPP_LICENSE_FILES = LICENSE.txt
> +OPENCL_CLHPP_INSTALL_STAGING = YES
> +
> +# OpenCL_CLHPP is a header-only library
> +OPENCL_CLHPP_INSTALL_TARGET = NO
> +
> +$(eval $(cmake-package))

As suggested by Romain, I have used generic-package and a simple
OPENCL_CLHPP_INSTALL_STAGING_CMDS to just install the two headers to
avoid the need for a C++11 compiler.

Applied with those changes, thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
