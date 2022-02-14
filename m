Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B745CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 21:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79F93410A6;
	Mon, 14 Feb 2022 21:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Z4viKzwqp2o; Mon, 14 Feb 2022 21:16:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81299409EA;
	Mon, 14 Feb 2022 21:16:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36B1A1BF275
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2571760B54
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S2ctwK_A0oVk for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 21:16:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B6C660B50
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 21:16:51 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id u18so28956077edt.6
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 13:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Onr7qJsAt1i8khi2Tc1PnlGxcnbbWY4PONuTgSAZK8U=;
 b=U+bVVaXgbqLAocbGZjX6m7OqGPZg/AqhB+fEuvNAtB9EZWKonpFXfuA9QMY8MmRPtd
 XJ65lA6LaH6vPqI3479ck8H6yciTFFB9ebWETWvrfsCh+YplAHDT58wuK/u6CbhRoHgM
 OO+WQ5FfNv2cLjirItd7ja6dIYWl3sR4q6cavtcMYmfHbcgJz6QZHSvEcZQG/gqqSVDM
 Wn5Rx5PI3ibyDg8F5PvY47QqRLzXhxwzEBXqNo6CukChaiGJdMZUxjKRNGGJuJ5STqWP
 r/GnqQdUNGDfHXyHciFawA9QFRmHRtYkGMpecgJTH0ombvOnhOQY8ruY3U6ynqs8rIFI
 IbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Onr7qJsAt1i8khi2Tc1PnlGxcnbbWY4PONuTgSAZK8U=;
 b=hv/M/mfU+EHl6QSG1JoXOV8wrR6LvpLZb/OTvKehhsN70zsD85goM8XmREu70LiOcK
 bFgXZOvTU/GjJMxmTljQNtWSfVjksYg0/KJTowwkeLeFdkCIEBBQ9l9ixq5+YvXLwXZi
 /aNglHWQtVV9+2X2GX4WB+KAFiM/YQtX1LMbOFj9aZryLcQPRBg3fupw1QAI05DZeEbo
 2eu7VeCeK5DAFoL6r2lvy+6m7kv5iFHblSX3tnyP134qtxzRqT5/KQfUMHWzOixMKEbc
 dv2YgQRKECN8kNxOD4w2mMucH8YeYr7QWpKBz0Iff0vhKUB5BpEI15nbpjE/wlyBG1OT
 W6BQ==
X-Gm-Message-State: AOAM53195PxKcb7DmQ/+cKJ6Z4L40K86kbtkRO4fIwqMuBmdI4O51Z0y
 +UCeSOdPOoppl2RVDyTzW7uwug==
X-Google-Smtp-Source: ABdhPJwAZo6iaWTz2FZQOoIo337fhsbKdFSvfY1+ByYfOi+ZGv06peiQ8DycrKSsf10wJcxWEr/uHw==
X-Received: by 2002:a50:bb0a:: with SMTP id y10mr738837ede.441.1644873409666; 
 Mon, 14 Feb 2022 13:16:49 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 29sm6806670ejk.147.2022.02.14.13.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 13:16:49 -0800 (PST)
Message-ID: <285e485d-146e-6199-3eb7-1b1dcaccfdea@mind.be>
Date: Mon, 14 Feb 2022 22:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220209192436.319769-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220209192436.319769-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rng-tools: bump to version 6.15
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/02/2022 20:24, Fabrice Fontaine wrote:
> Drop patches (already in version)
> 
> https://github.com/nhorman/rng-tools/releases/tag/v6.15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   ...ct-non-posix-extensions-for-pthreads.patch | 43 ----------------
>   ...-either-pthread-affinity-set-methods.patch | 49 -------------------
>   package/rng-tools/rng-tools.hash              |  2 +-
>   package/rng-tools/rng-tools.mk                |  2 +-
>   4 files changed, 2 insertions(+), 94 deletions(-)
>   delete mode 100644 package/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pthreads.patch
>   delete mode 100644 package/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
> 
> diff --git a/package/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pthreads.patch b/package/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pthreads.patch
> deleted file mode 100644
> index ba6cf63d7c..0000000000
> --- a/package/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pthreads.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From d1840e54a15fc454936cada10cce7fd91d06232b Mon Sep 17 00:00:00 2001
> -From: Neil Horman <nhorman@gmail.com>
> -Date: Thu, 15 Jul 2021 08:43:01 -0400
> -Subject: [PATCH] Adding ability to detect non-posix extensions for pthreads
> -
> -Theres a desire to build rngd with musl, which doesn't have all the gnu
> -extensions (but it has some).  So test for those.  Note, this requires
> -the addition of the USE_EXTENSIONS macro to enable -d_GNU_SOURCE
> -
> -Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
> -
> -[Retrieved from:
> -https://github.com/nhorman/rng-tools/commit/d1840e54a15fc454936cada10cce7fd91d06232b]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - configure.ac | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 0fe06fc..de7dca3 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -25,6 +25,7 @@ AC_CANONICAL_TARGET dnl required for broken AX_PTHREAD
> - AM_INIT_AUTOMAKE([foreign])
> - AC_CONFIG_HEADERS([rng-tools-config.h])
> - AC_CONFIG_MACRO_DIRS([m4])
> -+AC_USE_SYSTEM_EXTENSIONS
> -
> - dnl Parse options
> -
> -@@ -100,6 +101,12 @@ AS_IF(
> - 	], [AC_MSG_NOTICE([Disabling JITTER entropy source])]
> - )
> -
> -+AC_CHECK_DECL(pthread_attr_setaffinity_np,
> -+		[AC_DEFINE([HAVE_PTHREAD_ATTR_SETAFFINITY], 1,[Set ATTR_SETAFFINITY])],
> -+		[ AC_CHECK_DECL(pthread_setaffinity_np,
> -+		   [AC_DEFINE([HAVE_PTHREAD_SETAFFINITY],1, [Set PTHREAD_SETAFFINITY])], [ AC_MSG_ERROR([Neither pthread_setaffinity_np nor pthread_attr_setaffinity_np found])],[[#include <pthread.h>]])
> -+		], [[#include <pthread.h>]])
> -+
> - AS_IF(
> - 	[ test "x$with_nistbeacon" != "xno"],
> - 	[
> diff --git a/package/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch b/package/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
> deleted file mode 100644
> index 17285baa6a..0000000000
> --- a/package/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From 5caa086dc14cecf68d1a5c31e87ba1efb2c00893 Mon Sep 17 00:00:00 2001
> -From: Neil Horman <nhorman@gmail.com>
> -Date: Thu, 15 Jul 2021 08:48:10 -0400
> -Subject: [PATCH] Allow for use of either pthread affinity set methods
> -
> -musl has support for pthread_setaffinity_np, but not
> -pthread_attr_setaffinity_np.  so check for hte existence of either
> -function in configure, and use the appropriate one.
> -
> -Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
> -
> -[Retrieved from:
> -https://github.com/nhorman/rng-tools/commit/5caa086dc14cecf68d1a5c31e87ba1efb2c00893]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - rngd_jitter.c | 15 ++++++++++++++-
> - 1 file changed, 14 insertions(+), 1 deletion(-)
> -
> -diff --git a/rngd_jitter.c b/rngd_jitter.c
> -index ea29436..5c7e09e 100644
> ---- a/rngd_jitter.c
> -+++ b/rngd_jitter.c
> -@@ -67,12 +67,25 @@ static int rngd_notime_start(void *ctx,
> - 	for(i=i-1;i>=0;i--) {
> - 		CPU_SET(i,cpus);
> - 	}
> --	pthread_attr_setaffinity_np(&thread_ctx->notime_pthread_attr, cpusize, cpus);
> -
> -+        /*
> -+	 * Note that only one of:
> -+	 * HAVE_PTHREAD_ATTR_SETAFFINITY
> -+	 * and
> -+	 * HAVE_PTHREAD_SETAFFINITY
> -+	 * Will ever be set, as per the configure.ac logic
> -+	 */
> -+#ifdef HAVE_PTHREAD_ATTR_SETAFFINITY
> -+	pthread_attr_setaffinity_np(&thread_ctx->notime_pthread_attr, cpusize, cpus);
> -+#endif
> - 	ret = -pthread_create(&thread_ctx->notime_thread_id,
> - 				&thread_ctx->notime_pthread_attr,
> - 				start_routine, arg);
> -
> -+#ifdef HAVE_PTHREAD_SETAFFINITY
> -+	pthread_setaffinity_np(&thread_ctx->notime_thread_id, cpusize, cpus);
> -+#endif
> -+
> - 	CPU_FREE(cpus);
> - 	return ret;
> - }
> diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
> index 6806a99fc6..be2ee13969 100644
> --- a/package/rng-tools/rng-tools.hash
> +++ b/package/rng-tools/rng-tools.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  4dd86f6ae37d917a8489f44070d39d7feddcc622429b95efd7aa85a1f3cfdf81  rng-tools-6.14.tar.gz
> +sha256  bff0c58dff90ec10bd61f672e48618e045155eabd60b32d63a9c4ffbdad05f3a  rng-tools-6.15.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
> index 8db97569d4..8b195ea875 100644
> --- a/package/rng-tools/rng-tools.mk
> +++ b/package/rng-tools/rng-tools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RNG_TOOLS_VERSION = 6.14
> +RNG_TOOLS_VERSION = 6.15
>   RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
>   RNG_TOOLS_LICENSE = GPL-2.0
>   RNG_TOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
