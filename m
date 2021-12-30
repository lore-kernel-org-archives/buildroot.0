Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4808CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 23:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A45960C23;
	Thu, 30 Dec 2021 23:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R90mzAJ_ls2L; Thu, 30 Dec 2021 23:19:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25EFE60A8F;
	Thu, 30 Dec 2021 23:19:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1294E1BF35B
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 23:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF9E74099E
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 23:19:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gWliT1UknUy5 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 23:19:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30BAC40988
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 23:19:38 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id s1so53163285wrg.1
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=295SwqL9SJBDu6CVu8c9wI2qeHP7WTSzSRxZOXdtKK8=;
 b=NMmFWx7G+KKvYar7s5cHwLQUv+bvceZv5BMyl0CNtWhOGwmaRG0nU+8ashJ/MlN5yX
 YXKoLoq4zHNGj1AI8deeFlYPnaJ3FuVaVa2AguTANEmoCtQPTTPRf+8ZGp8qajvQSQS5
 a4jBE0DVOhpF9qV+kbEtNRi/dvcdDattjC7684EzWHRZc/noNyPU7y6NKD1X4WXRSB/T
 Okmq6xnZRaw8m2CTgb1JUxWpHvxkpd/B+L4dySFG7SVoiVvQ9T4yOyyQIUKbumimGtzE
 IuDx83qyDMw/i1GyJ9qgfo3UeUEDSl+5rTpB36KuXGK2uiHTEeMCmAp5Hben0mYOnVjV
 uCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=295SwqL9SJBDu6CVu8c9wI2qeHP7WTSzSRxZOXdtKK8=;
 b=mvRduWlbq2L6O+TSs/zHPXSM1SK55CkS54baOj9I/Bgz2LmvjyOLKUYF57Y9GWHv5O
 dOTl9LVkfKBQiiNP4AZTq2f3MoOUSTSX7iJNGPTXxix+13kpgz89CD0srrflgz3m6tuq
 HcCIiD9ML45GGnb6zrFMzIeBYzHzjwLRgreISn2qtg+YIbZUQPgDDy4UsGEaU4flixus
 N5swKk2TgYgxxy9/4meRCGxbZatfiKCXuA+Q9rio03Kj1qmvilfNTF+aGgAWCsQ7IzrK
 /bFkkA9jLd7RocINkLg0Cpd/D8/Jaegi6DwfV6qfL3/NFAztKF2sl7bfl9cjL0NG3y2k
 f0HQ==
X-Gm-Message-State: AOAM532haJdS4MTq8RUgx03pK585PTw8FeuUIVajDjm2cdMYcj7QyiyE
 wD3qqqYf8TyFbUnOpt+ybn+R5jDBOG0=
X-Google-Smtp-Source: ABdhPJyQUN1MXlxX28HzOLDV6hS5NzmwE0ODYPdwagUN1e8Y8ywFmCyftt29ws42LiHa4vdrsgzYDg==
X-Received: by 2002:a5d:64a1:: with SMTP id m1mr26355460wrp.503.1640906376316; 
 Thu, 30 Dec 2021 15:19:36 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id v1sm28980850wru.45.2021.12.30.15.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 15:19:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 00:18:36 +0100
Message-Id: <20211230231836.3197707-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/file: bump to version 5.41
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version) and so autoreconf
- Update hash of vasprintf.c (changes not related to license:
  https://github.com/file/file/commit/80816651588efb79a5d054e13703bf2a3378d024
  https://github.com/file/file/commit/43f7989076aa3731f3558c6954780bc7b2734b64)

https://github.com/file/file/blob/FILE5_41/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/file/0001-Add-libmagic.pc.patch | 76 -------------------------
 package/file/file.hash                  | 10 ++--
 package/file/file.mk                    |  4 +-
 3 files changed, 6 insertions(+), 84 deletions(-)
 delete mode 100644 package/file/0001-Add-libmagic.pc.patch

diff --git a/package/file/0001-Add-libmagic.pc.patch b/package/file/0001-Add-libmagic.pc.patch
deleted file mode 100644
index b26d16224d..0000000000
--- a/package/file/0001-Add-libmagic.pc.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From d079cac1110cc2761417f0dcb0a142b217eb1eda Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 31 Jan 2020 20:26:29 +0100
-Subject: [PATCH] Add libmagic.pc
-
-libmagic can optionally depends on xz (for lzma) or bzip2 since version
-5.38 and
-https://github.com/file/file/commit/b259a07ea95827f565faa20f0316e5b2704064f7
-so add libmagic.pc so package (such as gerbera) that links with libmagic
-will be able to use pkg-config to retrieve those static dependencies
-For example, this will avoid the following build failure:
-
-[100%] Linking CXX executable gerbera
-/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/br-user/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmagic.a(compress.o): in function `uncompressbuf':
-compress.c:(.text+0x69c): undefined reference to `BZ2_bzDecompressInit'
-/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x710): undefined reference to `BZ2_bzDecompress'
-/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x730): undefined reference to `BZ2_bzDecompressEnd'
-/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x7bc): undefined reference to `lzma_auto_decoder'
-/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x828): undefined reference to `lzma_code'
-/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x848): undefined reference to `lzma_end'
-
-Fixes:
- - http://autobuild.buildroot.org/results/37b1ef54dc41100689f311fbc31fc9300dc6ae63
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://bugs.astron.com/view.php?id=136]
----
- Makefile.am    |  5 +++++
- configure.ac   |  2 +-
- libmagic.pc.in | 10 ++++++++++
- 3 files changed, 16 insertions(+), 1 deletion(-)
- create mode 100644 libmagic.pc.in
-
-diff --git a/Makefile.am b/Makefile.am
-index 8bd927d9..2ab67ed7 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -3,3 +3,8 @@ ACLOCAL_AMFLAGS = -I m4
- EXTRA_DIST = MAINT
- 
- SUBDIRS = src magic tests doc python
-+
-+# This variable must have 'exec' in its name, in order to be installed
-+# by 'install-exec' target (instead of default 'install-data')
-+pkgconfigexecdir = $(libdir)/pkgconfig
-+pkgconfigexec_DATA = libmagic.pc
-diff --git a/configure.ac b/configure.ac
-index ac37fccd..b2e2e5b8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -217,5 +217,5 @@ if  test "$ac_cv_header_lzma_h$ac_cv_lib_lzma_lzma_stream_decoder" = "yesyes"; t
-   AC_DEFINE([XZLIBSUPPORT], 1, [Enable xzlib compression support])
- fi
- 
--AC_CONFIG_FILES([Makefile src/Makefile magic/Makefile tests/Makefile doc/Makefile python/Makefile])
-+AC_CONFIG_FILES([Makefile src/Makefile magic/Makefile tests/Makefile doc/Makefile python/Makefile libmagic.pc])
- AC_OUTPUT
-diff --git a/libmagic.pc.in b/libmagic.pc.in
-new file mode 100644
-index 00000000..3ad1290b
---- /dev/null
-+++ b/libmagic.pc.in
-@@ -0,0 +1,10 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+
-+Name: libmagic
-+Description: Magic number recognition library
-+Version: @VERSION@
-+Libs: -L${libdir} -lmagic
-+Libs.private: @LIBS@
--- 
-2.24.1
-
diff --git a/package/file/file.hash b/package/file/file.hash
index 96efaf8483..33875776eb 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,7 +1,7 @@
 # Locally calculated after verifying signature
-# ftp://ftp.astron.com/pub/file/file-5.38.tar.gz.asc
+# ftp://ftp.astron.com/pub/file/file-5.41.tar.gz.asc
 # using key BE04995BA8F90ED0C0C176C471112AB16CB33B3A
-sha256 593c2ffc2ab349c5aea0f55fedfe4d681737b6b62376a9b3ad1e77b2cc19fa34  file-5.38.tar.gz
-sha256 0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
-sha256 4ccb60d623884ef637af4a5bc16b2cb350163e2135e967655837336019a64462  src/mygetopt.h
-sha256 58b5932aca6c10f2194290a3b26088ec9ba07ef6b52cc9bb2dd638cc634db6f1  src/vasprintf.c
+sha256  13e532c7b364f7d57e23dfeea3147103150cb90593a57af86c10e4f6e411603f  file-5.41.tar.gz
+sha256  0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
+sha256  4ccb60d623884ef637af4a5bc16b2cb350163e2135e967655837336019a64462  src/mygetopt.h
+sha256  c4fa92d6504b88484a12140fe3e24b9b29b0112717f94b1ff4205d54828b1c70  src/vasprintf.c
diff --git a/package/file/file.mk b/package/file/file.mk
index c41a8eb3a4..12647af8bb 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.38
+FILE_VERSION = 5.41
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file
 HOST_FILE_DEPENDENCIES = host-zlib
@@ -13,8 +13,6 @@ FILE_INSTALL_STAGING = YES
 FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
 FILE_CPE_ID_VENDOR = file_project
-# We're patching configure.ac
-FILE_AUTORECONF = YES
 HOST_FILE_CONF_OPTS = --disable-libseccomp
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
