Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9189DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FFB140103;
	Sat,  8 Jan 2022 15:12:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AhQka6Z4rSG3; Sat,  8 Jan 2022 15:12:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3111D4012A;
	Sat,  8 Jan 2022 15:12:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B37941BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A079740103
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:11:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k1m7PNuSby1X for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:11:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1768B40180
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:11:56 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so7080246wmk.1
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=eLb41+pxy48wezZrMfWlaa6tlLNNRarGPi386Ss8RYs=;
 b=JYB8IihVkokW7mR7QsuiTIe0znuLqWAk3Lao/i0TsDnWTxBPrlezqP0YYy0AQINf/g
 v9t3Hh155BVzR7f4M4tPfF0AFAUncIrhtZkaWoGtUZ3S1SVgWwBEbh8P5GUKEn3r+VFr
 vR14Bf3snXffWMdSrc6BCBiUn6WQfyufEMTowm2VuK7sNdpvYT6IHPi2n6IBmDOaOM3e
 hRlzLFXymr4j54Hnt5v0bk8KAysVIcMbaudghVh/WBmlYK0YFbHuldkIlOSZbDktquec
 FCIiCTLC50CVBcewpRSMt1GuzuvtOVTjIGvZWNNMKDV4gvTOsQ4SfiWVZjv5e6rN9yKn
 H+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eLb41+pxy48wezZrMfWlaa6tlLNNRarGPi386Ss8RYs=;
 b=7pThalF0a6F90zVUcNn4BJYWDzOHKtJCSkchi0ToGmTWM9JXxr7QLziTnmhIfnavMs
 u+0SVHuUOAbDHTACymNOSODvsaAsFLVVDkEyfBLUOs4whqpfBUtweJjGb0NQw5lVeDKm
 iby8L35A3y+UPTQloUyMMYY9XX0hdGGhRrUSkNUqoPUMuNywoCuZCpgydpEnR0rO9AVz
 KP+jNostYGZswQeql46HNIv3j6l4chVCB/z50+6VHk4kT2bGrWXqk4jjUhAEnnenBnpH
 Qi3uu9ubPMwJ9HHzOYImF1zcv45f4TspuWy1wGgJ2Vfmk0YlHnc4Q39WA7JOx5ELT9O2
 CQ6A==
X-Gm-Message-State: AOAM533PMunIc7E8r9JE4To4mSeKJDxAZoKgMOd5kygnDg2dZb2D3058
 n1Su3W3vk0cEHaxDdTSilcu0UI9PXuY2QUqS
X-Google-Smtp-Source: ABdhPJwJdn0J9CuL/5WQYHUGYYHu/NTMXN8EjsxNk7h9lxaxFC4K0mE/qnDtMA7PpmAAtxE3ZJdoZA==
X-Received: by 2002:a05:600c:1d1c:: with SMTP id
 l28mr14488012wms.69.1641654715372; 
 Sat, 08 Jan 2022 07:11:55 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id a3sm1873066wrm.52.2022.01.08.07.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:11:55 -0800 (PST)
Message-ID: <2cd945fe-b535-fd6c-3439-c65c7c9a5c44@mind.be>
Date: Sat, 8 Jan 2022 16:11:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220107220707.1679540-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220107220707.1679540-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mp4v2: bump to version 5.0.1
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



On 07/01/2022 23:07, Fabrice Fontaine wrote:
> Drop first patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mp4v2/0001-Fix-GCC7-build.patch       | 33 -------------------
>   ...p4track.cpp-replace-nullptr-by-NULL.patch} |  2 +-
>   ...atic-cast-to-unsigned-int-for-cases.patch} |  0
>   package/mp4v2/mp4v2.hash                      |  2 +-
>   package/mp4v2/mp4v2.mk                        |  2 +-
>   5 files changed, 3 insertions(+), 36 deletions(-)
>   delete mode 100644 package/mp4v2/0001-Fix-GCC7-build.patch
>   rename package/mp4v2/{0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch => 0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch} (96%)
>   rename package/mp4v2/{0003-Static-cast-to-unsigned-int-for-cases.patch => 0002-Static-cast-to-unsigned-int-for-cases.patch} (100%)
> 
> diff --git a/package/mp4v2/0001-Fix-GCC7-build.patch b/package/mp4v2/0001-Fix-GCC7-build.patch
> deleted file mode 100644
> index 4e39be4a79..0000000000
> --- a/package/mp4v2/0001-Fix-GCC7-build.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 855e9674232808ff3be7191b697dfb56917db21f Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?S=C3=A9rgio=20M=2E=20Basto?= <sergio@serjux.com>
> -Date: Wed, 8 Feb 2017 00:56:32 +0000
> -Subject: [PATCH] Fix GCC7 build
> -
> -if (*pSlash != '\0') {
> -
> -As it stands the body of that if will always execute and when there are
> -no encoding parameters ppEncodingParams will be returned as a pointer to
> -an empty string rather than as a null pointer
> -
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> -[Upstream status: https://github.com/TechSmith/mp4v2/pull/36]
> ----
> - src/rtphint.cpp | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/rtphint.cpp b/src/rtphint.cpp
> -index e07309d..1eb01f5 100644
> ---- a/src/rtphint.cpp
> -+++ b/src/rtphint.cpp
> -@@ -339,7 +339,7 @@ void MP4RtpHintTrack::GetPayload(
> -                 pSlash = strchr(pSlash, '/');
> -                 if (pSlash != NULL) {
> -                     pSlash++;
> --                    if (pSlash != '\0') {
> -+                    if (*pSlash != '\0') {
> -                         length = (uint32_t)strlen(pRtpMap) - (pSlash - pRtpMap);
> -                         *ppEncodingParams = (char *)MP4Calloc(length + 1);
> -                         strncpy(*ppEncodingParams, pSlash, length);
> ---
> -2.11.0
> -
> diff --git a/package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch b/package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
> similarity index 96%
> rename from package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch
> rename to package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
> index 72bae463c9..c279b9c56a 100644
> --- a/package/mp4v2/0002-src-mp4track.cpp-replace-nullptr-by-NULL.patch
> +++ b/package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
> @@ -16,7 +16,7 @@ Fixes:
>    - http://autobuild.buildroot.org/results/14937c96a82fb3d10e5d83bd7b2905b846fb09f9
>   
>   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: not sent yet]
> +[Upstream status: https://github.com/TechSmith/mp4v2/pull/62]
>   ---
>    src/mp4track.cpp | 6 +++---
>    1 file changed, 3 insertions(+), 3 deletions(-)
> diff --git a/package/mp4v2/0003-Static-cast-to-unsigned-int-for-cases.patch b/package/mp4v2/0002-Static-cast-to-unsigned-int-for-cases.patch
> similarity index 100%
> rename from package/mp4v2/0003-Static-cast-to-unsigned-int-for-cases.patch
> rename to package/mp4v2/0002-Static-cast-to-unsigned-int-for-cases.patch
> diff --git a/package/mp4v2/mp4v2.hash b/package/mp4v2/mp4v2.hash
> index 85fce49384..7aa5402c8f 100644
> --- a/package/mp4v2/mp4v2.hash
> +++ b/package/mp4v2/mp4v2.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  e3ad6c2dc451b0875dbe34bfe7f51f4fe278b391434c886083e6d3ecd5fa08c2  mp4v2-4.1.3.tar.gz
> +sha256  de31e430e2641f25b67d10c47b0cda35279881b0196120e33bcd71b9cef1bd58  mp4v2-5.0.1.tar.gz
>   sha256  15e38684c940176e2fc76331a2299d2ab5115ac997078f768ef31b896af69fc5  COPYING
> diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
> index 478d10d472..6d29228a13 100644
> --- a/package/mp4v2/mp4v2.mk
> +++ b/package/mp4v2/mp4v2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MP4V2_VERSION = 4.1.3
> +MP4V2_VERSION = 5.0.1
>   MP4V2_SITE = \
>   	$(call github,TechSmith,mp4v2,Release-ThirdParty-MP4v2-$(MP4V2_VERSION))
>   MP4V2_INSTALL_STAGING = YES
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
