Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE22C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 806254150E;
	Mon, 14 Feb 2022 20:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54XduZN2Xdsr; Mon, 14 Feb 2022 20:41:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A03F241506;
	Mon, 14 Feb 2022 20:41:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93C391BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F7C9401B2
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:41:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WIjFkC8lN6kS for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:41:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34AC640131
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:41:23 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h6so28776381wrb.9
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ji0r5eE2SXQzx9VB9mZEzXTauAwNKSJmhaWJKvVmkrM=;
 b=DMZGqJ6bQ2dCKeNtw6WjaJdkcUzs41vLl2hk53iqAKI0+dINtaNmA8r1sxSVA5abbi
 5YubrhfEcm/50LDQ1w0dQZmTyFKeSBjbUZneIdO0EjEG9qFFoQRMpSfdtWkJzWHEO5VP
 cB3b6N95H8GlIbf0epLwvlf5pWHDYlhpKqtIVAFXD58KSy9REUUW6MT//iMwJ3bUV2kM
 NBuIDlnrWjZV8xv1GYgJVWM/Hdc7nyO96+QZdIr9s/Q7CNT4vHRcUGPxUltG/Ik/uXik
 KkYsTy1GVcrUUePZZxUSecke6q2qs947iHBQsF3GOEi8ILVr3qVtp4NyWDdm69q6++95
 g+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ji0r5eE2SXQzx9VB9mZEzXTauAwNKSJmhaWJKvVmkrM=;
 b=rYy9zl3vH0YA67uygZV4AzHbj1fEO4Q/4lY9yzs6S2jn/sUrFMkLTMxSO/kVIKyggL
 2yAZ2G7/i0o4UwtpiWGAwMpokDC+rVznvMmtfM1lfF4iO3e17U3XQPRVaj2CG1jDDEYr
 Ha3/xe8Urnda4zv7CBQCSjcfX28TiDWjKB+gE4X2XqzvBIKkmNF2143yusei6MRWb90F
 VJDgRqXQg5Qpi9WP4CsVoePaYGutc9ov9tw7CCD7VAzMsl+fEICde9xP1g0cTi0bxeYz
 LqLqUJ1CwWEepzvbCUO0d0IGj+qfe8/prUv1zSWzNCsSZbjI/1+brmK31CU2tsZmx3Pz
 AApg==
X-Gm-Message-State: AOAM532MVC9a2Iafx8HEU0jsy4KUfF4h41lLBZ1Xbk7k5yrbknywn7lo
 gak7zIa3Pus/iaZM0ga+8akaEQ==
X-Google-Smtp-Source: ABdhPJzc+ZsC7JTDqD1si/Ebi5guXeFs6VC3vtnp+vimIrQvfZwC3Qrn5cYVNl6kYQrhgQa/NbUBTg==
X-Received: by 2002:a5d:4ec1:: with SMTP id s1mr575257wrv.413.1644871281447;
 Mon, 14 Feb 2022 12:41:21 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t187sm12946781wma.22.2022.02.14.12.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:41:20 -0800 (PST)
Message-ID: <b36b8450-f4f7-3bbf-508b-d75d9ceef9ec@mind.be>
Date: Mon, 14 Feb 2022 21:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220207172500.3041019-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220207172500.3041019-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libusb: add -latomic to
 libusb-1.0.pc if needed
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/02/2022 18:25, Fabrice Fontaine wrote:
> libusb unconditionally uses atomic since version 1.0.25 and
> https://github.com/libusb/libusb/commit/1a08aa84d96397a3840a75abe66051f5360c2c84
> resulting in the following build failure with pcsc-lite or openocd since
> commit aad609936fc83acfe1eac6ffc86d29ac35dcf54e:
> 
> checking for libusb_init... configure: error: libusb not found, use ./configure LIBUSB_LIBS=...
> 
> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.so: undefined reference to `__atomic_fetch_add_4'
> collect2: error: ld returned 1 exit status
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/4a27a769bb3cdf78643c3049b87d792178d6512c
>   - http://autobuild.buildroot.org/results/b59b30cbe0e27399db5c7586f369104e68a1589a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...igure.ac-link-with-latomic-if-needed.patch | 39 +++++++++++++++++++
>   package/libusb/libusb.mk                      |  2 +
>   2 files changed, 41 insertions(+)
>   create mode 100644 package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch
> 
> diff --git a/package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch b/package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch
> new file mode 100644
> index 0000000000..5f6c88e57d
> --- /dev/null
> +++ b/package/libusb/0001-configure.ac-link-with-latomic-if-needed.patch
> @@ -0,0 +1,39 @@
> +From 0b857081d687f7ee41483a3d7e9846af44a5ba7d Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 7 Feb 2022 11:55:54 +0100
> +Subject: [PATCH] configure.ac: link with -latomic if needed
> +
> +libusb unconditionally uses atomic_fetch_add since version 1.0.25 and
> +https://github.com/libusb/libusb/commit/1a08aa84d96397a3840a75abe66051f5360c2c84
> +https://github.com/libusb/libusb/commit/eed8a371ea53939096ba94d44001e0637d042572
> +but some architectures (e.g. sparc) needs to link with -latomic to be
> +able to use it. So check if -latomic is needed and update libusb-1.0.pc
> +accordingly to avoid the following build failure with openocd:
> +
> +/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.so: undefined reference to `__atomic_fetch_add_4'
> +collect2: error: ld returned 1 exit status
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/4a27a769bb3cdf78643c3049b87d792178d6512c
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/libusb/libusb/pull/1064]
> +---
> + configure.ac | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index f6cf2f9..002bcf6 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -152,6 +152,7 @@ if test "x$platform" = xposix; then
> + 	AC_SEARCH_LIBS([pthread_create], [pthread],
> + 		[test "x$ac_cv_search_pthread_create" != "xnone required" && AC_SUBST(THREAD_LIBS, [-lpthread])],
> + 		[], [])
> ++	AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
> + elif test "x$platform" = xwindows; then
> + 	AC_DEFINE([PLATFORM_WINDOWS], [1], [Define to 1 if compiling for a Windows platform.])
> + else
> +--
> +2.34.1
> +
> diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
> index 1e82cb9a85..aa306e295d 100644
> --- a/package/libusb/libusb.mk
> +++ b/package/libusb/libusb.mk
> @@ -13,6 +13,8 @@ LIBUSB_LICENSE_FILES = COPYING
>   LIBUSB_CPE_ID_VENDOR = libusb
>   LIBUSB_DEPENDENCIES = host-pkgconf
>   LIBUSB_INSTALL_STAGING = YES
> +# We're patching configure.ac
> +LIBUSB_AUTORECONF = YES
>   
>   # Avoid the discovery of udev for the host variant
>   HOST_LIBUSB_CONF_OPTS = --disable-udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
