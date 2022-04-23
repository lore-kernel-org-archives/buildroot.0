Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A502C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE3CD418C1;
	Sat, 23 Apr 2022 16:28:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDXo6l3_CZ_G; Sat, 23 Apr 2022 16:28:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F51D4183D;
	Sat, 23 Apr 2022 16:28:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F32F51BF95C
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC817417C0
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TcK9V7N8Khm2 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:28:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5332B417CA
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:28:35 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id y20so21828377eju.7
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cCvUnunyeosL4LAxYTchwL8De0VuorAWA8nDTe6e3W0=;
 b=Um2mSSiaoNxCakLqy3cwX8YTW+yPmhwj3aY0XY7/tp75gp4GZCqxaD9nVZleGpXSst
 9bA8knr2Szw+PNMry3bVyv6+wn+sqKMxWr+e+0mbtPjF4CiVZhDKaPta0H9GkVWQdjtU
 j3otb1eegw814emGs7Mdud/d8N/FGA+dApjhE0hgA9QHTh932DVzP9YK0ga8f57eiWcV
 bNW3BJOTsGWCEHWeuoLqR+q+jH8ZHrKh2pEXRK7w3wrxYozGkupYl3RFrXJHQRRC8/cW
 uDnI3xJnek0A09YM3jilEgKuun9o39n5REJ9DRBVg8u+i58wt3gsQcwkZjwBHbnCv1/f
 5CnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cCvUnunyeosL4LAxYTchwL8De0VuorAWA8nDTe6e3W0=;
 b=S5g8BCEsQq86QCf8t6Lgxq9Mcg6uS7qiu2MIm7ojkapyvn5d9XZYXW4i+vC5Ygf1uH
 V2FHVGQ+qig6A9nwYNGtM9myA62ZLDw9Dz0UD9qNdIU3lX/EH0DKGh35aFSyjHTnwj0t
 OS9Dy7j48oUiTzI5GsPmoxc5+on4M58NmOYR4HOvWQ2/BwgW4TvdUbSJwJ8JNoyiEnJB
 V3bUZFasAK/TRfRqTnH8QtanF9XRl1gHgpmelTxu0DOgujrq8f5S16wPreJHHE5851sD
 3Yxu8j4f5Rs+bNJSJTJTqx6MEQzOnGNmeAD4JD3TIgsaEGKUh64rUmJtUO66igxszqlX
 lvZA==
X-Gm-Message-State: AOAM5334MHVxbqIKayFRXFy5dvPpFrPM142yWPga4fn3JKTR2zZuyYX0
 /c6Cy+/qwymcvew5R+qhFQk6WgoNJp/t5Q==
X-Google-Smtp-Source: ABdhPJyWM1N2yqTlSywTTTgnnK+pfq63tt4K29phGUqZC0pV9lf+VwDjufGJP5Qu656ijPgG+WAhiw==
X-Received: by 2002:a17:907:1b1f:b0:6f0:21ec:6051 with SMTP id
 mp31-20020a1709071b1f00b006f021ec6051mr8660517ejc.533.1650731313482; 
 Sat, 23 Apr 2022 09:28:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ka6-20020a170907990600b006ce54c95e3csm1809177ejc.161.2022.04.23.09.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 09:28:33 -0700 (PDT)
Message-ID: <1ad88336-ca06-7b9d-7da4-dae65818731a@mind.be>
Date: Sat, 23 Apr 2022 18:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220421072739.1816817-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220421072739.1816817-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/erofs-utils: fix build with gcc
 4.8
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
Cc: Gao Xiang <hsiangkao@aol.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/04/2022 09:27, Fabrice Fontaine wrote:
> Add upstream patch to disable -Werror and fix the following build
> failure with gcc 4.8 raised since bump to version 1.4 in commit
> c2e32e655802ad917eb240b8c2b7ac343ab55ec1 and
> https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=cf8be8a4352a5df3b3acf545af289cb47faa6de0:
> 
> In file included from /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/string.h:636:0,
>                   from ../include/erofs/internal.h:242,
>                   from ../include/erofs/inode.h:11,
>                   from main.c:12:
> In function 'memset',
>      inlined from 'erofsdump_filetype_distribution.constprop.2' at main.c:583:9:
> /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/bits/string3.h:81:30: error: call to '__warn_memset_zero_len' declared with attribute warning: memset used with constant zero length parameter; this could be due to transposed parameters [-Werror]
>         __warn_memset_zero_len ();
>                                ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/4c776ec935bbb016231b6701471887a7c9ea79e9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../erofs-utils/0005-Add-disable-werror.patch | 136 ++++++++++++++++++
>   1 file changed, 136 insertions(+)
>   create mode 100644 package/erofs-utils/0005-Add-disable-werror.patch
> 
> diff --git a/package/erofs-utils/0005-Add-disable-werror.patch b/package/erofs-utils/0005-Add-disable-werror.patch
> new file mode 100644
> index 0000000000..8b286c3265
> --- /dev/null
> +++ b/package/erofs-utils/0005-Add-disable-werror.patch
> @@ -0,0 +1,136 @@
> +From eb79816f85db164af732a5bcbb42d09214845874 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 21 Apr 2022 00:10:18 +0200
> +Subject: erofs-utils: add --disable-werror
> +
> +Add an option to disable -Werror to fix the following build failure [1] with
> +gcc 4.8 raised since version 1.4 and [2]
> +
> +In file included from /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/string.h:636:0,
> +                 from ../include/erofs/internal.h:242,
> +                 from ../include/erofs/inode.h:11,
> +                 from main.c:12:
> +In function 'memset',
> +    inlined from 'erofsdump_filetype_distribution.constprop.2' at main.c:583:9:
> +/home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/bits/string3.h:81:30: error: call to '__warn_memset_zero_len' declared with attribute warning: memset used with constant zero length parameter; this could be due to transposed parameters [-Werror]
> +       __warn_memset_zero_len ();
> +
> +[1] http://autobuild.buildroot.org/results/4c776ec935bbb016231b6701471887a7c9ea79e9
> +[2] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=cf8be8a4352a
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Link: https://lore.kernel.org/r/20220420221018.1396105-1-fontaine.fabrice@gmail.com
> +Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
> +[Retrieved (and backported) from:
> +https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?h=dev&id=eb79816f85db164af732a5bcbb42d09214845874]
> +---
> + configure.ac     | 13 ++++++++++++-
> + dump/Makefile.am |  2 +-
> + fsck/Makefile.am |  2 +-
> + fuse/Makefile.am |  2 +-
> + lib/Makefile.am  |  2 +-
> + mkfs/Makefile.am |  2 +-
> + 6 files changed, 17 insertions(+), 6 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index fa917e6..53bf882 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -11,7 +11,7 @@ AC_CONFIG_SRCDIR([config.h.in])
> + AC_CONFIG_HEADERS([config.h])
> + AC_CONFIG_MACRO_DIR([m4])
> + AC_CONFIG_AUX_DIR(config)
> +-AM_INIT_AUTOMAKE([foreign -Wall -Werror])
> ++AM_INIT_AUTOMAKE([foreign -Wall])
> +
> + # Checks for programs.
> + AM_PROG_AR
> +@@ -65,6 +65,12 @@ AC_ARG_ENABLE([debug],
> +     [enable_debug="$enableval"],
> +     [enable_debug="no"])
> +
> ++AC_ARG_ENABLE([werror],
> ++    [AS_HELP_STRING([--enable-werror],
> ++                    [enable -Werror @<:@default=no@:>@])],
> ++    [enable_werror="$enableval"],
> ++    [enable_werror="no"])
> ++
> + AC_ARG_ENABLE(lz4,
> +    [AS_HELP_STRING([--disable-lz4], [disable LZ4 compression support @<:@default=enabled@:>@])],
> +    [enable_lz4="$enableval"], [enable_lz4="yes"])
> +@@ -197,6 +203,11 @@ AS_IF([test "x$enable_debug" != "xno"], [], [
> +   CPPFLAGS="$CPPFLAGS -DNDEBUG"
> + ])
> +
> ++# Configure -Werror
> ++AS_IF([test "x$enable_werror" != "xyes"], [], [
> ++  CPPFLAGS="$CPPFLAGS -Werror"
> ++])
> ++
> + # Configure libuuid
> + AS_IF([test "x$with_uuid" != "xno"], [
> +   PKG_CHECK_MODULES([libuuid], [uuid])
> +diff --git a/dump/Makefile.am b/dump/Makefile.am
> +index 9f0cd3f..c2bef6d 100644
> +--- a/dump/Makefile.am
> ++++ b/dump/Makefile.am
> +@@ -5,6 +5,6 @@ AUTOMAKE_OPTIONS = foreign
> + bin_PROGRAMS     = dump.erofs
> + AM_CPPFLAGS = ${libuuid_CFLAGS}
> + dump_erofs_SOURCES = main.c
> +-dump_erofs_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
> ++dump_erofs_CFLAGS = -Wall -I$(top_srcdir)/include
> + dump_erofs_LDADD = $(top_builddir)/lib/liberofs.la ${libselinux_LIBS} \
> + 	${libuuid_LIBS} ${liblz4_LIBS} ${liblzma_LIBS}
> +diff --git a/fsck/Makefile.am b/fsck/Makefile.am
> +index 55b31ea..e6a1fb6 100644
> +--- a/fsck/Makefile.am
> ++++ b/fsck/Makefile.am
> +@@ -5,6 +5,6 @@ AUTOMAKE_OPTIONS = foreign
> + bin_PROGRAMS     = fsck.erofs
> + AM_CPPFLAGS = ${libuuid_CFLAGS}
> + fsck_erofs_SOURCES = main.c
> +-fsck_erofs_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
> ++fsck_erofs_CFLAGS = -Wall -I$(top_srcdir)/include
> + fsck_erofs_LDADD = $(top_builddir)/lib/liberofs.la ${libselinux_LIBS} \
> + 	${libuuid_LIBS} ${liblz4_LIBS} ${liblzma_LIBS}
> +diff --git a/fuse/Makefile.am b/fuse/Makefile.am
> +index 5aa5ac0..3179a2b 100644
> +--- a/fuse/Makefile.am
> ++++ b/fuse/Makefile.am
> +@@ -4,7 +4,7 @@ AUTOMAKE_OPTIONS = foreign
> + noinst_HEADERS = $(top_srcdir)/fuse/macosx.h
> + bin_PROGRAMS     = erofsfuse
> + erofsfuse_SOURCES = dir.c main.c
> +-erofsfuse_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
> ++erofsfuse_CFLAGS = -Wall -I$(top_srcdir)/include
> + erofsfuse_CFLAGS += -DFUSE_USE_VERSION=26 ${libfuse_CFLAGS} ${libselinux_CFLAGS}
> + erofsfuse_LDADD = $(top_builddir)/lib/liberofs.la ${libfuse_LIBS} ${liblz4_LIBS} \
> + 	${libselinux_LIBS} ${liblzma_LIBS}
> +diff --git a/lib/Makefile.am b/lib/Makefile.am
> +index 4a25013..3fad357 100644
> +--- a/lib/Makefile.am
> ++++ b/lib/Makefile.am
> +@@ -28,7 +28,7 @@ noinst_HEADERS += compressor.h
> + liberofs_la_SOURCES = config.c io.c cache.c super.c inode.c xattr.c exclude.c \
> + 		      namei.c data.c compress.c compressor.c zmap.c decompress.c \
> + 		      compress_hints.c hashmap.c sha256.c blobchunk.c
> +-liberofs_la_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
> ++liberofs_la_CFLAGS = -Wall -I$(top_srcdir)/include
> + if ENABLE_LZ4
> + liberofs_la_CFLAGS += ${LZ4_CFLAGS}
> + liberofs_la_SOURCES += compressor_lz4.c
> +diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
> +index 2a4bc1d..709d9bf 100644
> +--- a/mkfs/Makefile.am
> ++++ b/mkfs/Makefile.am
> +@@ -4,6 +4,6 @@ AUTOMAKE_OPTIONS = foreign
> + bin_PROGRAMS     = mkfs.erofs
> + AM_CPPFLAGS = ${libuuid_CFLAGS} ${libselinux_CFLAGS}
> + mkfs_erofs_SOURCES = main.c
> +-mkfs_erofs_CFLAGS = -Wall -Werror -I$(top_srcdir)/include
> ++mkfs_erofs_CFLAGS = -Wall -I$(top_srcdir)/include
> + mkfs_erofs_LDADD = ${libuuid_LIBS} $(top_builddir)/lib/liberofs.la ${libselinux_LIBS} \
> + 	${liblz4_LIBS} ${liblzma_LIBS}
> +--
> +cgit
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
