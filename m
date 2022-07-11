Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E6FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 20:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 855AC42168;
	Mon, 11 Jul 2022 20:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 855AC42168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t9X3MVHHg2B8; Mon, 11 Jul 2022 20:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C4A242169;
	Mon, 11 Jul 2022 20:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C4A242169
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 375211BF301
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 20:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FB3960FF9
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 20:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FB3960FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENzg5w4jxTYN for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 20:00:02 +0000 (UTC)
X-Greylist: delayed 00:06:52 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5126F61036
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5126F61036
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 20:00:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3C68326;
 Mon, 11 Jul 2022 21:53:07 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <20220711131823.116481-1-foss+buildroot@0leil.net>
References: <20220711131823.116481-1-foss+buildroot@0leil.net>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Date: Mon, 11 Jul 2022 20:53:05 +0100
Message-ID: <165756918502.1398129.13899758729447253604@Monstersaurus>
User-Agent: alot/0.10
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1657569187;
 bh=eeQHoISgwjE+SEePEqGqjJnptumjcj2IU6PjChU5xBM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=NkQljuB0aAhwL8f/j90dhz0SNkCi3o68ASBM4owdOXazULhzGw7Z754gpXRZAMfMk
 Ef6AWfDzLavf9krgI3YgnCYhwMperWB9+xQJVqaZk8NVLdkOt1AhWTXuExwXrOvL2h
 NQCvNAekUEZuG10dHiGunIKcwEg+jVOoaXrAPLDs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=NkQljuB0
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: add explicit
 dependency on libevent if libevent package to be built
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Quentin Schulz (2022-07-11 14:18:23)
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> The cam application requires libevent. Since there's no Kconfig option
> for it, cam building ability is checked by meson build system by default.
> 
> If libevent is present in the sysroot, cam is built.
> 
> The issue is that there's no explicit dependency on libevent in
> libcamera package. This means that it is possible for libevent AND
> libcamera to be built, but have libcamera be built before libevent.
> Meaning that even if all requirements seem to be fulfilled, cam still
> won't be enabled in some cases.
> 
> This fixes the possible race by expliciting the dependency to libevent
> if the libevent package is enabled. Otherwise, explicitly disable cam
> building as it's already known that it isn't going to build.

I'm not opposed to this as it fixes the race though. I guess it depends
how much resistance there is to adding a specific libcamera kconfig
option to select cam.

> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
> 
> v2:
>  - added -Dcam=enabled when libevent package is enabled, to catch
>  possible additional dependencies to cam in later upgrades,
> 
>  package/libcamera/libcamera.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 41d6a5abef..3f336cb797 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -84,6 +84,13 @@ else
>  LIBCAMERA_CONF_OPTS += -Dqcam=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBEVENT),y)
> +LIBCAMERA_CONF_OPTS += -Dcam=enabled
> +LIBCAMERA_DEPENDENCIES += libevent
> +else
> +LIBCAMERA_CONF_OPTS += -Dcam=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_TIFF),y)
>  LIBCAMERA_DEPENDENCIES += tiff

I see we're already doing things like this though... And I think tiff is
only used by cam? (Or perhaps also qcam).

--
Kieran


>  endif
> -- 
> 2.36.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
