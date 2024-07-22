Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD10C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 09:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F22B40201;
	Mon, 22 Jul 2024 09:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDkS3I2di1QW; Mon, 22 Jul 2024 09:46:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AF3940320
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AF3940320;
	Mon, 22 Jul 2024 09:46:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 145541BF28E
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 09:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D9B140266
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 09:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNm3LazpZNQT for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 09:46:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=kieran.bingham@ideasonboard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6BBA54024A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BBA54024A
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BBA54024A
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 09:46:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 230B645B;
 Mon, 22 Jul 2024 11:45:18 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <20240620134959.1673948-1-kieran.bingham@ideasonboard.com>
References: <20240620134959.1673948-1-kieran.bingham@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 10:45:56 +0100
Message-ID: <172164155656.2376022.12341161125478720243@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1721641518;
 bh=fUUN4nxC8bxAQbcS+RvVzX2shLxJCa3I8b/VOHSvGMg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=uRUwJt0DkZluC102FXaS4Wmn1Y5gmgsL6wKxLWvbkyKg11Sl4Sky8H2Xgi7If1Ayd
 NVBILYepJ3ODAoUOPbiaIzm41CYGx0lFqH0SNo1LfcEN5MnchbqMJGwWVznRH/yv6J
 eRwrkD8FVX58tL9jEBgU+KVLtwoL8SJAXrKIk95k=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ideasonboard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=uRUwJt0D
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: Enable python bindings
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus,

Quoting Kieran Bingham (2024-06-20 14:49:59)
> Since libcamera commit f513fd70ba1a ("subprojects: Drop leftovers of
> pybind11"), merged before libcamera v0.1.0, libcamera has no longer
> relied on an external subproject branch of pybind to build the python
> bindings.
> 
> Provide a new package option to allow enabling the python bindings on
> libcamera when python3 is available in the buildroot configuration.
> Enabling the python bindings will select and bring in pybind as a
> dependency.

Sorry for not adding you to Cc on the first send.
Could you review or test this patch for me please?

--
Regards

Kieran

> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  package/libcamera/Config.in    | 7 +++++++
>  package/libcamera/libcamera.mk | 8 +++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index e84b8d342eea..4699e382c760 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -24,6 +24,13 @@ menuconfig BR2_PACKAGE_LIBCAMERA
>  
>  if BR2_PACKAGE_LIBCAMERA
>  
> +config BR2_PACKAGE_LIBCAMERA_PYTHON
> +       bool "python bindings"
> +       depends on BR2_PACKAGE_PYTHON3
> +       select BR2_PACKAGE_PYTHON_PYBIND
> +       help
> +         Enable libcamera python bindings
> +
>  config BR2_PACKAGE_LIBCAMERA_V4L2
>         bool "libcamera v4l2 compatibility layer"
>         help
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index dfcd340b75a0..100934a97d6f 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -19,7 +19,6 @@ LIBCAMERA_CONF_OPTS = \
>         -Dandroid=disabled \
>         -Ddocumentation=disabled \
>         -Dtest=false \
> -       -Dpycamera=disabled \
>         -Dwerror=false
>  LIBCAMERA_INSTALL_STAGING = YES
>  LIBCAMERA_LICENSE = \
> @@ -45,6 +44,13 @@ ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_7),y)
>  LIBCAMERA_CXXFLAGS = -faligned-new
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBCAMERA_PYTHON),y)
> +LIBCAMERA_DEPENDENCIES += python3 python-pybind
> +LIBCAMERA_CONF_OPTS += -Dpycamera=enabled
> +else
> +LIBCAMERA_CONF_OPTS += -Dpycamera=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBCAMERA_V4L2),y)
>  LIBCAMERA_CONF_OPTS += -Dv4l2=true
>  else
> -- 
> 2.34.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
