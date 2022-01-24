Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B547FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 23:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DB9260B09;
	Mon, 24 Jan 2022 23:01:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PDVqnBJLoAm8; Mon, 24 Jan 2022 23:01:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DCA060F61;
	Mon, 24 Jan 2022 23:01:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE9EB1BF3EC
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB9A860B03
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id huBp8AnEzf8a for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 23:01:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DAE060B06
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 23:01:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8E52C24000B;
 Mon, 24 Jan 2022 23:01:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Tue, 25 Jan 2022 00:00:59 +0100
Message-Id: <20220124230116.203218-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
References: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 01/16]
 toolchain/toolchain-external/toolchain-external-bootlin: re-update OpenRISC
 toolchains
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The OpenRISC toolchains have been rebuilt once again, this time with
the _REENTRANT fixed merged in commit
98e39dc80ee81a166df90b4ff3232038a63b759c ("package/gcc: define
_REENTRANT for OpenRISC when -pthread is passed")

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-bootlin/Config.in.options |  8 ++++----
 .../toolchain-external-bootlin.hash              | 16 ++++++++--------
 .../toolchain-external-bootlin.mk                |  8 ++++----
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 94dea4a386..55b6d4c786 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -2400,7 +2400,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
-	bool "openrisc musl bleeding-edge 2021.11-4"
+	bool "openrisc musl bleeding-edge 2021.11-5"
 	depends on BR2_or1k
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
@@ -2423,7 +2423,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
-	bool "openrisc musl stable 2021.11-4"
+	bool "openrisc musl stable 2021.11-5"
 	depends on BR2_or1k
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
@@ -2445,7 +2445,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
-	bool "openrisc uclibc bleeding-edge 2021.11-4"
+	bool "openrisc uclibc bleeding-edge 2021.11-5"
 	depends on BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -2468,7 +2468,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
-	bool "openrisc uclibc stable 2021.11-4"
+	bool "openrisc uclibc stable 2021.11-5"
 	depends on BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
index 638130d8b8..8819782ac5 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
@@ -192,14 +192,14 @@ sha256  30d82c7ca41a0df9931a29a46ed881f21a889e9e59baf04e820c6679be87a7fb  mips64
 sha256  5c2dc11062f4817e81a328b12ab30be486b7e68c7c876eb45fffca72332a8804  nios2--glibc--bleeding-edge-2021.11-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--stable-2021.11-1.sha256
 sha256  f6f37f1e551edda0251ece8d906ed720bd8ec45da9d4b3e1d13721bdc9ef2882  nios2--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2021.11-4.sha256
-sha256  9100a143a2f96c46d4d593fb25f4cab4a2efc61371f12bd1a686fbd52ee64c63  openrisc--musl--bleeding-edge-2021.11-4.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2021.11-4.sha256
-sha256  72fce2be59c18a5b3a02f51ebb83119a0f3d29ab7f2d5cd560038ff6f94f137a  openrisc--musl--stable-2021.11-4.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2021.11-4.sha256
-sha256  ffbdedf741bcfeadaf0c52ac09af83b24eedca2e9a5fc563127c5fdbd10c79a6  openrisc--uclibc--bleeding-edge-2021.11-4.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2021.11-4.sha256
-sha256  082ec406a6a516d582a092e63f9078e200a1e32dc24d47928f90c09b1e61819b  openrisc--uclibc--stable-2021.11-4.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2021.11-5.sha256
+sha256  03f46c8fdded0002a2a04749bcf86136ec26a841654bf9fdc14575cc510739c6  openrisc--musl--bleeding-edge-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2021.11-5.sha256
+sha256  409e4a7473125e7de7c8b0e6bc1cb971d53e63ac057e9a19102e4ce1467f442a  openrisc--musl--stable-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2021.11-5.sha256
+sha256  9028d4e526f9e805b021791443805541a179eaf2e47a2af4dfbefb2021e44e9f  openrisc--uclibc--bleeding-edge-2021.11-5.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2021.11-5.sha256
+sha256  f07d8e465f7e94e55330cfb55bbaf9fc27e4bb7b688271ead60a15aec3dbbf76  openrisc--uclibc--stable-2021.11-5.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2021.11-1.sha256
 sha256  53afdbe1e48d0c60d560db8d17042a99288661fe10eebbfcfec4e56a6c2ca594  powerpc-440fp--glibc--bleeding-edge-2021.11-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2021.11-1.sha256
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
index f28592272c..64ae44f364 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
@@ -583,25 +583,25 @@ TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/relea
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-4
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-4
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-4
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-4
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
