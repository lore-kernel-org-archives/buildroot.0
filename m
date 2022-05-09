Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F24BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 21:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E269860EEA;
	Mon,  9 May 2022 21:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uEg4rc2IuFhM; Mon,  9 May 2022 21:11:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5C9A60EF7;
	Mon,  9 May 2022 21:11:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 797AA1BF2C6
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 21:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7615F81754
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 21:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AXoLblVqDxE1 for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 21:11:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C2AB8174C
 for <buildroot@busybox.net>; Mon,  9 May 2022 21:11:03 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e24so21132933wrc.9
 for <buildroot@busybox.net>; Mon, 09 May 2022 14:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5C6KKRDcS/kR6K4jgVjM0dRYEgW9gmGw9z/Kg1ZH5ps=;
 b=nn/136iFfGTvxrqIwuu3ZyRlMS5l2JW5DUdJ911YjYw8KyBy/6vId/oCd3/7peuoFN
 VrD+PyT1kh8bB05qfeQRJgfZQjI+28xryPCc/JxcsxRSJaiaHueVRLBs3RtwlXoX3zco
 z8y5QqjG5uGplqGpJYbpLtzMjFMwJrWtzrwEEssa9fHEbx261hDzltnEDuHeMCuFaqWK
 4GQlBdsLwNs1/DoaWBLkJEyQdTlL4XN8yjOjlbcwADoEj9xc9TOPPDFCdPWeoC4TBWjU
 +Q7g9XfO6ML/Bt/6o3GUO1cNw4a2jkDTidnqootyQdiNLnlzD6YEkM9lY0N+oztMMqvl
 MMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5C6KKRDcS/kR6K4jgVjM0dRYEgW9gmGw9z/Kg1ZH5ps=;
 b=DjXohtOQ3mtlf+cBqI1oYM9dVG8VGBZ6psSis5f1QpLKbdzqes9sw8RViXD92T6ltx
 x68rG9x1v3Aui5CIUuh8d1ph2ilobodKifJy5RUXNPVCpw/DQjvpsL8pYI5VGJKckljB
 WTDTpR9z/n5iPTZzVqS6zxI7pDb/RVLY0tmFstNUfURwtzCdFPuD8GACZu87ijYfdWxy
 55PApeyb48cR/kr6f6vX1dgtGuSQ9HuoWULhVq1Zd6/xHGeYNxahNui+3a0BLCzlAsjj
 AGh6RLoIz+mFgguB3k8pp3z6G9dPWGtoNRjC2rtJTtjsIr78n1jzysBtf7V0OLawi72H
 bnyA==
X-Gm-Message-State: AOAM532zes3uq4sGIyo1muPEZesmCoL7NoT8BLzAO2FEcPtA9bKPE5AO
 7tex33D0g/if45MCJe9MvvhPz5BtGRI=
X-Google-Smtp-Source: ABdhPJy8Gq3GMgVsegdp7aBam3Qzay0xrPw5SeV/4YwbFNuAt6hYvPkAvx5u81n+E00uEDamuKUxdA==
X-Received: by 2002:a05:6000:1f04:b0:20c:a0c3:b710 with SMTP id
 bv4-20020a0560001f0400b0020ca0c3b710mr16258064wrb.660.1652130661632; 
 Mon, 09 May 2022 14:11:01 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 l68-20020a1c2547000000b003947b59dfdesm355649wml.36.2022.05.09.14.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 14:11:00 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 May 2022 23:10:45 +0200
Message-Id: <20220509211045.192482-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/htop: bump to version 3.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove merged patch,
and AUTORECONF becomes useless.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...igure.ac-fix-static-build-with-hwloc.patch | 54 -------------------
 package/htop/htop.hash                        |  4 +-
 package/htop/htop.mk                          |  3 +-
 3 files changed, 3 insertions(+), 58 deletions(-)
 delete mode 100644 package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch

diff --git a/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch b/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
deleted file mode 100644
index 0ac79766c..000000000
--- a/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 4ccad4604586c921b4ad831b254496c2cdece9fc Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 2 Apr 2022 17:27:01 +0200
-Subject: [PATCH] configure.ac: fix static build with hwloc
-
-Retrieve hwloc dependencies through pkg-config to avoid the following
-static build failure:
-
-checking for hwloc_get_proc_cpubind in -lhwloc... no
-configure: error: can not find required library libhwloc
-
-This build failure is raised because without pkg-config, hwloc
-dependencies such as libxml2 are not retrieved:
-
-configure:8999: checking for hwloc_get_proc_cpubind in -lhwloc
-configure:9022: /home/autobuild/autobuild/instance-0/output-1/host/bin/powerpc-buildroot-linux-uclibc-gcc -o conftest -D_GNU_SOURCE -I/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Og -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lhwloc  -llzma -L/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/lib -lncurses -lm   >&5
-/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../usr/lib/libhwloc.a(topology-xml-libxml.o): in function `hwloc_libxml_free_buffer':
-topology-xml-libxml.c:(.text+0x6a): undefined reference to `xmlFree'
-
-Fixes:
- - http://autobuild.buildroot.org/results/5d815ec08c580005a863df6ac9ac29deff7d4128
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/htop-dev/htop/commit/4ccad4604586c921b4ad831b254496c2cdece9fc]
----
- configure.ac | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4ecac1ecf..6bb7eb69f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -456,8 +456,18 @@ case "$enable_hwloc" in
-    no)
-       ;;
-    yes)
--      AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
--      AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
-+      m4_ifdef([PKG_PROG_PKG_CONFIG], [
-+         PKG_PROG_PKG_CONFIG()
-+         PKG_CHECK_MODULES(HWLOC, hwloc, [
-+               CFLAGS="$CFLAGS $HWLOC_CFLAGS" LIBS="$LIBS $HWLOC_LIBS"
-+            ], [
-+               AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
-+               AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
-+            ])
-+         ], [
-+            AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([can not find required library libhwloc])])
-+            AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h])])
-+         ])
-       ;;
-    *)
-       AC_MSG_ERROR([bad value '$enable_hwloc' for --enable-hwloc])
diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index d7c39be4d..908dd32c4 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From https://github.com/htop-dev/htop/releases/download/3.1.2/htop-3.1.2.tar.xz.sha256
-sha256  884bce5b58cb113127860b9e368609019e92416a81550fdf0752052f3a64b388  htop-3.1.2.tar.xz
+# From https://github.com/htop-dev/htop/releases/download/3.2.0/htop-3.2.0.tar.xz.sha256
+sha256  e0f645d4ac324f2c4c48aaa7a3a96d007b95516559550be0b56e423fc5b6d783  htop-3.2.0.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 1e7b171a1..f4d9032d4 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.1.2
+HTOP_VERSION = 3.2.0
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-HTOP_AUTORECONF = YES
 # Prevent htop build system from searching the host paths
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 HTOP_LICENSE = GPL-2.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
