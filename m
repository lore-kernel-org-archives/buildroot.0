Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53519C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 22:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB54540179;
	Tue, 14 Dec 2021 22:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 85HOQFeniOpR; Tue, 14 Dec 2021 22:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7771401DD;
	Tue, 14 Dec 2021 22:44:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 926801BF681
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 22:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8113D605A5
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 22:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3zzDj_zNku-H for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 22:44:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A765605A2
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 22:44:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so14758324wmc.2
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 14:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KrTwgdP7xbB61Qlz6fY2velFFi4bp/d/65DsfBK8EWY=;
 b=bZgg4MBeUE3Y6ZTUeuKpmKtlTIgUnuMIAhv9UnS6H7losFxR8HKDMWVyK6J9OPxwbQ
 nRmRQOQUTE7NlfcQrRsr1jtWXRPKEhZswRUmuSz71hccKAaeFsU5t5L2oBUR0UxVuWsu
 4FLMHBnn+ITDEqZWh7614qdSPjqqelDaPhGtoVE3kA1bTMsxBuJpssTPWsumgtEad2TN
 mhR5moFQc0YUfa1im3XHm6adiprahAlW/Y49n0HxRz2qClapTFVDfqDWzzEMJThpbuUc
 Arbu4dKC/o2rvGEd0pnlrxvqzlgEuJ1iFcOZ9cRHS0aJBBbp/67VvisX6cboQdyLZSJU
 WqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KrTwgdP7xbB61Qlz6fY2velFFi4bp/d/65DsfBK8EWY=;
 b=SdS+j2R9uOplz6yTApRh8/8FV4y+cGwmbF3Ig374WZ+vHJapam4+/3WK7DQbWfZ+IR
 PU8gLceNchf5W6C6mg5Qub4A3SKO2bWWLVelnRmag9KVN0DsmXnfGcvLhHmCSCu7ZImm
 JgYiZ0MkynfeLTsPLMdiMpR4/TaKybRVePEOD/cBYykeEphVhCN0l6geckn9DxHa9Xsm
 /j61Gvzm/VozDzp6ydfAtW8YD+g3Nm04TeuHNbjLdAawEx5qzQq7gPN9MFF+aYXPL05Y
 iPP4gMkGkrUZWtecOCIQg0zeg0MdGqGDLuASFFPrSFb0qj0IvLEUp4N+O0lYrulYGER4
 aGLA==
X-Gm-Message-State: AOAM533uej/HNUM4/jCA0cg/Cu4VtamBPR2hWhYKdv5QoFWYhtzL9XSH
 2BI4C/qiYz9g5P6d0Cl9zmONsuzDanX2yw==
X-Google-Smtp-Source: ABdhPJwJJQ/ikzWn4bICYCbubLdT8VmRn2MC3w7Z+uKzRWmnoJKVdskRsnGHlwsJ/zmAE42YFNgG7A==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr1866517wmf.149.1639521872180; 
 Tue, 14 Dec 2021 14:44:32 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id s8sm241197wra.9.2021.12.14.14.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 14:44:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 23:44:13 +0100
Message-Id: <20211214224413.3060321-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2, 1/1] package/openblas: bump to version 0.3.18
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

Drop first and second patches (already in version)

https://github.com/xianyi/OpenBLAS/blob/v0.3.18/Changelog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix patch renumbering

 ...sider-Os-when-determining-LAPACK_NO.patch} |  0
 .../0001-fix-gfortran-detection.patch         | 30 ------------
 ...port-for-passing-FFLAGS-on-the-make-.patch | 47 -------------------
 ...on-t-specify-optimization-level-bui.patch} |  0
 package/openblas/openblas.hash                |  2 +-
 package/openblas/openblas.mk                  |  4 +-
 6 files changed, 3 insertions(+), 80 deletions(-)
 rename package/openblas/{0003-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch => 0001-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch} (100%)
 delete mode 100644 package/openblas/0001-fix-gfortran-detection.patch
 delete mode 100644 package/openblas/0002-Makefile-fix-support-for-passing-FFLAGS-on-the-make-.patch
 rename package/openblas/{0004-Makefile.system-don-t-specify-optimization-level-bui.patch => 0002-Makefile.system-don-t-specify-optimization-level-bui.patch} (100%)

diff --git a/package/openblas/0003-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch b/package/openblas/0001-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
similarity index 100%
rename from package/openblas/0003-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
rename to package/openblas/0001-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
diff --git a/package/openblas/0001-fix-gfortran-detection.patch b/package/openblas/0001-fix-gfortran-detection.patch
deleted file mode 100644
index 1fecdac3e5..0000000000
--- a/package/openblas/0001-fix-gfortran-detection.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ece3ce581e3ec530eaccfe7f284c52e115ec7aa9 Mon Sep 17 00:00:00 2001
-From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
-Date: Wed, 10 Feb 2021 14:22:59 +0100
-Subject: [PATCH] Strip parenthesized (pkgversion) data from GCC version string
- to avoid misinterpretation
-
-See https://github.com/xianyi/OpenBLAS/issues/3099 for details.
-
-Upstream-status: backport
-
-[for import into Buildroot]
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-
-
----
- f_check | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/f_check b/f_check
-index e9aca4ff9..ffe9c6b46 100644
---- a/f_check
-+++ b/f_check
-@@ -75,6 +75,7 @@ if ($compiler eq "") {
- 
- 	} elsif ($data =~ /GNU/ || $data =~ /GCC/ ) {
- 
-+            $data =~ s/\(+.*?\)+//g;
- 	    $data =~ /(\d+)\.(\d+).(\d+)/;
- 	    $major = $1;
- 	    $minor = $2;
diff --git a/package/openblas/0002-Makefile-fix-support-for-passing-FFLAGS-on-the-make-.patch b/package/openblas/0002-Makefile-fix-support-for-passing-FFLAGS-on-the-make-.patch
deleted file mode 100644
index 72b387b93e..0000000000
--- a/package/openblas/0002-Makefile-fix-support-for-passing-FFLAGS-on-the-make-.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 4d3829fa52240c2b7e48770ab19584db33ba7863 Mon Sep 17 00:00:00 2001
-From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Date: Fri, 5 Mar 2021 11:17:59 +0100
-Subject: [PATCH] Makefile: fix support for passing FFLAGS on the make
- command line
-
-When openblas is built while passing FFLAGS on the make command line, the
-compilation of lapack objects will not contain the flags specified in
-Makefile but _only_ those passed in FFLAGS.
-
-This can lead to build failure, e.g. because -fPIC is not passed to the
-compilation of most lapack objects, but is given to the link command:
-
-.../buildroot/output/host/bin/x86_64-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -O2 -DMAX_STACK_ALLOC=2048 -Wall -m64 -DF_INTERFACE_GFORT -fPIC -DNO_WARMUP -DMAX_CPU_NUMBER=4 -DMAX_PARALLEL_NUMBER=1 -DVERSION=\"0.3.9\" -DASMNAME= -DASMFNAME=_ -DNAME=_ -DCNAME= -DCHAR_NAME=\"_\" -DCHAR_CNAME=\"\" -DNO_AFFINITY -I..  -shared -o ../libopenblas_nehalem-r0.3.9.so \
--Wl,--whole-archive ../libopenblas_nehalem-r0.3.9.a -Wl,--no-whole-archive \
--Wl,-soname,libopenblas.so.0 -lm -lgfortran -lm -lgfortran
-.../buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/9.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: ../libopenblas_nehalem-r0.3.9.a(sbdsvdx.o): relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a shared object; recompile with -fPIC
-
-In the initial support for this principle, added in commit
-d0e731e8b825e7a554f245aa8f1118dcec9e2728, the flags specified in the
-makefile were appended to the flags specified on the command-line.
-
-Fix this situation by using 'override' for 'FFLAGS' in
-lapack-netlib/make.inc. The flags passed on the command-line are already
-part of the LAPACK_FFLAGS variable, so no '+=' is needed here.
-
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index fc5fe3f5..8ae1ff47 100644
---- a/Makefile
-+++ b/Makefile
-@@ -248,7 +248,7 @@ prof_lapack : lapack_prebuild
- lapack_prebuild :
- ifeq ($(NOFORTRAN), $(filter 0,$(NOFORTRAN)))
- 	-@echo "FC          = $(FC)" > $(NETLIB_LAPACK_DIR)/make.inc
--	-@echo "FFLAGS      = $(LAPACK_FFLAGS)" >> $(NETLIB_LAPACK_DIR)/make.inc
-+	-@echo "override FFLAGS      = $(LAPACK_FFLAGS)" >> $(NETLIB_LAPACK_DIR)/make.inc
- 	-@echo "POPTS       = $(LAPACK_FPFLAGS)" >> $(NETLIB_LAPACK_DIR)/make.inc
- 	-@echo "FFLAGS_NOOPT       = -O0 $(LAPACK_NOOPT)" >> $(NETLIB_LAPACK_DIR)/make.inc
- 	-@echo "PNOOPT      = $(LAPACK_FPFLAGS) -O0" >> $(NETLIB_LAPACK_DIR)/make.inc
--- 
-2.26.2
-
diff --git a/package/openblas/0004-Makefile.system-don-t-specify-optimization-level-bui.patch b/package/openblas/0002-Makefile.system-don-t-specify-optimization-level-bui.patch
similarity index 100%
rename from package/openblas/0004-Makefile.system-don-t-specify-optimization-level-bui.patch
rename to package/openblas/0002-Makefile.system-don-t-specify-optimization-level-bui.patch
diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index c58def9d5d..a1e35f4fc4 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  17d4677264dfbc4433e97076220adc79b050e4f8a083ea3f853a53af253bc380  openblas-0.3.9.tar.gz
+sha256  1632c1e8cca62d8bed064b37747e331a1796fc46f688626337362bf0d16aeadb  openblas-0.3.18.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 60b9d9b15b..4d506fa618 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.9
-OPENBLAS_SITE = $(call github,xianyi,OpenBLAS,v$(OPENBLAS_VERSION))
+OPENBLAS_VERSION = 0.3.18
+OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
 OPENBLAS_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
