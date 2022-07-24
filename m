Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B0BC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 14:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D309441864;
	Sun, 24 Jul 2022 14:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D309441864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Qn2zVt8evha; Sun, 24 Jul 2022 14:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 789474157A;
	Sun, 24 Jul 2022 14:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 789474157A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 294371BF3D8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02FCD40443
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02FCD40443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jVoiHi7dMLmi for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 14:53:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FF44400B9
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FF44400B9
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:53:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 856E4240008;
 Sun, 24 Jul 2022 14:53:28 +0000 (UTC)
Date: Sun, 24 Jul 2022 16:53:27 +0200
To: "Michael Nosthoff" <michael@nosthoff.rocks>
Message-ID: <20220724165327.5b22ff1c@windsurf>
In-Reply-To: <48-62dd4800-5-54f5770@160071985>
References: <43e30f67-d82b-b6af-13bc-cc2088b3e253@mind.be>
 <48-62dd4800-5-54f5770@160071985>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658674409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wlSZUu0JiBI5oC4lsvf+4iaxMXaspCRseHXFKgMP/mc=;
 b=ikkeHoNLTTvjxDww3fXjcmpum1uBHlaseZ8lZ/i/Aw0tuQDvf+v4Q4dL1T9aijeV58rUbZ
 d/+P4swp/iBJz5UKQ0dBGkxXqR3viq2sX1odu9D0m6EXquhEe5PRDXohGLAgwaC24lV6zR
 VsPwNm3nc4dyhgwIXE9v++AdExSMhr2BPfygksLTdXZhwyR9WNytURAzoMg24g1/mkL3tj
 ssN+z//l0Che31P7WPco5oKc/FYUDkL19dtfrGHWEQzIwwpYPrEz3ktyl4j9k+RW5dqfh3
 4U4/YwbVeja0HlV3vfiMjHV/Bv1O0JyZXIGeI6feqAyTFQV4zMkDdzkcxECVBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ikkeHoNL
Subject: Re: [Buildroot] [PATCH v2] package/cog: add libgbm as dependency
 when building with DRM support
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
Cc: aperez@igalia.com, Alexandru Ardelean <ardeleanalex@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Sun, 24 Jul 2022 15:25:00 +0200
"Michael Nosthoff" <michael@nosthoff.rocks> wrote:

> I'm currently maintaining an external package for the newest ti-sgx-um version which provides
> (i think) a newer/more complete version of libegl/libgbm. For this I currently have to patch
> the cog package but the output is working fine with the drm backend.

Wow, do you have that available somewhere? I'm also working on a
project that uses ti-sgx, we're also working on updating it to the
latest version from TI, and we had issues with libgbm being
insufficient to run Cog.

> Is there a way to find out which features a certain libegl/libgbm provides? Maybe I can then pick-up
> the work on bumping the ti-sgx-um/km packages again to bring them to a more recent version.

It is explained in package/opengl/libgbm/Config.in:

# gbm implementations should select
# BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT if they
# provide the format modifier plane count feature. This API was
# initially introduced in mesa3d version 17. A gbm implementation
# provides this feature if it is implement function
# gbm_device_get_format_modifier_plane_count.
config BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
        bool
        depends on BR2_PACKAGE_HAS_LIBGBM

# gbm implementations should select
# BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF if they provide the dma
# buffer feature. This API was initially introduced in mesa3d version
# 10. A gbm implementation provides this feature if it is implement
# function gbm_bo_get_fd.
config BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
        bool
        depends on BR2_PACKAGE_HAS_LIBGBM

So basically, you can readelf on libgbm.so, and based on the functions
that it provides, decide which of the above feature flag your ti-sgx-um
package should select.

If you need some help on this, feel free to get in touch on IRC (if
you're not already there), I'll be happy to have a look as I'm
interested in Cog + ti-sgx-um.

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
