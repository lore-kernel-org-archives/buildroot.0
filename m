Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDDBC76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F175410D5;
	Mon, 10 Apr 2023 19:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F175410D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lg17jhyl8-nE; Mon, 10 Apr 2023 19:47:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF9E9410D8;
	Mon, 10 Apr 2023 19:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF9E9410D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5DD5A1BF316
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3416B60B2F
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3416B60B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16qvxRpJd0qP for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:47:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAD9C60B0E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAD9C60B0E
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:47:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id F26315FFA3;
 Mon, 10 Apr 2023 21:47:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Apr 2023 21:47:37 +0200
Date: Mon, 10 Apr 2023 21:47:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230410194737.GM2819@scaer>
References: <20230330123509.23696-1-ps.report@gmx.net>
 <20230330123509.23696-2-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230330123509.23696-2-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681156061;
 bh=1KXnkp/2Kqsk0GXE6mIZHrrcUZGIS+I3ltSHhM31ylY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qVG2ATSWojwXxgJ596lFjbGpUGBV4betIvhv24k8FvsGsMFv421Vj7awwCDEx3bSx
 jWfsk4SkKb+3fKTbqwxRgLEXLPcyUipAJM7LP16ixKvmv56ZDRWkRH8HLV0X4K+o3e
 xnfZI6eVCpbFP+XVrxsUuLREn8CogzPje3A2ehdq7Rcwamg+L3+741s4OctaK/MBFp
 5x5tz3YkpnhNk3vKfQUhrGx9qAtAsRSw7HxVvgrnaadEGq/pSZ+gWwXuVSVcJysJS3
 Yc1reKyh22tbI7yTBk7Kutm/ljaONU1G5dlzj1EiyDVSoLm+vYEu8I1q68STWfxQ06
 7KT0kI/6K0eug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qVG2ATSW
Subject: Re: [Buildroot] [RFC v2 2/2] package/libv4l: enable v4l2-tracer
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-03-30 14:35 +0200, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - fix --disable-v4l-tracer vs. --disable-v4l2-tracer typo
>   - enhance compile failure log/research
> 
> Fails with rpi4_64 config:

Obviously, we can't apply this for now, so I've marked is as "not
applicable" in patchwork.

>   .../host/bin/aarch64-buildroot-linux-gnu-g++ -DHAVE_CONFIG_H -I. -I../.. -I../../utils/common -I.../aarch64-buildroot-linux-gnu/sysroot/usr/in
> clude/json-c -I../../lib/include -Wall -Wpointer-arith -D_GNU_SOURCE -I../../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=6
> 4 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=1 -std=gnu++11 -c libv4l2tracer.cpp  -fPIC -DPIC -o .libs/libv4l2tracer_la-libv4l2tracer.o
>   /tmp/ccXMMihl.s: Assembler messages:
>   /tmp/ccXMMihl.s:208: Error: symbol `open64' is already defined
>   /tmp/ccXMMihl.s:762: Error: symbol `mmap64' is already defined
>   make[5]: *** [Makefile:751: libv4l2tracer_la-libv4l2tracer.lo] Error 1

This is going to be tricky to investigate: indeed, AIUI, libv4l2tracer
is going to be a shared lib thatr can be LD_PRELOADed explicitly to
trace a few system calls, like open, open64, mmap, mmap64, and a few
others...

So, the solution is not to rename those functions in libv4l2tracer.

All those 64-bit flags are starting to be messing with my brain... :-(

Regards,
Yann E. MORIN.

> The preprocessor output shows:
> 
>   [...]
>   extern "C" {
>   # 61 ".../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/sys/mman.h" 3 4
>   extern void * mmap (void *__addr, size_t __len, int __prot, int __flags, int __fd, __off64_t __offset) noexcept (true) __asm__ ("" "mmap64");
>   [...]
>   extern void *mmap64 (void *__addr, size_t __len, int __prot,
>          int __flags, int __fd, __off64_t __offset) noexcept (true);
> 
> And host/aarch64-buildroot-linux-gnu/sysroot/usr/include/sys/mman.h:
> 
>   56 #ifndef __USE_FILE_OFFSET64
>   57 extern void *mmap (void *__addr, size_t __len, int __prot,
>   58                    int __flags, int __fd, __off_t __offset) __THROW;
>   59 #else
>   60 # ifdef __REDIRECT_NTH
>   61 extern void * __REDIRECT_NTH (mmap,
>   62                               (void *__addr, size_t __len, int __prot,
>   63                                int __flags, int __fd, __off64_t __offset),
>   64                               mmap64);
>   65 # else
>   66 #  define mmap mmap64
>   67 # endif
>   68 #endif
>   69 #ifdef __USE_LARGEFILE64
>   70 extern void *mmap64 (void *__addr, size_t __len, int __prot,
>   71                      int __flags, int __fd, __off64_t __offset) __THROW;
>   72 #endif
> ---
>  package/libv4l/Config.in | 1 +
>  package/libv4l/libv4l.mk | 9 ++++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
> index c88f280c3b..7a86c7de15 100644
> --- a/package/libv4l/Config.in
> +++ b/package/libv4l/Config.in
> @@ -33,6 +33,7 @@ config BR2_PACKAGE_LIBV4L_UTILS
>  	  - v4l2-compliance
>  	  - v4l2-ctl, cx18-ctl, ivtv-ctl
>  	  - v4l2-sysfs-path
> +	  - v4l2-tracer (if json-c is enabled)
>  	  - rds-ctl
>  	  - qv4l2 (if Qt is enabled)
>  
> diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> index 1142a7442f..ccb4da4fb7 100644
> --- a/package/libv4l/libv4l.mk
> +++ b/package/libv4l/libv4l.mk
> @@ -9,7 +9,7 @@ LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
>  LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
>  LIBV4L_INSTALL_STAGING = YES
>  LIBV4L_DEPENDENCIES = host-pkgconf
> -LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap --disable-v4l2-tracer
> +LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap
>  # needed to get utils/qv4l link flags right
>  LIBV4L_AUTORECONF = YES
>  # add host-gettext for AM_ICONV macro
> @@ -66,6 +66,13 @@ LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
>  # libelf and clang support
>  LIBV4L_CONF_OPTS += --disable-bpf
>  
> +ifeq ($(BR2_PACKAGE_JSON_C),y)
> +LIBV4L_CONF_OPTS += --enable-v4l2-tracer
> +LIBV4L_DEPENDENCIES += json-c
> +else
> +LIBV4L_CONF_OPTS += --disable-v4l2-tracer
> +endif
> +
>  ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
>  LIBV4L_CONF_OPTS += --enable-qv4l2
>  LIBV4L_DEPENDENCIES += qt5base
> -- 
> 2.40.0
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
