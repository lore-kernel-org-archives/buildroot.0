Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BE8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 20:35:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0456060E8C
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 20:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0456060E8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CBA840187;
	Sat, 23 Oct 2021 20:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZOLM6mOqXuwF; Sat, 23 Oct 2021 20:35:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AAB640204;
	Sat, 23 Oct 2021 20:35:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52F161BF30F
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 20:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 420018195D
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 20:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mitH21lLVUhe for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 20:35:30 +0000 (UTC)
X-Greylist: delayed 00:05:17 by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC1E18195C
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 20:35:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 162A52C5;
 Sat, 23 Oct 2021 22:30:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1635021009;
 bh=qTFow5Z/hL6eGNVjEC2/El7I25eifRGF4BS439GWeBE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=MrtPmMeYbRhrtfovPBXzr+qgeZrKnB11fQIqyUaWivq0ZG19RUH2y6PH1qysgOTzo
 oM900Bq2OcOOPKSIeS7P9llpsGr/QA2DRiRXgOe1GK85LDC0lrWaJ5o1AMEJiF8+IY
 BGw8FzeOd0TjtVzA+mZhaNjOWUJTpabG8TgR10g0=
MIME-Version: 1.0
In-Reply-To: <20211022190702.7782-2-ps.report@gmx.net>
References: <20211022190702.7782-1-ps.report@gmx.net>
 <20211022190702.7782-2-ps.report@gmx.net>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Date: Sat, 23 Oct 2021 21:30:06 +0100
Message-ID: <163502100668.362462.687308885851775983@Monstersaurus>
User-Agent: alot/0.9.1
Subject: Re: [Buildroot] [PATCH v1 2/2] package/libcamera: add lc-compliance
 test application option
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
Cc: Stephan Hoffmann <sho@relinux.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Peter Seiderer (2021-10-22 20:07:02)
> - add lc-compliance test application option (and add proper dependencies
>   on gtest and libevent)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libcamera/Config.in    | 18 ++++++++++++++++++
>  package/libcamera/libcamera.mk |  7 +++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index b7f0e5b05d..23a0040abf 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -72,6 +72,24 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC
>         help
>           Pipeline for the vimc device.
>  
> +config BR2_PACKAGE_LIBCAMERA_COMPLIANCE
> +       bool "lc-compliance test application"
> +       depends on BR2_USE_WCHAR # gtest
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # gtest
> +       depends on BR2_INSTALL_LIBSTDCPP # gtest
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gtest

I think we stipulate a minimum gcc 7 on libcamera support, but this is
for gtest ...

Other than that, this is better than simply disabling.


Acked-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


> +       depends on BR2_USE_MMU # gtest
> +       select BR2_PACKAGE_GTEST
> +       select BR2_PACKAGE_LIBEVENT
> +       help
> +         lc-compliance test application
> +
> +comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
> +       depends on BR2_USE_MMU
> +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +               !BR2_INSTALL_LIBSTDCPP || \
> +               !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +
>  endif # BR2_PACKAGE_LIBCAMERA
>  
>  comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 8ab95fb42a..5a5f2800b9 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -61,6 +61,13 @@ LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC) += vimc
>  
>  LIBCAMERA_CONF_OPTS += -Dpipelines=$(subst $(space),$(comma),$(LIBCAMERA_PIPELINES-y))
>  
> +ifeq ($(BR2_PACKAGE_LIBCAMERA_COMPLIANCE),y)
> +LIBCAMERA_DEPENDENCIES += gtest libevent
> +LIBCAMERA_CONF_OPTS += -Dlc-compliance=enabled
> +else
> +LIBCAMERA_CONF_OPTS += -Dlc-compliance=disabled
> +endif
> +
>  # gstreamer-video-1.0, gstreamer-allocators-1.0
>  ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
>  LIBCAMERA_CONF_OPTS += -Dgstreamer=enabled
> -- 
> 2.33.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
