Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095AFC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C070B83BCB;
	Wed,  7 Feb 2024 15:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n4rLptPExQSs; Wed,  7 Feb 2024 15:59:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B13A183BCC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B13A183BCC;
	Wed,  7 Feb 2024 15:59:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B77461BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4FA383BCC
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4aNcjJyVjIfD for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:59:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 850C683BCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 850C683BCB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 850C683BCB
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:59:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F176913F89C;
 Wed,  7 Feb 2024 16:58:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 16:58:59 +0100
Date: Wed, 7 Feb 2024 16:58:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <ZcOow6Wd11qTf8Qs@landeda>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
 <20240202093625.1409559-5-antoine.coutant@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240202093625.1409559-5-antoine.coutant@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707321545;
 bh=HPx5oezH/1z2ovpW/gY7j7AKvHh5PvD2lPhzVQSf6PI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YKLjpQXjVMfHIhEqKUncRBveclMm1kHNw0MqeW/iA4JsLxxwKSwCjENRN6T9jq92a
 Rde04HCC4INphvxU+Ai3h47jAmt8Qr1roQ1cQKl5i0VxtQ2Sdp1j4ipstMhGsPMeGc
 U9Qy1vHfpExRuoJWzZ8ZN81pd0dM7P0z459+fhGjtZVvblScMs3v895ko0ygn3cmtd
 HyyBIUADGDNqLLsklittagekSTPnOdccRCMAR4YKg8w1hqZYLI0RgS3UumN/1wyWyZ
 JAtEXndCdt8YVU1TwsEtwSDMYAakEJKss0cr1mP6eQOpO+iJYoGV+aEUhMhSdtRPgO
 R3NFBr8A42qTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YKLjpQXj
Subject: Re: [Buildroot] [PATCH v4 4/7] package/opencl-headers: new package
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
Cc: sebastian.weyer@smile.fr, bernd@kuhls.net, romain.naour@smile.fr,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Antoine, All,

On 2024-02-02 10:36 +0100, Antoine Coutant spake thusly:
> From: Sebastian Weyer <sebastian.weyer@smile.fr>
> 
> These headers provide the C language API bindings. It is a complement to
> the C++ bindings already available in opencl-clhpp. This package is
> required to build opencl-icd-loader:
> 
> https://github.com/KhronosGroup/OpenCL-ICD-Loader#dependencies
> 
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
> ---
[--SNIP--]
> diff --git a/package/opencl-headers/Config.in b/package/opencl-headers/Config.in
> new file mode 100644
> index 0000000000..092d8a2a4d
> --- /dev/null
> +++ b/package/opencl-headers/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_OPENCL_HEADERS
> +	bool "opencl-headers"
> +	depends on BR2_PACKAGE_HAS_LIBOPENCL

BR2_PACKAGE_HAS_LIBOPENCL can be set by mesa3d when BR2_PACKAGE_MESA3D_OPENCL
is enabled. In this case, will mesa3d install its own headers? If so,
that will generate a conflict.

Furthermore, this will also conflict with mesa3d-headers, and it also
installs CL headers.

So, why do we need opencl-headers and can't rely on the existing
mesa3d-headers package?

Regards,
Yann E. MORIN.

> +	help
> +	  C language headers for the OpenCL API
> +
> +	  https://github.com/KhronosGroup/OpenCL-Headers
> diff --git a/package/opencl-headers/opencl-headers.hash b/package/opencl-headers/opencl-headers.hash
> new file mode 100644
> index 0000000000..802ed05450
> --- /dev/null
> +++ b/package/opencl-headers/opencl-headers.hash
> @@ -0,0 +1,3 @@
> +#Locally generated
> +sha256  407d5e109a70ec1b6cd3380ce357c21e3d3651a91caae6d0d8e1719c69a1791d  OpenCL-Headers-2023.12.14.tar.gz
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/opencl-headers/opencl-headers.mk b/package/opencl-headers/opencl-headers.mk
> new file mode 100644
> index 0000000000..7aa0e0d168
> --- /dev/null
> +++ b/package/opencl-headers/opencl-headers.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# opencl-headers
> +#
> +################################################################################
> +
> +OPENCL_HEADERS_VERSION = 2023.12.14
> +OPENCL_HEADERS_SOURCE = OpenCL-Headers-$(OPENCL_HEADERS_VERSION).tar.gz
> +OPENCL_HEADERS_SITE = $(call github,KhronosGroup,OpenCL-Headers,v$(OPENCL_HEADERS_VERSION))
> +OPENCL_HEADERS_LICENSE = Apache-2.0
> +OPENCL_HEADERS_LICENSE_FILES = LICENSE
> +OPENCL_HEADERS_INSTALL_STAGING = YES
> +
> +OPENCL_HEADERS_INSTALL_TARGET = NO
> +
> +define OPENCL_HEADERS_INSTALL_STAGING_CMDS
> +	mkdir -p $(STAGING_DIR)/usr/include/CL
> +	$(INSTALL) -D -m 0644 $(@D)/CL/* \
> +		$(STAGING_DIR)/usr/include/CL
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
