Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585C3C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FF4642606;
	Sat, 11 Dec 2021 20:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unV4GIWoxDhv; Sat, 11 Dec 2021 20:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 384DF42601;
	Sat, 11 Dec 2021 20:47:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44FAF1BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32F2760D75
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yNiF-ZvGBPIs for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:47:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F21E60D4B
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:47:05 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id r11so39642006edd.9
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 12:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=wU7Oe+pkHwIWTzFh5APw+zcQ8jQUDlbM5HXu/U8VZEQ=;
 b=R7MHvIekDP7aD+y2SDlXso08pEgs5YD1APWX0CQSfQ8Zm/tHvwJjPdzP6UTJym+Lrk
 lyoA1Rin5bppcOe714KQkoYHTtavi+D9piJ9iLEoQ2CAh8KvGyedgnJS54rHp0HJfFqJ
 Y6fmwS7prBmTCo1tcOUBrbFx2I38o6uu0Zah/gm7jdNMfprDhI1aiQkBr3UVKyLP+Fz/
 OJSvcLLLeteW5J1C467zZRd7ycI1DDX7aT1Q7fPZr8U6+MEtLKs7VSU0/svyfasqO9Y5
 wIZM4+89dtkNR23BQs4dXcyeWeAo4g5227rDCvqMcEqdgBuu5T129pLLUrgDYTvzRAcU
 ywEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wU7Oe+pkHwIWTzFh5APw+zcQ8jQUDlbM5HXu/U8VZEQ=;
 b=Kx6N2zG2mduwuTqlxECodCX4+ZCqgd6aXxJXHEdzMVq1keB2sGHfvJq1TU3DACgE2I
 n7PO6zYn2Jcig7LTgqbpuW+u/IW9eAbvBr6k26YFs/9sYMVyNDkSwSjLXY859B/vCYSC
 ceBgGotL5OgZfA80p/5VNGfLc2PG78Q5QuKspErZxSXaDKQUuZ6eT1JlIYOC+XjLprFL
 xq7G0kccbMWhafjTuffRgLV92pykJpSvRTNfYRdqsJkPuilqarD9lAsmmdMla7gFu0vo
 caaLVvErIvRrVNzAeTyXwWmV2Wc+Cyr5R5wGBdHqeH9rc9XD+OfYu6mkQPi7O4s/LUGz
 JGQw==
X-Gm-Message-State: AOAM5327CDNyFviztZ880IUnEIbYppVlwVkOGXIAqspdltd8x7dr4tC7
 mQZNRnohgIuRU8EZp6UKJDQckRsSFlMkYDgxZsM=
X-Google-Smtp-Source: ABdhPJxMhRp752JCfuMrngcbAv9mi2CFh5DQRaCpw+0MPPm7FkXquTPJBSGELdRbx8opt7MAqzorXg==
X-Received: by 2002:a17:907:1c15:: with SMTP id
 nc21mr32962726ejc.510.1639255624280; 
 Sat, 11 Dec 2021 12:47:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id dm6sm3606339ejc.89.2021.12.11.12.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 12:47:03 -0800 (PST)
Message-ID: <fc2e4442-6c22-6b40-e259-3e93c7717973@mind.be>
Date: Sat, 11 Dec 2021 21:47:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20211124205607.3021277-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211124205607.3021277-1-aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: bump version to
 2.34.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/11/2021 21:56, Adrian Perez de Castro wrote:
> Update to the the next minor release, which fixes an scrolling issue and
> incorporated a patch that can now be removed from Buildroot. Release
> notes:
> 
>    https://wpewebkit.org/release/wpewebkit-2.34.2.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...e-build-issues-with-ENABLE_VIDEO-OFF.patch | 78 -------------------
>   package/wpewebkit/wpewebkit.hash              |  8 +-
>   package/wpewebkit/wpewebkit.mk                |  2 +-
>   3 files changed, 5 insertions(+), 83 deletions(-)
>   delete mode 100644 package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch
> 
> diff --git a/package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch b/package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch
> deleted file mode 100644
> index 932ade101c..0000000000
> --- a/package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -From afc83d41293333f694630451f865a7a257a9b917 Mon Sep 17 00:00:00 2001
> -From: Adrian Perez de Castro <aperez@igalia.com>
> -Date: Mon, 25 Oct 2021 23:45:15 +0300
> -Subject: [PATCH] [WPE][GTK] Multiple build issues with ENABLE_VIDEO=OFF
> - https://bugs.webkit.org/show_bug.cgi?id=232264
> -
> -.:
> -
> -Reviewed by NOBODY (OOPS!).
> -
> -* Source/cmake/WebKitFeatures.cmake: Make ENABLE_MEDIA_SESSION depend on ENABLE_VIDEO.
> -
> -Source/WebCore:
> -
> -Reviewed by NOBODY (OOPS!).
> -
> -No new tests needed.
> -
> -* accessibility/AXObjectCache.cpp:
> -(WebCore::isSimpleImage): Guard usage of HTMLMediaElement with ENABLE(VIDEO).
> -* page/EventHandler.cpp:
> -(WebCore::EventHandler::textRecognitionCandidateElement const): Ditto.
> -* platform/graphics/BifurcatedGraphicsContext.cpp: Ditto.
> -* platform/graphics/displaylists/DisplayListRecorder.h: Guard usage of MediaPlayer with
> -ENABLE(VIDEO).
> -* platform/graphics/displaylists/DisplayListRecorderImpl.cpp: Ditto.
> -* platform/graphics/displaylists/DisplayListRecorderImpl.h: Ditto.
> -
> -Source/WebKit:
> -
> -* WebProcess/WebCoreSupport/ShareableBitmapUtilities.cpp:
> -(WebKit::createShareableBitmap): Guard usage of RenderVideo with ENABLE(VIDEO).
> -
> -Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ----
> -Upstream status: https://trac.webkit.org/changeset/284858/webkit
> -
> - Source/WebCore/accessibility/AXObjectCache.cpp                 | 2 ++
> - Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp | 2 ++
> - 2 files changed, 4 insertions(+)
> -
> -diff --git a/Source/WebCore/accessibility/AXObjectCache.cpp b/Source/WebCore/accessibility/AXObjectCache.cpp
> -index f2451102040..930b969dcc2 100644
> ---- a/Source/WebCore/accessibility/AXObjectCache.cpp
> -+++ b/Source/WebCore/accessibility/AXObjectCache.cpp
> -@@ -528,9 +528,11 @@ static bool isSimpleImage(const RenderObject& renderer)
> -         || (is<HTMLImageElement>(node) && downcast<HTMLImageElement>(node)->hasAttributeWithoutSynchronization(usemapAttr)))
> -         return false;
> -
> -+#if ENABLE(VIDEO)
> -     // Exclude video and audio elements.
> -     if (is<HTMLMediaElement>(node))
> -         return false;
> -+#endif // ENABLE(VIDEO)
> -
> -     return true;
> - }
> -diff --git a/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp b/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp
> -index c0ce72c5ffc..d7ead303f3c 100644
> ---- a/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp
> -+++ b/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp
> -@@ -269,11 +269,13 @@ void BifurcatedGraphicsContext::drawPattern(NativeImage& nativeImage, const Floa
> -     m_secondaryContext.drawPattern(nativeImage, imageSize, destRect, tileRect, patternTransform, phase, spacing, options);
> - }
> -
> -+#if ENABLE(VIDEO)
> - void BifurcatedGraphicsContext::paintFrameForMedia(MediaPlayer& player, const FloatRect& destination)
> - {
> -     m_primaryContext.paintFrameForMedia(player, destination);
> -     m_secondaryContext.paintFrameForMedia(player, destination);
> - }
> -+#endif // ENABLE(VIDEO)
> -
> - void BifurcatedGraphicsContext::scale(const FloatSize& scale)
> - {
> ---
> -2.33.1
> -
> diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
> index acb3ec4a3e..a71c1afc72 100644
> --- a/package/wpewebkit/wpewebkit.hash
> +++ b/package/wpewebkit/wpewebkit.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/wpewebkit-2.34.1.tar.xz.sums
> -md5  915e583b0e7e82efa155cbce917d6319  wpewebkit-2.34.1.tar.xz
> -sha1  452081b6df9d079f26d22bd0dca9e90f87943089  wpewebkit-2.34.1.tar.xz
> -sha256  cb336986341be9c3a9b1ca2c18de0d29d90ae4e77b9967a6f6879597e7a969f7  wpewebkit-2.34.1.tar.xz
> +# From https://wpewebkit.org/releases/wpewebkit-2.34.2.tar.xz.sums
> +md5  b26f07bc809d9fd3e54e815c22312f15  wpewebkit-2.34.2.tar.xz
> +sha1  4200ef87a4e1eb1921f0f40779742381598e1429  wpewebkit-2.34.2.tar.xz
> +sha256  b1a3733c2d486c4da27f9636ccc39947da7d84258cd7a24a6fb0b842c9595c0b  wpewebkit-2.34.2.tar.xz
>   
>   # Hashes for license files:
>   sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index a1e8bff784..7d6b7692fd 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WPEWEBKIT_VERSION = 2.34.1
> +WPEWEBKIT_VERSION = 2.34.2
>   WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
>   WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
>   WPEWEBKIT_INSTALL_STAGING = YES
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
