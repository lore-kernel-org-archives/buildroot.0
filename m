Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2E7C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 20:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7992B607B4;
	Tue, 28 Feb 2023 20:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7992B607B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrIzJL5wcujC; Tue, 28 Feb 2023 20:27:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88E7E60AA5;
	Tue, 28 Feb 2023 20:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88E7E60AA5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6412A1BF293
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4811C40142
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4811C40142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OkKx0C4T5mBy for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 20:27:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0BD240126
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0BD240126
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 20:27:37 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.147.59])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4022178034E;
 Tue, 28 Feb 2023 21:27:33 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 21:27:20 +0100
Message-Id: <20230228202720.6762-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677616054;
 bh=eNO+rMfR381mMci7YfLJGhxAcq8qtBbft6k0OwTqBH4=;
 h=From:To:Cc:Subject:Date:From;
 b=pMtE7Z1gNNQXuNJsZbM5mwwIlJcJQVXkCdsTRu3CDyvgCFh5rtQNNsbjkUgdgU4DA
 3DxaFqPUQDDAEkJlWBFQ2YiFtP4f14/PS9l3Uld33L9IqFUvj+be6N0two9ysi5KNt
 rOI3+y4zIYugzXpP1lCGTMh/cG55WLTYBLvmNwaC+HDwVFZNrH8AVy7SrqAUA0Nm8Z
 0eOvJlTpi5it1v+/QKpKmEOjT03dK7XSN4K/RjRnFah72L4xDs7qAgsw2J3OFH0j+e
 3TXhc9AqraYdgyQ1oTpMo6hWH2j0tavBa0anlNXwmNF61TEKE+4coSOjPS/bceQpC6
 V3UMWe2K/w43A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pMtE7Z1g
Subject: [Buildroot] [PATCH next 1/1] package/openmpi: bump to version 4.1.5
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://github.com/open-mpi/ompi/blob/v4.1.5/NEWS#L61

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit b793f3a with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p openmpi
                             arm-aarch64 [ 1/45]: OK
                   bootlin-aarch64-glibc [ 2/45]: OK
               bootlin-arcle-hs38-uclibc [ 3/45]: OK
                    bootlin-armv5-uclibc [ 4/45]: OK
                     bootlin-armv7-glibc [ 5/45]: OK
                   bootlin-armv7m-uclibc [ 6/45]: SKIPPED
                      bootlin-armv7-musl [ 7/45]: OK
                bootlin-m68k-5208-uclibc [ 8/45]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/45]: OK
             bootlin-microblazeel-uclibc [10/45]: OK
                bootlin-mipsel32r6-glibc [11/45]: OK
                   bootlin-mipsel-uclibc [12/45]: OK
                     bootlin-nios2-glibc [13/45]: OK
                 bootlin-openrisc-uclibc [14/45]: OK
        bootlin-powerpc64le-power8-glibc [15/45]: OK
           bootlin-powerpc-e500mc-uclibc [16/45]: OK
                   bootlin-riscv32-glibc [17/45]: OK
                   bootlin-riscv64-glibc [18/45]: OK
                    bootlin-riscv64-musl [19/45]: OK
                 bootlin-s390x-z13-glibc [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                   bootlin-sparc64-glibc [22/45]: OK
                    bootlin-sparc-uclibc [23/45]: SKIPPED
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: OK
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: SKIPPED
                      br-arm-full-static [30/45]: SKIPPED
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: SKIPPED
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: OK
                           sourcery-mips [44/45]: OK
                          sourcery-nios2 [45/45]: OK
    45 builds, 7 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/openmpi/openmpi.hash | 6 +++---
 package/openmpi/openmpi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openmpi/openmpi.hash b/package/openmpi/openmpi.hash
index 745ed7c580..567ffe4833 100644
--- a/package/openmpi/openmpi.hash
+++ b/package/openmpi/openmpi.hash
@@ -1,6 +1,6 @@
 # From: https://www.open-mpi.org/software/ompi/v4.1/
-md5  f057e12aabaf7dd5a6a658180fca404e  openmpi-4.1.4.tar.bz2
-sha1  357c61a8e06e103d987c0e4a054e8780a034c8b1  openmpi-4.1.4.tar.bz2
-sha256  92912e175fd1234368c8730c03f4996fe5942e7479bb1d10059405e7f2b3930d  openmpi-4.1.4.tar.bz2
+md5  bb045df2d600744c2231c78b31a20da3  openmpi-4.1.5.tar.bz2
+sha1  eba2e6f9ee0c39fbca0a8cf53a79c9ed29643284  openmpi-4.1.5.tar.bz2
+sha256  a640986bc257389dd379886fdae6264c8cfa56bc98b71ce3ae3dfbd8ce61dbe3  openmpi-4.1.5.tar.bz2
 # Locally computed
 sha256  2db71de9577ebfe15c186605844c470dcecd3717f4ef0118c9440d801c0f58f8  LICENSE
diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index f14b55ced5..82a4b3eb1c 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENMPI_VERSION_MAJOR = 4.1
-OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).4
+OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).5
 OPENMPI_SITE = https://www.open-mpi.org/software/ompi/v$(OPENMPI_VERSION_MAJOR)/downloads
 OPENMPI_SOURCE = openmpi-$(OPENMPI_VERSION).tar.bz2
 OPENMPI_LICENSE = BSD-3-Clause
@@ -15,7 +15,7 @@ OPENMPI_INSTALL_STAGING = YES
 # The macro searching for IME (Infinite Memory Engine) filesystem
 # brings "-I/usr/local/include" in the CPPFLAGS, even if not
 # found. This makes the configuration fail. See:
-# https://github.com/open-mpi/ompi/blob/v4.1.4/config/ompi_check_ime.m4#L35
+# https://github.com/open-mpi/ompi/blob/v4.1.5/config/ompi_check_ime.m4#L35
 # Disable explicitly to avoid the issue.
 OPENMPI_CONF_OPTS = --without-ime
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
