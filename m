Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFD5CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 12:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D95C1610F9;
	Sun, 17 Sep 2023 12:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D95C1610F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nsf27cuz67iz; Sun, 17 Sep 2023 12:47:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 140CC610F6;
	Sun, 17 Sep 2023 12:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 140CC610F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA87C1BF473
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93C50610F6
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93C50610F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgloUqx3AVnD for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 12:47:43 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DC1F610F4
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DC1F610F4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E7BFCB0053E;
 Sun, 17 Sep 2023 14:47:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 14:47:39 +0200
Date: Sun, 17 Sep 2023 14:47:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230917124739.GT415981@scaer>
References: <20230917112828.9695-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230917112828.9695-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694954862;
 bh=H6XFBQcSeUtvwayuyp5+BoJtFYsXMC+o3/6aj2RJ6yI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a3pApwvi/nEUnH8X7IzmVyG8k4I5cByp8BHEx3wIw/etZ5qBhkZutBFDGG+1akBKt
 TLA0KaE/uZrxgF585+RJMcs8MUPmo1ky5DNwMODxr453jEfjOEXiGdnRnFBAwo/Tmn
 cPUPopzGLhxvVUVd7OHJGQdlxyqGwiWmfCTAiT3rPcE9/2z6yQHyLrdxcO7DX6aV6Q
 g25TjqVPxGNDkhbx/2uz+S/DYqDC6mqCH09Q9h+/b9pPZFGFxrWVoy34FVHq24rOOI
 Disr4CJ1aoikuVAC6k/MsCIxvwuz+SrxhSGwYgYio0KnqTfuOzSXJxyQocVpuM+n+J
 Ul3U0MJz40gQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a3pApwvi
Subject: Re: [Buildroot] [PATCH 1/1] package/libeaw: fix CVE-2023-1729
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-09-17 13:28 +0200, Fabrice Fontaine spake thusly:
> A flaw was found in LibRaw. A heap-buffer-overflow in raw2image_ex()
> caused by a maliciously crafted file may lead to an application crash.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...shrink-flag-for-3-4-component-images.patch | 24 +++++++++++++++++++
>  package/libraw/libraw.mk                      |  3 +++
>  2 files changed, 27 insertions(+)
>  create mode 100644 package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch
> 
> diff --git a/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch b/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch
> new file mode 100644
> index 0000000000..ef93e0901b
> --- /dev/null
> +++ b/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch
> @@ -0,0 +1,24 @@
> +From 477e0719ffc07190c89b4f3d12d51b1292e75828 Mon Sep 17 00:00:00 2001
> +From: Alex Tutubalin <lexa@lexa.ru>
> +Date: Sat, 14 Jan 2023 18:32:59 +0300
> +Subject: [PATCH] do not set shrink flag for 3/4 component images
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/LibRaw/LibRaw/commit/477e0719ffc07190c89b4f3d12d51b1292e75828
> +---
> + src/preprocessing/raw2image.cpp | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/preprocessing/raw2image.cpp b/src/preprocessing/raw2image.cpp
> +index e65e2ad7..702cf290 100644
> +--- a/src/preprocessing/raw2image.cpp
> ++++ b/src/preprocessing/raw2image.cpp
> +@@ -43,6 +43,8 @@ void LibRaw::raw2image_start()
> + 
> +   // adjust for half mode!
> +   IO.shrink =
> ++	  !imgdata.rawdata.color4_image && !imgdata.rawdata.color3_image &&
> ++	  !imgdata.rawdata.float4_image && !imgdata.rawdata.float3_image &&
> +       P1.filters &&
> +       (O.half_size || ((O.threshold || O.aber[0] != 1 || O.aber[2] != 1)));
> + 
> diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
> index b6616f0c10..cbd509cfea 100644
> --- a/package/libraw/libraw.mk
> +++ b/package/libraw/libraw.mk
> @@ -18,6 +18,9 @@ LIBRAW_DEPENDENCIES = host-pkgconf
>  LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
>  LIBRAW_CONF_ENV = CXXFLAGS="$(LIBRAW_CXXFLAGS)"
>  
> +# 0001-do-not-set-shrink-flag-for-3-4-component-images.patch
> +LIBRAW_IGNORE_CVES += 0001-do-not-set-shrink-flag-for-3-4-component-images.patch
> +
>  ifeq ($(BR2_PACKAGE_JASPER),y)
>  LIBRAW_CONF_OPTS += --enable-jasper
>  LIBRAW_DEPENDENCIES += jasper
> -- 
> 2.40.1
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
