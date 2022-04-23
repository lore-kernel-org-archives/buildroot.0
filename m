Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CF7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 903A0409EE;
	Sat, 23 Apr 2022 16:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zd7FTCH1SZQO; Sat, 23 Apr 2022 16:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29F8B40915;
	Sat, 23 Apr 2022 16:29:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6235D1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50A35418C1
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2kkkyVIh6u50 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:29:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A21AE4183D
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:29:15 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id u15so21766716ejf.11
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9W1VzDWWtzsIKTknGEYm5Im0PImaAXIFfBRW8U5/qqY=;
 b=QrMxvLHhJzjKbDQv8QMvddlV9Uz7xtHVWnVPQFitN58kZy5EVCoj/5Qjc/yCZxvDP3
 fXRTynhY56C3ynoRQyxSAJJzVcGinpzX73Iaez8yD1niq4LJMLjw05xjDLmAPUWBdlc9
 qD5FvVFSJA4M7MCLYT+JaPTAbtcqaSNXUioX/5ofnx5E4+ORcLI63zXI8H3UTFxesH5a
 DLOA8EOLk/636SRSO+NIwJ5K9xD6eYLe0LXJRfWvrvOMdpDUpULdMcUusSfysaxowUZx
 nOFfAPG3lGUP9Woje1jIinfH6HM9uT7IagYtyljljUAl0jnjd5RjKrJGmVSHNBZGIjAi
 ZZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9W1VzDWWtzsIKTknGEYm5Im0PImaAXIFfBRW8U5/qqY=;
 b=r1zx+R4tj03H6iN5SndG700WhE8VaudP4AEp/EBXbvVBCbDkl4IaJBrP77I5A6PrD/
 m9zuOEbvY/gicefbO4vm7nPW/vR2d9M0WApckKZHN3NQ1dll2LKOx+VCbVLQpeWoxE4n
 hvNi249LSemZtNixYkcXCMj66DVCqBA9R8U9S18HdU5TKud7vRDguSIrLPTIMLgTykBS
 wTO8QWFRTm4cBKVUemZSO3PiO56lVePZMgX9AJpaX4kPSVB2kF5gpuFewTJ2aVfmwEgl
 f8O+gts6JxFyUht8iWgKQ/93JZc9GTX18E9gB6n7SrcWl9GOTQA7Vrj8cT8OOG5uyrHq
 85DQ==
X-Gm-Message-State: AOAM531LLXOzowWLvfR0MZ2vQfeAYuQeVyejJvB8hRU0OLrdGb+28vqq
 6GvDcSFmBfLn/WxnAG+U2/gIhg==
X-Google-Smtp-Source: ABdhPJwLm5Lg6tD6HKIMvsB84QYnCLih7SKmfb+HPtHXnP3NRdryNtuIrBGwYNddClkvrzViOzxMRQ==
X-Received: by 2002:a17:907:3e94:b0:6ef:f135:4b with SMTP id
 hs20-20020a1709073e9400b006eff135004bmr8529644ejc.609.1650731353732; 
 Sat, 23 Apr 2022 09:29:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a170906725500b006e10a7d6d03sm1832335ejk.219.2022.04.23.09.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 09:29:13 -0700 (PDT)
Message-ID: <9846bb96-bb58-48fb-6e17-2dc5c1e88166@mind.be>
Date: Sat, 23 Apr 2022 18:29:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220421100233.3845088-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220421100233.3845088-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/argp-standalone: bump to
 version 1.4.1
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



On 21/04/2022 12:02, Fabrice Fontaine wrote:
> - Switch site to an up-to-date fork
> - Drop first and second patches (not needed since:
>    https://github.com/ericonr/argp-standalone/commit/c474ac2af74a8ba336b5480927741c13950ea01b
>    https://github.com/ericonr/argp-standalone/commit/80691135993109ec0c8a41327418195fc6d82694
> - Drop third patch (not needed since:
>    https://github.com/ericonr/argp-standalone/commit/e7ff8d9787d2641e55f6ac4afb777da60ef98043)
> - License is LGPL-2.1+ since
>    https://github.com/ericonr/argp-standalone/commit/c474ac2af74a8ba336b5480927741c13950ea01b
> - README.md can be used as the license file since
>    https://github.com/ericonr/argp-standalone/commit/da0206414df4fe55f70b6dfba86ec232acf5d444
> - This bump will also fix the following build failure with
>    BR2_OPTIMIZE_0 thanks to
>    https://github.com/ericonr/argp-standalone/commit/e7ff8d9787d2641e55f6ac4afb777da60ef98043:
> 
>    /nvmedata/autobuild/instance-27/output-1/host/lib/gcc/microblaze-buildroot-linux-uclibc/10.3.0/../../../../microblaze-buildroot-linux-uclibc/bin/ld: libargp.a(argp-help.o): in function `indent_to':
>    /nvmedata/autobuild/instance-27/output-1/build/argp-standalone-1.3/argp-help.c:930: undefined reference to `argp_fmtstream_point'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/8e2cd69356f40bae534847ad58f4aa0dabb4c791
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-throw-in-funcdef.patch               | 79 -------------------
>   package/argp-standalone/0002-isprint.patch    | 45 -----------
>   .../0003-fix_build_with_c99_compilers.patch   | 68 ----------------
>   package/argp-standalone/Config.in             |  2 +-
>   package/argp-standalone/argp-standalone.hash  |  4 +-
>   package/argp-standalone/argp-standalone.mk    | 11 ++-
>   6 files changed, 10 insertions(+), 199 deletions(-)
>   delete mode 100644 package/argp-standalone/0001-throw-in-funcdef.patch
>   delete mode 100644 package/argp-standalone/0002-isprint.patch
>   delete mode 100644 package/argp-standalone/0003-fix_build_with_c99_compilers.patch
> 
> diff --git a/package/argp-standalone/0001-throw-in-funcdef.patch b/package/argp-standalone/0001-throw-in-funcdef.patch
> deleted file mode 100644
> index 4a90751e1e..0000000000
> --- a/package/argp-standalone/0001-throw-in-funcdef.patch
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -# --- T2-COPYRIGHT-NOTE-BEGIN ---
> -# This copyright note is auto-generated by ./scripts/Create-CopyPatch.
> -#
> -# T2 SDE: package/.../rng-tools/throw-in-funcdef.patch.argp-standalone
> -# Copyright (C) 2006 The T2 SDE Project
> -#
> -# More information can be found in the files COPYING and README.
> -#
> -# This patch file is dual-licensed. It is available under the license the
> -# patched project is licensed under, as long as it is an OpenSource license
> -# as defined at http://www.opensource.org/ (e.g. BSD, X11) or under the terms
> -# of the GNU General Public License as published by the Free Software
> -# Foundation; either version 2 of the License, or (at your option) any later
> -# version.
> -# --- T2-COPYRIGHT-NOTE-END ---
> -
> -
> -No __THROW in function implementation.
> -	--jsaw
> -
> ---- argp-standalone-1.4-test2/argp.h.orig	2006-01-06 02:29:59.000000000 +0100
> -+++ argp-standalone-1.4-test2/argp.h	2006-01-06 02:41:10.000000000 +0100
> -@@ -560,17 +560,17 @@
> - # endif
> -
> - # ifndef ARGP_EI
> --#  define ARGP_EI extern __inline__
> -+#  define ARGP_EI extern inline
> - # endif
> -
> - ARGP_EI void
> --__argp_usage (__const struct argp_state *__state) __THROW
> -+__argp_usage (__const struct argp_state *__state)
> - {
> -   __argp_state_help (__state, stderr, ARGP_HELP_STD_USAGE);
> - }
> -
> - ARGP_EI int
> --__option_is_short (__const struct argp_option *__opt) __THROW
> -+__option_is_short (__const struct argp_option *__opt)
> - {
> -   if (__opt->flags & OPTION_DOC)
> -     return 0;
> -@@ -582,7 +582,7 @@
> - }
> -
> - ARGP_EI int
> --__option_is_end (__const struct argp_option *__opt) __THROW
> -+__option_is_end (__const struct argp_option *__opt)
> - {
> -   return !__opt->key && !__opt->name && !__opt->doc && !__opt->group;
> - }
> ---- argp-standalone-1.4-test2/argp-parse.c.orig	2006-01-06 02:47:48.000000000 +0100
> -+++ argp-standalone-1.4-test2/argp-parse.c	2006-01-06 02:48:16.000000000 +0100
> -@@ -1290,13 +1290,13 @@
> - /* Defined here, in case a user is not inlining the definitions in
> -  * argp.h */
> - void
> --__argp_usage (__const struct argp_state *__state) __THROW
> -+__argp_usage (__const struct argp_state *__state)
> - {
> -   __argp_state_help (__state, stderr, ARGP_HELP_STD_USAGE);
> - }
> -
> - int
> --__option_is_short (__const struct argp_option *__opt) __THROW
> -+__option_is_short (__const struct argp_option *__opt)
> - {
> -   if (__opt->flags & OPTION_DOC)
> -     return 0;
> -@@ -1310,7 +1310,7 @@
> - }
> -
> - int
> --__option_is_end (__const struct argp_option *__opt) __THROW
> -+__option_is_end (__const struct argp_option *__opt)
> - {
> -   return !__opt->key && !__opt->name && !__opt->doc && !__opt->group;
> - }
> diff --git a/package/argp-standalone/0002-isprint.patch b/package/argp-standalone/0002-isprint.patch
> deleted file mode 100644
> index 9c08366f68..0000000000
> --- a/package/argp-standalone/0002-isprint.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -Subject: restrict value range passed to isprint function
> -
> -According to C standards isprint argument shall be representable as an
> -unsigned char or be equal to EOF, otherwise the behaviour is undefined.
> -
> -Passing arbitrary ints leads to segfault in nm program from elfutils.
> -
> -Restrict isprint argument range to values representable by unsigned char.
> -
> -Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ----
> -Index: b/argp.h
> -===================================================================
> ---- a/argp.h
> -+++ b/argp.h
> -@@ -23,6 +23,7 @@
> -
> - #include <stdio.h>
> - #include <ctype.h>
> -+#include <limits.h>
> -
> - #define __need_error_t
> - #include <errno.h>
> -@@ -577,7 +578,7 @@
> -   else
> -     {
> -       int __key = __opt->key;
> --      return __key > 0 && isprint (__key);
> -+      return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
> -     }
> - }
> -
> -Index: b/argp-parse.c
> -===================================================================
> ---- a/argp-parse.c
> -+++ b/argp-parse.c
> -@@ -1292,7 +1292,7 @@
> -       int __key = __opt->key;
> -       /* FIXME: whether or not a particular key implies a short option
> -        * ought not to be locale dependent. */
> --      return __key > 0 && isprint (__key);
> -+      return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
> -     }
> - }
> -
> diff --git a/package/argp-standalone/0003-fix_build_with_c99_compilers.patch b/package/argp-standalone/0003-fix_build_with_c99_compilers.patch
> deleted file mode 100644
> index 56b753b607..0000000000
> --- a/package/argp-standalone/0003-fix_build_with_c99_compilers.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From b2dfa011a3fdcb7d22764d143517d0fbd1c2a201 Mon Sep 17 00:00:00 2001
> -From: Emmanuel Dreyfus <manu@netbsd.org>
> -Date: Wed, 22 Jan 2014 14:47:23 +0100
> -Subject: [PATCH] Fix build with c99 compilers
> -
> -BUG: 764655
> -Change-Id: If5dfdc9c7427bd3d39d8da8f79e33ae2da6a3137
> -Signed-off-by: Emmanuel Dreyfus <manu@netbsd.org>
> -Reviewed-on: http://review.gluster.org/6034
> -Reviewed-by: Harshavardhana <harsha@harshavardhana.net>
> -Tested-by: Gluster Build System <jenkins@build.gluster.com>
> ----
> -
> -diff --git a/argp-fmtstream.c b/argp-fmtstream.c
> -index 7f79285..494b6b3 100644
> ---- a/argp-fmtstream.c
> -+++ b/argp-fmtstream.c
> -@@ -389,6 +389,7 @@
> - weak_alias (__argp_fmtstream_printf, argp_fmtstream_printf)
> - #endif
> -
> -+#if __STDC_VERSION__ - 199900L < 1
> - /* Duplicate the inline definitions in argp-fmtstream.h, for compilers
> -  * that don't do inlining. */
> - size_t
> -@@ -471,5 +472,6 @@
> -     __argp_fmtstream_update (__fs);
> -   return __fs->point_col >= 0 ? __fs->point_col : 0;
> - }
> -+#endif /* __STDC_VERSION__ - 199900L < 1 */
> -
> - #endif /* !ARGP_FMTSTREAM_USE_LINEWRAP */
> -diff --git a/argp-fmtstream.h b/argp-fmtstream.h
> -index e797b11..828f435 100644
> ---- a/argp-fmtstream.h
> -+++ b/argp-fmtstream.h
> -@@ -153,6 +153,7 @@
> - 				      __const char *__fmt, ...)
> -      PRINTF_STYLE(2,3);
> -
> -+#if __STDC_VERSION__ - 199900L < 1
> - extern int __argp_fmtstream_putc (argp_fmtstream_t __fs, int __ch);
> - extern int argp_fmtstream_putc (argp_fmtstream_t __fs, int __ch);
> -
> -@@ -163,6 +164,7 @@
> - 				      __const char *__str, size_t __len);
> - extern size_t argp_fmtstream_write (argp_fmtstream_t __fs,
> - 				    __const char *__str, size_t __len);
> -+#endif /* __STDC_VERSION__ - 199900L < 1 */
> - 
> - /* Access macros for various bits of state.  */
> - #define argp_fmtstream_lmargin(__fs) ((__fs)->lmargin)
> -@@ -172,6 +174,7 @@
> - #define __argp_fmtstream_rmargin argp_fmtstream_rmargin
> - #define __argp_fmtstream_wmargin argp_fmtstream_wmargin
> -
> -+#if __STDC_VERSION__ - 199900L < 1
> - /* Set __FS's left margin to LMARGIN and return the old value.  */
> - extern size_t argp_fmtstream_set_lmargin (argp_fmtstream_t __fs,
> - 					  size_t __lmargin);
> -@@ -193,6 +196,7 @@
> - /* Return the column number of the current output point in __FS.  */
> - extern size_t argp_fmtstream_point (argp_fmtstream_t __fs);
> - extern size_t __argp_fmtstream_point (argp_fmtstream_t __fs);
> -+#endif /* __STDC_VERSION__ - 199900L < 1 */
> -
> - /* Internal routines.  */
> - extern void _argp_fmtstream_update (argp_fmtstream_t __fs);
> diff --git a/package/argp-standalone/Config.in b/package/argp-standalone/Config.in
> index 3319dd945c..891d4aedaa 100644
> --- a/package/argp-standalone/Config.in
> +++ b/package/argp-standalone/Config.in
> @@ -5,4 +5,4 @@ config BR2_PACKAGE_ARGP_STANDALONE
>   	help
>   	  Glibc hierarchical argument parsing standalone library.
>   
> -	  http://www.lysator.liu.se/~nisse/misc/
> +	  https://github.com/ericonr/argp-standalone/
> diff --git a/package/argp-standalone/argp-standalone.hash b/package/argp-standalone/argp-standalone.hash
> index c780f9e53f..1e56c663d4 100644
> --- a/package/argp-standalone/argp-standalone.hash
> +++ b/package/argp-standalone/argp-standalone.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -sha256  dec79694da1319acd2238ce95df57f3680fea2482096e483323fddf3d818d8be  argp-standalone-1.3.tar.gz
> +sha256  879d76374424dce051b812f16f43c6d16de8dbaddd76002f83fd1b6e57d39e0b  argp-standalone-1.4.1.tar.gz
>   
>   # License file
> -sha256  bbb8919aa520069b0234faf5e83a94052d278419ffe97ca8e843ecc9b212d1ab  argp.h
> +sha256  b5db0353a5b1902fc8a2e055d8899dd0c189ce73a31e67af9a0ffc24711b63f0  README.md
> diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
> index 651bc400f4..80ca04046d 100644
> --- a/package/argp-standalone/argp-standalone.mk
> +++ b/package/argp-standalone/argp-standalone.mk
> @@ -4,11 +4,14 @@
>   #
>   ################################################################################
>   
> -ARGP_STANDALONE_VERSION = 1.3
> -ARGP_STANDALONE_SITE = http://www.lysator.liu.se/~nisse/archive
> +ARGP_STANDALONE_VERSION = 1.4.1
> +ARGP_STANDALONE_SITE = \
> +	$(call github,ericonr,argp-standalone,$(ARGP_STANDALONE_VERSION))
>   ARGP_STANDALONE_INSTALL_STAGING = YES
> -ARGP_STANDALONE_LICENSE = LGPL-2.0+
> -ARGP_STANDALONE_LICENSE_FILES = argp.h
> +ARGP_STANDALONE_LICENSE = LGPL-2.1+
> +ARGP_STANDALONE_LICENSE_FILES = README.md
> +# From git
> +ARGP_STANDALONE_AUTORECONF = YES
>   
>   ARGP_STANDALONE_CONF_ENV = \
>   	CFLAGS="$(TARGET_CFLAGS) -fPIC -fgnu89-inline"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
