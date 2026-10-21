Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C42606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 21:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PudN5spW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F3CD61590;
	Wed, 21 Oct 2026 21:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HeKu-t9BngLo; Wed, 21 Oct 2026 21:48:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 90D5361583
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792619321;
	b=LeRjvb5UUe6FwB9O37TD0y8cqv4XLuHlXds4Aa8N22MZCajJq8fQ54cT8veIFH6L3lhI
	 8pRfF2WTur1yj5t67zNBlHzY0jIWU+xxP3D1JD3k8qpctGohI7WVPgqaAn1EIqHIlFE6g
	 kP8SRJ8a/XnlAbVE1gHZzIQ86fqmJ0Hz0wQEnRmG/RL/m1rqjOqFJvT3efM1QTMh5Q1Ld
	 NlUjGQLW6DLaz4EaYjs2O8ZBsHi+duzAqVMcd2K0xfQYWnbwsjYkgkPXf/r3hkYsx82bL
	 VRNoscJ1yO/6Qji2E/RPMatRoRndlEWbhDurBso2sQw0LRTGvRj8FDL9RoWNVdUTUhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792619321;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GeevodLpNoJDJZa4x/GNT6wvSmkSMpYt3wZm3XK+OPY=;
	b=LkqSV0L7KFVikJDAeBQ9uJNzKfNSGRQB4asv/tdu5Hce8EAPka+cqLRbOY7pJvfUSXcC
	 R+r32fCaoO14nlzMaf8tJuu7Du/s5cltYs/0dIENp9kRTgZ2bJU5Qr4jqGuJkTsJ0UbPQ
	 VuRFDfQpNCveEpTDhEOBrp46sQ66xCvg8i95xxieXvnqqdKYhmVtclz9TM2gfnaxHjLDe
	 TkJiOTaeFe+AQQPgOPoN1BAwwwJ+7xDISHbNUas7/FrgIC0dk+SpWH3Cr9L5MpmiFGnmq
	 GKRGcmBijiWrxokLcat7ZcIw2iw/kFVR5CI0BtVYo1VoC3lX3gUnsLlsiV2ZudC9wUw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792619321;
	bh=GeevodLpNoJDJZa4x/GNT6wvSmkSMpYt3wZm3XK+OPY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PudN5spWnHERY7PCG27buRJP3t9lgmfwSFuwyvGSpfqlFGjJ7AuO2diCBTKZoYaJs
	 pu+XjQbK5Yebm+Bet5zAnMiGGtPb18ZDVtTwkwjelsir6yiQRGYf2EiB5k4K7pEES9
	 HN0olwGDVvRFpV6fxSsp2g9emr+j737GdDmt1FWYQYa3mtTwXtQq7b3gYvl6yGL1Zw
	 WNpdD0tea4gcy4Bgl7oc/f87Rr8L0gm5wznVZAEjcnaUYTrn/8NFSU9Fx3//N2q+G+
	 MrdvnOtDXXtsFnOfmb2Oav9ISZhZxuXfzPEHF10Kl+9vrU+ZrZFnlSSh9UsQc7YxsZ
	 7WE3fN+6egH3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90D5361583;
	Wed, 21 Oct 2026 21:48:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B5A01AB
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0172D40EAE
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zz36jllM7BJ for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 21:48:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 576E840EA0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792619318;
 b=afslGOvP5TuqiLXtzt2ktWrAi63+WcgwcB0yI/yv62DPHj6eHOyXyHr3SJLmSMGDzPKz
 gi62lOcRO00+LUqeKqco65NWj1gspy5lYvvr0dku2iv1Pf3XbpyzwVqLNKhOQwQGcXvHh
 JAUqPGtQ6gM+aDDln4axJyw6fRU6fI7oFVp5aaUp0SKMDl9ByZRrUCFHFqNK39WK4YsIL
 rFpqnD2P8oQ+66z6+VeTTAVv/j8TUyu+GeFxRAZ4q4TiQnf3EeJDQ1Hh8+6jbQjTjwC8G
 YGVwx4rk4gYkESsuXw0rS25bRF8Ck3Q485pkw1lJJx8t+15umHMGkW5knoAU1YT/4HA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792619318;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=F0tQZ86pfPbBYmQlwQE/wAzTndnIzgk2Um2swe+CjoY=;
 b=dvVvQ9+z+LJVOhWwjYnon70Pts13KXKw9b0J6sa7xT3WD5AuEu4Eq7AIJoioI18YnAka
 BHcpRkYhVV+u8QsFYcRwOFOcuwR8eQ/2xNycLXw0EYlgmd70P5f+N3LFQCWlEixCybQIe
 M/Kra19Wn+X+3PiQOOiPMyPEqpVy/1lKuJS2CWhNa2vHmG7KOr9utgQMS2l0CuAAt4rp2
 zLRBTcKVADCJ+Mg/Fsri8y+fE1Xl4X2AxS6yXtNvd+qkb4J7JhDYkHkzbg/hyXg5w9xR1
 v7M5kvEgbd0XrsKy33dPA1XUBFAqMdueu0iWtzMni0D7malyNvWSK/T2r8KR0k5PMkQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=lzXUfGAt; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 576E840EA0
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:48:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B2590C5CD6A;
 Wed, 21 Oct 2026 21:49:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7F766606E3;
 Wed, 21 Oct 2026 21:48:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D6FE410328DD2; 
 Wed, 21 Oct 2026 23:48:27 +0200 (CEST)
Date: Wed, 21 Oct 2026 23:48:26 +0200
To: John Ernberg <j@j-ernberg.se>
Cc: buildroot@buildroot.org, John Ernberg <john.ernberg@actia.se>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <atkwl965cKxez-Es@windsurf>
References: <20260614155328.304282-1-j@j-ernberg.se>
 <20260614155328.304282-6-j@j-ernberg.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260614155328.304282-6-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 5/8] package/libcamera-apps: Only enable
 EGL if both epoxy and xlib_libX11 are selected
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Jun 14, 2026 at 05:53:25PM +0200, John Ernberg wrote:
> Since release 0.2 of the rpicam-apps these dependencies have been required
> if enable_egl=True is given to meson. [1]
> 
> The dependency check was broken since commit 3fac163b9315
> ("package/libcamera-apps: bump to version 1.1.0") in early 2023.
> 
> Link: https://github.com/raspberrypi/rpicam-apps/commit/c8351a09174f143424884081a69b6dd8018f4ba3#diff-a2468a39040f9f883e5b03e1523dd4e73fd43ad9ea87f600772477b890cdd655L18-R22

This commit is only reorganizing meson options, I think the commit
actually introducing the requirement for epoxy+xlib is older than this
one.

> Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
> Signed-off-by: John Ernberg <j@j-ernberg.se>

I believe this would fix:

  https://autobuild.buildroot.net/results/21d/21dcd20d70c12758083733b0e5bc8f1efc671370/build-end.log

> -ifeq ($(BR2_PACKAGE_XORG7),y)
> -LIBCAMERA_APPS_DEPENDENCIES += \
> -	$(if $(BR2_PACKAGE_LIBEPOXY),libepoxy) \
> -	$(if $(BR2_PACKAGE_XLIB_LIBX11),xlib_libX11)
> +ifeq ($(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_XLIB_LIBX11),yy)
> +LIBCAMERA_APPS_DEPENDENCIES += libepoxy xlib_libX11
>  LIBCAMERA_APPS_CONF_OPTS += -Denable_egl=enabled
>  else
>  LIBCAMERA_APPS_CONF_OPTS += -Denable_egl=disabled

However, I'm not 100% convinced this is the right fix because the
Config.in also has:

	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
	select BR2_PACKAGE_LIBEPOXY if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)

I can't really wrap my head around what's the right way to deal with
all those dependencies.

With your change:

 +ifeq ($(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_XLIB_LIBX11),yy)
 +LIBCAMERA_APPS_DEPENDENCIES += libepoxy xlib_libX11
  LIBCAMERA_APPS_CONF_OPTS += -Denable_egl=enabled

We may be passing -Denable_egl=enabled even if there's no OpenGL
support at all: libepoxy can now be enabled without any OpenGL
provider enabled, and xlib_libx11 also doesn't guarantee that we have
OpenGL support.

I honestly don't quite understand those selects in the Config.in
file. My understanding is that libcamera-apps has a preview/ folder
with several variants: drm-preview, egl-preview, wayland-egl-preview,
qt-preview and null-preview. Maybe we should instead handle these more
clearly/explicitly?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
