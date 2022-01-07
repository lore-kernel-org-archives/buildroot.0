Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07448C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 20:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 947AB60AEB;
	Fri,  7 Jan 2022 20:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id agN6piZIONKT; Fri,  7 Jan 2022 20:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB42160AE6;
	Fri,  7 Jan 2022 20:32:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2AF1BF5DA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83754402D3
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YzTEfRKE-aj5 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 20:32:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E56A401EC
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:32:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DF77682B53; Fri,  7 Jan 2022 20:26:36 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 21:30:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 352252149e5617e6e2c69d09f9e118786db6ffa8
X-Git-Newrev: b1fba3711d03687fb05c2c849ebe11a2761a7474
X-Patchwork-Hint: ignore
Message-Id: <20220107202636.DF77682B53@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-bootlin: update openrisc
 toolchain
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b1fba3711d03687fb05c2c849ebe11a2761a7474
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Bootlin toolchains for the OpenRISC architecture have been rebuilt
with the fix for binutils bug 28735, so let's update their definition
in Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-bootlin/Config.in.options         |  8 ++++----
 .../toolchain-external-bootlin.hash                      | 16 ++++++++--------
 .../toolchain-external-bootlin.mk                        |  8 ++++----
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 898a1ff511..94dea4a386 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -2400,7 +2400,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
-	bool "openrisc musl bleeding-edge 2021.11-1"
+	bool "openrisc musl bleeding-edge 2021.11-4"
 	depends on BR2_or1k
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
@@ -2423,7 +2423,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
-	bool "openrisc musl stable 2021.11-1"
+	bool "openrisc musl stable 2021.11-4"
 	depends on BR2_or1k
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
@@ -2445,7 +2445,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
-	bool "openrisc uclibc bleeding-edge 2021.11-1"
+	bool "openrisc uclibc bleeding-edge 2021.11-4"
 	depends on BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -2468,7 +2468,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
-	bool "openrisc uclibc stable 2021.11-1"
+	bool "openrisc uclibc stable 2021.11-4"
 	depends on BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
index 2a4c4179d4..638130d8b8 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
@@ -192,14 +192,14 @@ sha256  30d82c7ca41a0df9931a29a46ed881f21a889e9e59baf04e820c6679be87a7fb  mips64
 sha256  5c2dc11062f4817e81a328b12ab30be486b7e68c7c876eb45fffca72332a8804  nios2--glibc--bleeding-edge-2021.11-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--stable-2021.11-1.sha256
 sha256  f6f37f1e551edda0251ece8d906ed720bd8ec45da9d4b3e1d13721bdc9ef2882  nios2--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2021.11-1.sha256
-sha256  9b413c970bd3c92cd1c805e2fa1c5d86e808a18985f518be565afd9794a96c60  openrisc--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2021.11-1.sha256
-sha256  71ffaf12c0d8a317d301a236389483a12045064c088c213dd481eeab295e603d  openrisc--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  85171daa8556bba550a48fe9ef7783ef465de79e2f41a2188cefea0c01dcb804  openrisc--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2021.11-1.sha256
-sha256  4f13b2ef95c3dfd886cd696de28bd29b20bc3379103fd6f76c9cf0816d34a5c6  openrisc--uclibc--stable-2021.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2021.11-4.sha256
+sha256  9100a143a2f96c46d4d593fb25f4cab4a2efc61371f12bd1a686fbd52ee64c63  openrisc--musl--bleeding-edge-2021.11-4.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2021.11-4.sha256
+sha256  72fce2be59c18a5b3a02f51ebb83119a0f3d29ab7f2d5cd560038ff6f94f137a  openrisc--musl--stable-2021.11-4.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2021.11-4.sha256
+sha256  ffbdedf741bcfeadaf0c52ac09af83b24eedca2e9a5fc563127c5fdbd10c79a6  openrisc--uclibc--bleeding-edge-2021.11-4.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2021.11-4.sha256
+sha256  082ec406a6a516d582a092e63f9078e200a1e32dc24d47928f90c09b1e61819b  openrisc--uclibc--stable-2021.11-4.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2021.11-1.sha256
 sha256  53afdbe1e48d0c60d560db8d17042a99288661fe10eebbfcfec4e56a6c2ca594  powerpc-440fp--glibc--bleeding-edge-2021.11-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2021.11-1.sha256
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
index 7093feb404..f28592272c 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
@@ -583,25 +583,25 @@ TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/relea
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-4
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-4
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-4
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-4
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
