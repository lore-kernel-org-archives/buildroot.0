Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CB2C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C95B61055;
	Tue,  7 Feb 2023 22:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C95B61055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J6xD9K_Dahuc; Tue,  7 Feb 2023 22:10:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78BDB61067;
	Tue,  7 Feb 2023 22:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78BDB61067
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 542961BF328
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E31D61065
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E31D61065
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCq6DH6DimpE for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:10:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF7E861055
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF7E861055
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:10:09 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.25.48])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B8C6478034D;
 Tue,  7 Feb 2023 23:10:04 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 23:09:38 +0100
Message-Id: <20230207220941.58066-2-ju.o@free.fr>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207220941.58066-1-ju.o@free.fr>
References: <20230207220941.58066-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675807808;
 bh=69UiCyRTEOSex9v3VmTjwpMRoMsDE4GYFQ8osSogrAE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZekB1hFAw669EjeOhM8+KGq/9lWf3SbmhhN40fAXAnd7ZcJMB7K4lqagtn5jU33YY
 FbXhDMUlArIrlHS8nownN6ECtMMO7wqP/JGW+nRrSBEFG2KtqOR+tT17yVbtdnJsCD
 4fLEQk4Sew3bAxyKbTpZFtCSKjmWAY2YFrpxwV+ULjUuDbS4h2GitcrH08LyCEajgy
 AHCAhpVM3LaEI7glEoGHwX3ncX/syRJlPGB8Nij/725T5vmAHf5eYMhRI0ijalLBe6
 eU+nsuAhH2YqTpMsnfLwjmt7qzgkh4UKnqS28iGIF7uOnn1o9eA30MLZiY3O/4cJgn
 VJ5sHFSo/uYew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZekB1hFA
Subject: [Buildroot] [PATCH 2/5] package/openmpi: bump to version 4.1.4
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Notable changes in this commit:

- change from v4.0.x to v4.1.x "current" version series,

- move the sha256 hash out of the "Locally computed" section,
  as the value comes from the download page,

- the LICENSE file hash changed, as the file was updated
  (copyright years updated and new contributors added),

- the IME (Infinite Memory Engine), introduced in v4.1.x,
  is disabled to workaround a failure when cross-compiled,

- the package now requires a toolchain with atomic support,
  and needs to link against libatomic when needed.

For change log since v4.0.0, see:
- https://github.com/open-mpi/ompi/blob/v4.1.4/NEWS#L61

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested on branch master at commit 4fbd2f6 with commands:

    make check-package
    ...
    0 warnings generated

    ./utils/test-pkg -a -p openmpi
                             arm-aarch64 [ 1/44]: OK
                   bootlin-aarch64-glibc [ 2/44]: OK
               bootlin-arcle-hs38-uclibc [ 3/44]: OK
                    bootlin-armv5-uclibc [ 4/44]: OK
                     bootlin-armv7-glibc [ 5/44]: OK
                   bootlin-armv7m-uclibc [ 6/44]: SKIPPED
                      bootlin-armv7-musl [ 7/44]: OK
                bootlin-m68k-5208-uclibc [ 8/44]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/44]: OK
             bootlin-microblazeel-uclibc [10/44]: OK
                bootlin-mipsel32r6-glibc [11/44]: OK
                   bootlin-mipsel-uclibc [12/44]: OK
                     bootlin-nios2-glibc [13/44]: OK
                 bootlin-openrisc-uclibc [14/44]: OK
        bootlin-powerpc64le-power8-glibc [15/44]: OK
           bootlin-powerpc-e500mc-uclibc [16/44]: OK
                   bootlin-riscv32-glibc [17/44]: OK
                   bootlin-riscv64-glibc [18/44]: OK
                    bootlin-riscv64-musl [19/44]: OK
                      bootlin-sh4-uclibc [20/44]: OK
                   bootlin-sparc64-glibc [21/44]: OK
                    bootlin-sparc-uclibc [22/44]: SKIPPED
                    bootlin-x86-64-glibc [23/44]: OK
                     bootlin-x86-64-musl [24/44]: OK
                   bootlin-x86-64-uclibc [25/44]: OK
                   bootlin-xtensa-uclibc [26/44]: OK
                            br-arm-basic [27/44]: SKIPPED
                    br-arm-full-nothread [28/44]: SKIPPED
                      br-arm-full-static [29/44]: SKIPPED
                   br-i386-pentium4-full [30/44]: OK
                br-i386-pentium-mmx-musl [31/44]: OK
                      br-mips64-n64-full [32/44]: OK
                 br-mips64r6-el-hf-glibc [33/44]: OK
               br-powerpc-603e-basic-cpp [34/44]: SKIPPED
               br-powerpc64-power7-glibc [35/44]: OK
                       linaro-aarch64-be [36/44]: OK
                          linaro-aarch64 [37/44]: OK
                              linaro-arm [38/44]: OK
                     sourcery-arm-armv4t [39/44]: OK
                            sourcery-arm [40/44]: OK
                     sourcery-arm-thumb2 [41/44]: OK
                         sourcery-mips64 [42/44]: OK
                           sourcery-mips [43/44]: OK
                          sourcery-nios2 [44/44]: OK
    44 builds, 7 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/openmpi/Config.in    |  1 +
 package/openmpi/openmpi.hash | 10 +++++-----
 package/openmpi/openmpi.mk   | 17 ++++++++++++++---
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/package/openmpi/Config.in b/package/openmpi/Config.in
index 4413c55f9c..80b01a26e1 100644
--- a/package/openmpi/Config.in
+++ b/package/openmpi/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_OPENMPI
 	bool "openmpi"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
diff --git a/package/openmpi/openmpi.hash b/package/openmpi/openmpi.hash
index a399adc758..745ed7c580 100644
--- a/package/openmpi/openmpi.hash
+++ b/package/openmpi/openmpi.hash
@@ -1,6 +1,6 @@
-# From: https://www.open-mpi.org/software/ompi/v4.0/
-md5  e3da67df1e968c8798827e0e5fe9a510  openmpi-4.0.0.tar.bz2
-sha1  fee1d0287abfb150bae16957de342752c9bdd4e8  openmpi-4.0.0.tar.bz2
+# From: https://www.open-mpi.org/software/ompi/v4.1/
+md5  f057e12aabaf7dd5a6a658180fca404e  openmpi-4.1.4.tar.bz2
+sha1  357c61a8e06e103d987c0e4a054e8780a034c8b1  openmpi-4.1.4.tar.bz2
+sha256  92912e175fd1234368c8730c03f4996fe5942e7479bb1d10059405e7f2b3930d  openmpi-4.1.4.tar.bz2
 # Locally computed
-sha256  2f0b8a36cfeb7354b45dda3c5425ef8393c9b04115570b615213faaa3f97366b  openmpi-4.0.0.tar.bz2
-sha256  8298a80ed5f09cfd007bae1c0e7d67d1c2810c6389876778dad070c31a691dac  LICENSE
+sha256  2db71de9577ebfe15c186605844c470dcecd3717f4ef0118c9440d801c0f58f8  LICENSE
diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index 8bdc3fa188..f14b55ced5 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -4,14 +4,21 @@
 #
 ################################################################################
 
-OPENMPI_VERSION_MAJOR = 4.0
-OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).0
+OPENMPI_VERSION_MAJOR = 4.1
+OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).4
 OPENMPI_SITE = https://www.open-mpi.org/software/ompi/v$(OPENMPI_VERSION_MAJOR)/downloads
 OPENMPI_SOURCE = openmpi-$(OPENMPI_VERSION).tar.bz2
 OPENMPI_LICENSE = BSD-3-Clause
 OPENMPI_LICENSE_FILES = LICENSE
 OPENMPI_INSTALL_STAGING = YES
 
+# The macro searching for IME (Infinite Memory Engine) filesystem
+# brings "-I/usr/local/include" in the CPPFLAGS, even if not
+# found. This makes the configuration fail. See:
+# https://github.com/open-mpi/ompi/blob/v4.1.4/config/ompi_check_ime.m4#L35
+# Disable explicitly to avoid the issue.
+OPENMPI_CONF_OPTS = --without-ime
+
 # Enabling Fortran support requires pre-seeding the configure script
 # with various values that cannot be guessed, so we provide cache
 # files for various architectures.
@@ -43,6 +50,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 OPENMPI_CFLAGS += -O0
 endif
 
-OPENMPI_CONF_ENV = CFLAGS="$(OPENMPI_CFLAGS)"
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+OPENMPI_LIBS += -latomic
+endif
+
+OPENMPI_CONF_ENV = CFLAGS="$(OPENMPI_CFLAGS)" LIBS="$(OPENMPI_LIBS)"
 
 $(eval $(autotools-package))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
