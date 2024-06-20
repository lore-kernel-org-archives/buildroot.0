Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D153C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 13:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 134774350B;
	Thu, 20 Jun 2024 13:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFTHUJbS7OKb; Thu, 20 Jun 2024 13:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCA8B4352A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCA8B4352A;
	Thu, 20 Jun 2024 13:14:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CC461BF852
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 13:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76EE94352A
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 13:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aW4ineG5ZHqF for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 13:14:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=kieran.bingham@ideasonboard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 388CA4350B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 388CA4350B
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 388CA4350B
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 13:14:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3FD22B3
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 15:14:07 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <20240620125133.1593259-1-kieran.bingham@ideasonboard.com>
References: <20240620125133.1593259-1-kieran.bingham@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: 
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 14:14:23 +0100
Message-ID: <171888926397.2248009.2530869245404958748@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1718889248;
 bh=GsiNjaW1HdxbOiftUDQGnSnhIKy1dmUZ5NFQzLwz2G0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=vpHsBxRvSQ7bON9F6mAkhC5KxrNw+yWwoq9/iQInmlZHk2ccmKAw4RB8AMPOuLpZm
 xPRkgNxifcz+SLtrnH2XITosCamd8piupZd5j1OeUlbz9GXC6B141Lia+xZ4jeoGNL
 JDk/e5BDn8lyDv42xrwFNxlUdo4n9dxFNC6lAaRs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ideasonboard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=vpHsBxRv
Subject: Re: [Buildroot] [PATCH] package/libcamera: Enable python bindings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Kieran Bingham (2024-06-20 13:51:33)
> Since libcamera commit f513fd70ba1a ("subprojects: Drop leftovers of
> pybind11"), merged before libcamera v0.1.0, libcamera has no longer
> relied on an external subproject branch of pybind to build the python
> bindings.
> 
> Enable python bindings in libcamera when Python3 is selected in the
> configuration, by also bringing in pybind as required and enabling the
> option within the libcamera meson setup stage.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  package/libcamera/Config.in    | 1 +
>  package/libcamera/libcamera.mk | 8 +++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index e84b8d342eea..2368a5b8008c 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -15,6 +15,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
>         select BR2_PACKAGE_GNUTLS
>         select BR2_PACKAGE_LIBYAML
>         select BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO if !BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
> +       select BR2_PACKAGE_PYTHON_PYBIND if BR2_PACKAGE_PYTHON3

So - I determined how to do this from BR2_PACKAGE_ZXING_CPP, which
always builds it's python binding if python3 is available - but I think
looking at other python binding packages, the PYCAMERA should be behind
a specific option which is enabled when PYTHON3 is available, so it
'could' be disabled I guess. Perhaps more like
BR2_PACKAGE_GNURADIO_PYTHON.

I'd probably default to enabled if python3 is enabled though.
Is there a project preference?

--
Kieran



>         help
>           libcamera provides a software stack to support
>           complex devices that need heavy hardware image
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index dfcd340b75a0..50429a1df9ce 100644
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
> @@ -77,6 +76,13 @@ LIBCAMERA_CONF_OPTS += -Dgstreamer=enabled
>  LIBCAMERA_DEPENDENCIES += gstreamer1 gst1-plugins-base
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)


> +LIBCAMERA_DEPENDENCIES += python3 python-pybind
> +LIBCAMERA_CONF_OPTS += -Dpycamera=enabled
> +else
> +LIBCAMERA_CONF_OPTS += -Dpycamera=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
>  LIBCAMERA_CONF_OPTS += -Dqcam=enabled
>  LIBCAMERA_DEPENDENCIES += qt5base
> -- 
> 2.34.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
