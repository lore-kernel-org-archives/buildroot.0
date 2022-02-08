Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0A4C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7861401E4;
	Tue,  8 Feb 2022 21:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZB5CG2v4_5ZP; Tue,  8 Feb 2022 21:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2171401B0;
	Tue,  8 Feb 2022 21:35:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 969181BF391
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93976401B0
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uMvg7qGtmON9 for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:35:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5781140168
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:35:26 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso2017963wme.5
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 13:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eCGWe0WT/oOScX7HHtlgN8EekFiLxogBmozWASzhNrg=;
 b=oIA9A6rBkHtvnF78LuqboxQTzm3tyL3+RcWRS63Ex73JztV4RlYSZjuTZ+ah3IL3pS
 g4EA1K8i9XyCaXgInpwnh4V9eyRfN546c6rmbXZ1A6cs3sURSSbdgv/HsXRGgFOgdOri
 BNUu9Cl8QHrTb0AVn1WdpmRKI8ClkNWP2Y5jiojNVvivw97sScDrdmG0EHxxzKwIAbMs
 FKRwPx6tEoPXZ9Xqv78e1/nRvQD1UX03YIWofqd5a2R88jB4a5IFZE12j43WncPIQkmI
 OalJfPoDlyFAQ03huTevApXGXaGyBw72XHWYap+/ZohydppUtqbJ16QyPfkziyeubvm8
 xSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eCGWe0WT/oOScX7HHtlgN8EekFiLxogBmozWASzhNrg=;
 b=RWzNi0ox2RIeN4/F+LrEmMuwK86jmxGvOa/zL92JvwbEqm4yBnxQBypgdeDx3fpSSi
 qOhbfrQUG57ACCpzm4OnxnfNj8naMtHbITRg9GYHiq3DkZmcOd+dkefrJRqa4L9ITH6n
 cI5E2v1ZBtLGsfohEWCabTg9gNCWH4GinLZnlzKgYCAJocRu0EranpO7bUNxFhL3jcWH
 0WErvvjtY849KOWWXa/eMrCteVUz1CUqJrzVx6BP9wBflRg1AtTCPrXb6U6Tz2YG3102
 0kVJzCVTDxqrJIwX6WRvWAqEBtCkc++6XdESSwjAhblDYKS9x0jfZC4a9x72I9a3ZKZ0
 o+Cg==
X-Gm-Message-State: AOAM533ykkLgN4CUzzHXaWLYIdI8A/G9XdB0Siol0h4HN5YXYfzbDxJL
 lalSWC1j6sNqwbp4lEH2fARCvRRJ+t8=
X-Google-Smtp-Source: ABdhPJwVsH1yi1efA2ZjBioIrf9pFoXraDz6fGc0kuVmb5LnRZ/AhJNEsrar5q9zM8IwNn5JSJH2Eg==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr2652407wmq.44.1644356124254; 
 Tue, 08 Feb 2022 13:35:24 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id z3sm3836764wmp.42.2022.02.08.13.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 13:35:23 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:35:14 +0100
Message-Id: <20220208213514.7141-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208213514.7141-1-romain.naour@gmail.com>
References: <20220208213514.7141-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2]
 toolchain/toolchain-external/toolchain-external-bootlin: update with new
 s390x toolchain
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../tests/toolchain/test_external_bootlin.py  | 30 +++++++++++
 .../Config.in.options                         | 51 +++++++++++++++++++
 .../toolchain-external-bootlin.hash           |  4 ++
 .../toolchain-external-bootlin.mk             | 12 +++++
 4 files changed, 97 insertions(+)

diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index cf6174303e..94df9ac488 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -2152,6 +2152,36 @@ class TestExternalToolchainBootlinRiscv64lp64dUclibcStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinS390xz13GlibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_s390x=y
+        BR2_s390x_z13=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "s390x-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinS390xz13GlibcStable(TestExternalToolchain):
+    config = """
+        BR2_s390x=y
+        BR2_s390x_z13=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "s390x-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinShsh4GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_sh=y
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 4b4404620c..53034c4f5e 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -33,6 +33,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_powerpc64le && BR2_powerpc_power8
 	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D
 	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_64 && BR2_RISCV_ABI_LP64D
+	default y if BR2_s390x && BR2_s390x_z13
 	default y if BR2_sh && BR2_sh4
 	default y if BR2_sh && BR2_sh4aeb
 	default y if BR2_sparc64 && BR2_sparc_v9
@@ -3455,6 +3456,56 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE
+	bool "s390x-z13 glibc bleeding-edge 2021.11-1"
+	depends on BR2_s390x
+	depends on BR2_s390x_z13
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the s390x-z13 architecture, using the
+	  glibc C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE
+	bool "s390x-z13 glibc stable 2021.11-1"
+	depends on BR2_s390x
+	depends on BR2_s390x_z13
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the s390x-z13 architecture, using the
+	  glibc C library. This is a stable version, which means it
+	  is using stable and proven versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
 	bool "sh-sh4 glibc bleeding-edge 2021.11-1"
 	depends on BR2_sh
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
index 6542694033..1f2aa1386c 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
@@ -278,6 +278,10 @@ sha256  42ca8024547e51e6126e3c9e711d80815aa4b2997900dfc8af4b9514105e8b78  riscv6
 sha256  02dd9fe4a024f84c7f73b7155640066017c7d18dd90c4da6efe6f0e66d24f75c  riscv64-lp64d--uclibc--bleeding-edge-2021.11-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--stable-2021.11-1.sha256
 sha256  01f061e1b3d106d25614ae5bd64df3a3588bc960caa3bbad14b50f718a558f41  riscv64-lp64d--uclibc--stable-2021.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--bleeding-edge-2021.11-1.sha256
+sha256  d8e657ba00929007e938c7fc398fb5aee8abeceea3ad1cd304c05e7f47d9ef30  s390x-z13--glibc--bleeding-edge-2021.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--stable-2021.11-1.sha256
+sha256  04d8c28bc1af09a949cfe76991379fef4b0876448192625a22c028c7daf92e3f  s390x-z13--glibc--stable-2021.11-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--bleeding-edge-2021.11-1.sha256
 sha256  64c14617fb95b1eeb50564d1e0ccbf73fa73e5e58aea6b192549fc7127e4bd5c  sh-sh4--glibc--bleeding-edge-2021.11-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--stable-2021.11-1.sha256
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
index fb19ef2909..786967052f 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
@@ -840,6 +840,18 @@ TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--stable-$(TOOLCHAIN_EX
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE),y)
 TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
