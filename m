Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496D6C25B75
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 09:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 627988329E;
	Mon, 13 May 2024 09:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OB3YsefwzOBZ; Mon, 13 May 2024 09:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA300832D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA300832D1;
	Mon, 13 May 2024 09:20:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D76191BF239
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 09:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA82381FE0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 09:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQN51YwCyGLg for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 09:19:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1881C81A64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1881C81A64
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1881C81A64
 for <buildroot@busybox.net>; Mon, 13 May 2024 09:19:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.197]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH5Q-1sinw43kOS-00ZfKR
 for <buildroot@busybox.net>; Mon, 13 May 2024 11:19:52 +0200
To: buildroot@busybox.net
Date: Mon, 13 May 2024 11:19:47 +0200
Message-ID: <20240513091950.30116-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240513091950.30116-1-ps.report@gmx.net>
References: <20240513091950.30116-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:3G3Hz+8AYKVlwPfgrCJXtDNuSTHyJTPxxSmAdalvHEPX/8+xiEl
 1W7dCIA7ihhU1ZKCLfPms0uLD1TkNCog76M0Jdg6Nd2SofB3iFnvi7XR8iZym930o/wfF4V
 8YxRgFqlquqEtqPN6vrQ9trLLaU5lAtDbW5T/3IAd1+OywkOu5Xb4aRC8cuw5kePp6OuNr3
 4lyZS0/WsraJmdGnLMUpg==
UI-OutboundReport: notjunk:1;M01:P0:MlsaO5oY1W0=;fAhdjV8InFYUKB8PfqvJNc99uv4
 IDI1BIl13v9ZQ91Uv9L/DGqYEAwTsk7zhIYh6P40HxL1X4/PjcgnPKLHsUIMAuYtxRS0txScG
 TXyPWMglxxdrPzOHBN1cBVVLL+/T4GqDWio50u/VMR0YX22JdWa6repSGnZeULDU9uKkBY6Rw
 AwA3tm1SYMILosDdj8LvGqvQ5p8VkkQ7pIYNDBkaxpAp1fWiB3uC823G13N8iHfUSOXVmyxsp
 2JUfFsbPkAywUD7vgfJ4bMng5yOIO1o0002u9ax6KuzCK6fbfTyjonAueCUeQXADmE79rWh7U
 c6bkdf/We5bc4XPBKlcE2KURcekI00d6eKejnOPOubClpdLMOFM2b9jKDfUr6/fVKXirrj2fu
 etP3Q1aF0yMDVASqPYHGKuI65C81Q7N7OekGXam5POvOMg0FA+p3PrvjZePZ1LZ6ReohxmUpK
 C844fNEVwTvX7u1KVeWXJhmGgWuOs11WpjOQG1X5rDuWovVhJxgNjq5O31pjGPpY7WH48Q07Y
 jOxA1DmPw8171UvpAstfkUYg+edBDatUlyRZUqFpsqt4wRM728LBx0MEnENNB5Fzc8DTQKzFj
 nXWCMOcxBFOe8GPac5I2JH5oOaiM4mf5hEbMStFj8lPEn28AM5u/yREzMQ9dYoNBlVjhRz8xn
 3oR63p6dKuCkLe6qSg/3Z3lZ3zrmAExP0Sx1aFz2GPkX3CK+SfAGG8shfJAENTK/PuCG1rmuz
 cnzUC7rcDD9pGmpGMib4Grz4d2l+WIvvSADTsMgVyjbUX7KaP3afOYZ/Uw3Q0PqSq+tT3Fr6D
 kXyLjKlLHvX1nqklGdY8hqVa35ZnETFTO+ioyY6AqynbE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715591993; x=1716196793; i=ps.report@gmx.net;
 bh=LHEMo80BhDI/h45WNt3bpI7rlMuvqG95EY00j5j1AM8=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dg/SfNYQxHXU7y5tc69fW38jFSkLnmBbW5UZRJbchtCfpCnwJG5zeZMD7pcExPIq
 botRDc2N4zRvP6K+EkHhWrHnFdVE98ClYMVbqVXAfgKMhI16bcMquBMAOtEyt5E5H
 5f6O4MCClWfkTefMRGVJOZdSdJFURFkSFsJI7Z1nmVUci4SMFIq1F/uhGDrHKA592
 fnVIKSED42SQvW6Li2FllIH9anv6FRnMfcOrze8W/Nmj8QQ/9bLMuzLreBmYt0oj6
 qPBvFyClSCXs3MGkZKqBmdICMAe1xaCLYiWgn1QHeKoCU1r9UUscUfrODPJvsemG1
 8RuIuVAwux3wfxNtcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=dg/SfNYQ
Subject: [Buildroot] [PATCH v2 3/4] support/kconfig: reference environment
 variables directly (remove 'option env=')
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- reference environment variables directly (remove 'option env='), see
  upstream commit [1]:

  BR2_VERSION --> BR2_VERSION_FULL
  BR2_HOSTARCH --> HOSTARCH
  BR2_SKIP_LEGACY --> SKIP_LEGACY
  BR2_BASE_DIR --> BASE_DIR
  BR2_HOST_GCC_VERSION --> HOST_GCC_VERSION
  BR2_DEFCONFIG_FROM_ENV --> BR2_DEFCONFIG

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=104daea149c45cc84842ce77a9bd6436d19f3dd8

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - moved escape fixes to extra/preliminary patch

Notes/ToDo:
  - take a look at BR2_HOSTARCH usage in utils/checksymbolslib/br.py
  - take a look at BR2_BASE_DIR usage in utils/checksymbolslib/br.py and
    utils/checksymbolslib/test_kconfig.py
---
 Config.in                                     | 45 +++++--------------
 Config.in.legacy                              |  6 +--
 boot/arm-trusted-firmware/Config.in           |  2 +-
 boot/beaglev-ddrinit/Config.in                |  2 +-
 boot/beaglev-secondboot/Config.in             |  2 +-
 boot/s500-bootloader/Config.in                |  2 +-
 linux/Config.ext.in                           |  2 +-
 package/amlogic-boot-fip/Config.in.host       |  2 +-
 package/erlang/Config.in                      |  6 +--
 package/flutter-sdk-bin/Config.in.host        |  2 +-
 package/go-bootstrap-stage1/Config.in.host    |  6 +--
 package/google-breakpad/Config.in.host        | 12 ++---
 package/jpeg/Config.in                        |  2 +-
 package/kvm-unit-tests/Config.in              |  2 +-
 package/luajit/Config.in                      |  4 +-
 package/mono/Config.in                        |  4 +-
 package/nodejs/Config.in.host                 |  8 ++--
 package/openjdk/Config.in                     |  4 +-
 package/openssl/Config.in                     |  2 +-
 package/protobuf/Config.in                    | 22 ++++-----
 package/qt5/qt5webengine/Config.in            |  2 +-
 package/rustc/Config.in.host                  | 16 +++----
 package/sam-ba/Config.in.host                 |  2 +-
 package/supertuxkart/Config.in                |  4 +-
 package/ti-cgt-pru/Config.in.host             |  2 +-
 package/ti-gfx/Config.in                      |  2 +-
 package/wine/Config.in                        |  6 +--
 system/Config.in                              |  4 +-
 toolchain/toolchain-external/Config.in        |  2 +-
 .../Config.in                                 |  2 +-
 .../toolchain-external-arm-aarch64/Config.in  |  2 +-
 .../toolchain-external-arm-arm/Config.in      |  2 +-
 .../toolchain-external-bootlin/Config.in      |  2 +-
 .../Config.in                                 |  2 +-
 .../Config.in                                 |  2 +-
 .../Config.in                                 |  2 +-
 .../toolchain-external-linaro-arm/Config.in   |  2 +-
 .../toolchain-external-linaro-armeb/Config.in |  2 +-
 .../toolchain-external-synopsys-arc/Config.in |  2 +-
 39 files changed, 86 insertions(+), 111 deletions(-)

diff --git a/Config.in b/Config.in
index 035900c971..1d35d6e50e 100644
--- a/Config.in
+++ b/Config.in
@@ -1,68 +1,51 @@
 #
 
-mainmenu "Buildroot $BR2_VERSION Configuration"
+mainmenu "Buildroot $(BR2_VERSION_FULL) Configuration"
 
 config BR2_HAVE_DOT_CONFIG
 	bool
 	default y
 
-config BR2_VERSION
-	string
-	option env="BR2_VERSION_FULL"
-
-config BR2_HOSTARCH
-	string
-	option env="HOSTARCH"
-
-config BR2_BASE_DIR
-	string
-	option env="BASE_DIR"
-
 # br2-external paths definitions
-source "$BR2_BASE_DIR/.br2-external.in.paths"
-
-# Hidden config symbols for packages to check system gcc version
-config BR2_HOST_GCC_VERSION
-	string
-	option env="HOST_GCC_VERSION"
+source "$(BASE_DIR)/.br2-external.in.paths"
 
 config BR2_HOST_GCC_AT_LEAST_4_9
 	bool
-	default y if BR2_HOST_GCC_VERSION = "4 9"
+	default y if "$(HOST_GCC_VERSION)" = "4 9"
 
 config BR2_HOST_GCC_AT_LEAST_5
 	bool
-	default y if BR2_HOST_GCC_VERSION = "5"
+	default y if "$(HOST_GCC_VERSION)" = "5"
 	select BR2_HOST_GCC_AT_LEAST_4_9
 
 config BR2_HOST_GCC_AT_LEAST_6
 	bool
-	default y if BR2_HOST_GCC_VERSION = "6"
+	default y if "$(HOST_GCC_VERSION)" = "6"
 	select BR2_HOST_GCC_AT_LEAST_5
 
 config BR2_HOST_GCC_AT_LEAST_7
 	bool
-	default y if BR2_HOST_GCC_VERSION = "7"
+	default y if "$(HOST_GCC_VERSION)" = "7"
 	select BR2_HOST_GCC_AT_LEAST_6
 
 config BR2_HOST_GCC_AT_LEAST_8
 	bool
-	default y if BR2_HOST_GCC_VERSION = "8"
+	default y if "$(HOST_GCC_VERSION)" = "8"
 	select BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_HOST_GCC_AT_LEAST_9
 	bool
-	default y if BR2_HOST_GCC_VERSION = "9"
+	default y if "$(HOST_GCC_VERSION)" = "9"
 	select BR2_HOST_GCC_AT_LEAST_8
 
 config BR2_HOST_GCC_AT_LEAST_10
 	bool
-	default y if BR2_HOST_GCC_VERSION = "10"
+	default y if "$(HOST_GCC_VERSION)" = "10"
 	select BR2_HOST_GCC_AT_LEAST_9
 
 config BR2_HOST_GCC_AT_LEAST_11
 	bool
-	default y if BR2_HOST_GCC_VERSION = "11"
+	default y if "$(HOST_GCC_VERSION)" = "11"
 	select BR2_HOST_GCC_AT_LEAST_10
 
 # When adding new entries above, be sure to update
@@ -183,13 +166,9 @@ config BR2_TAR_OPTIONS
 
 endmenu
 
-config BR2_DEFCONFIG_FROM_ENV
-	string
-	option env="BR2_DEFCONFIG"
-
 config BR2_DEFCONFIG
 	string "Location to save buildroot config"
-	default BR2_DEFCONFIG_FROM_ENV if BR2_DEFCONFIG_FROM_ENV != ""
+	default "$(BR2_DEFCONFIG)" if "$(BR2_DEFCONFIG)" != ""
 	default "$(CONFIG_DIR)/defconfig"
 	help
 	  When running 'make savedefconfig', the defconfig file will be
@@ -988,4 +967,4 @@ source "package/Config.in.host"
 source "Config.in.legacy"
 
 # br2-external menus definitions
-source "$BR2_BASE_DIR/.br2-external.in.menus"
+source "$(BASE_DIR)/.br2-external.in.menus"
diff --git a/Config.in.legacy b/Config.in.legacy
index 46f7a304cb..c8d916e1fc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -90,11 +90,7 @@
 #
 # [End of example]
 
-config BR2_SKIP_LEGACY
-	bool
-	option env="SKIP_LEGACY"
-
-if !BR2_SKIP_LEGACY
+if "$(SKIP_LEGACY)" = ""
 
 config BR2_LEGACY
 	bool
diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 2fe3dd1146..6cf8e88929 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -243,7 +243,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
 	bool "Needs arm-none-eabi toolchain"
 	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	help
 	  Select this option if your ATF board configuration requires
 	  an ARM32 bare metal toolchain to be available.
diff --git a/boot/beaglev-ddrinit/Config.in b/boot/beaglev-ddrinit/Config.in
index 7ca92a7b9b..585b2ba7be 100644
--- a/boot/beaglev-ddrinit/Config.in
+++ b/boot/beaglev-ddrinit/Config.in
@@ -1,7 +1,7 @@
 config BR2_TARGET_BEAGLEV_DDRINIT
 	bool "beaglev-ddrinit"
 	depends on BR2_riscv
-	depends on BR2_HOSTARCH = "x86_64" # host-riscv64-elf-toolchain
+	depends on "$(HOSTARCH)" = "x86_64" # host-riscv64-elf-toolchain
 	help
 	  This package builds the DDRinit firmware used on the BeagleV
 	  platform.
diff --git a/boot/beaglev-secondboot/Config.in b/boot/beaglev-secondboot/Config.in
index a9695fc138..0616efb0c5 100644
--- a/boot/beaglev-secondboot/Config.in
+++ b/boot/beaglev-secondboot/Config.in
@@ -1,7 +1,7 @@
 config BR2_TARGET_BEAGLEV_SECONDBOOT
 	bool "beaglev-secondboot"
 	depends on BR2_riscv
-	depends on BR2_HOSTARCH = "x86_64" # host-riscv64-elf-toolchain
+	depends on "$(HOSTARCH)" = "x86_64" # host-riscv64-elf-toolchain
 	help
 	  This package builds the SecondBoot firmware used on the
 	  BeagleV platform.
diff --git a/boot/s500-bootloader/Config.in b/boot/s500-bootloader/Config.in
index 7bb689f305..a7d85214d4 100644
--- a/boot/s500-bootloader/Config.in
+++ b/boot/s500-bootloader/Config.in
@@ -1,7 +1,7 @@
 config BR2_TARGET_S500_BOOTLOADER
 	bool "s500-bootloader"
 	depends on BR2_arm
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  1st level bootloader for Actions Semiconductor S500 SoC.
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 3cbf42d344..301f1e642c 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -149,6 +149,6 @@ config BR2_LINUX_KERNEL_EXT_AUFS_VERSION
 endif # aufs
 
 # kernel extensions from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.linux"
+source "$(BASE_DIR)/.br2-external.in.linux"
 
 endmenu
diff --git a/package/amlogic-boot-fip/Config.in.host b/package/amlogic-boot-fip/Config.in.host
index bccc6296d1..54f4075f27 100644
--- a/package/amlogic-boot-fip/Config.in.host
+++ b/package/amlogic-boot-fip/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP
 	bool "host amlogic-boot-fip"
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	help
 	  Firmware Image Package (FIP) sources used to sign Amlogic
 	  u-boot binaries in LibreELEC images
diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 724f91123b..f3830cefad 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "x86"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "x86_64"
+	default y if "$(HOSTARCH)" = "x86"
 
 config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	bool
diff --git a/package/flutter-sdk-bin/Config.in.host b/package/flutter-sdk-bin/Config.in.host
index 181a2ee6e5..c1c97e2ca8 100644
--- a/package/flutter-sdk-bin/Config.in.host
+++ b/package/flutter-sdk-bin/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "x86_64"
+	default y if "$(HOSTARCH)" = "x86_64"
 
 config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
 	bool "host flutter-sdk-bin"
diff --git a/package/go-bootstrap-stage1/Config.in.host b/package/go-bootstrap-stage1/Config.in.host
index 56a743caf9..50caad0a8b 100644
--- a/package/go-bootstrap-stage1/Config.in.host
+++ b/package/go-bootstrap-stage1/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE1_ARCH_SUPPORTS
 	bool
 	# See src/cmd/dist/unix.c for the list of supported architectures
-	default y if BR2_HOSTARCH = "x86"
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "arm"
+	default y if "$(HOSTARCH)" = "x86"
+	default y if "$(HOSTARCH)" = "x86_64"
+	default y if "$(HOSTARCH)" = "arm"
diff --git a/package/google-breakpad/Config.in.host b/package/google-breakpad/Config.in.host
index 28d304766a..84e95957b2 100644
--- a/package/google-breakpad/Config.in.host
+++ b/package/google-breakpad/Config.in.host
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "x86"
-	default y if BR2_HOSTARCH = "arm"
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "mips"
-	default y if BR2_HOSTARCH = "mipsel"
+	default y if "$(HOSTARCH)" = "x86_64"
+	default y if "$(HOSTARCH)" = "x86"
+	default y if "$(HOSTARCH)" = "arm"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "mips"
+	default y if "$(HOSTARCH)" = "mipsel"
diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 371f89aa49..0a7e01d28b 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -40,7 +40,7 @@ config BR2_PACKAGE_JPEG_TURBO
 	  http://www.libjpeg-turbo.org
 
 # libjpeg from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.jpeg"
+source "$(BASE_DIR)/.br2-external.in.jpeg"
 
 endchoice
 
diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 02ea8dd58c..c99bad8fd5 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
 	# gcc 4.5 at least. on i386, we use the target gcc, while on
 	# x86-64 we use the host gcc (see .mk file for details)
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || !BR2_i386
-	depends on BR2_HOSTARCH = "x86_64" || !BR2_x86_64
+	depends on "$(HOSTARCH)" = "x86_64" || !BR2_x86_64
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64
 	help
 	  kvm-unit-tests is a project as old as KVM. As its name
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 31e9e0243e..408032c7e8 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -7,9 +7,9 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	default y if BR2_powerpc
 	# -m32 flag is used for 32bit builds and host-luajit has
 	# limited architecture support
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	# Building for 64-bit target requires a 64-bit host
-	depends on !BR2_ARCH_IS_64 || BR2_HOSTARCH = "x86_64"
+	depends on !BR2_ARCH_IS_64 || "$(HOSTARCH)" = "x86_64"
 
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
diff --git a/package/mono/Config.in b/package/mono/Config.in
index 0152df8268..354dc56d24 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "x86"
+	default y if "$(HOSTARCH)" = "x86_64"
+	default y if "$(HOSTARCH)" = "x86"
 
 config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	bool
diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index a8ab89176c..a8b0f3997d 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "arm"
-	default y if BR2_HOSTARCH = "ppc64le"
-	default y if BR2_HOSTARCH = "x86_64"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "arm"
+	default y if "$(HOSTARCH)" = "ppc64le"
+	default y if "$(HOSTARCH)" = "x86_64"
 
 comment "host nodejs needs a host gcc >= 8"
 	depends on !BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 25d6960ecf..66963ed885 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "x86_64"
-	default y if BR2_HOSTARCH = "aarch64"
+	default y if "$(HOSTARCH)" = "x86_64"
+	default y if "$(HOSTARCH)" = "aarch64"
 
 # Taken from make/autoconf/platform.m4
 config BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index c7641ecefa..3d14988d99 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -47,7 +47,7 @@ config BR2_PACKAGE_LIBRESSL
 source "package/libressl/Config.in"
 
 # openssl from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.openssl"
+source "$(BASE_DIR)/.br2-external.in.openssl"
 
 endchoice
 
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 47e987fa2b..df87918273 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -16,17 +16,17 @@
 # host-protobuf only builds on certain architectures
 config BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "arm"
-	default y if BR2_HOSTARCH = "mips"
-	default y if BR2_HOSTARCH = "mipsel"
-	default y if BR2_HOSTARCH = "powerpc"
-	default y if BR2_HOSTARCH = "powerpc64"
-	default y if BR2_HOSTARCH = "powerpc64le"
-	default y if BR2_HOSTARCH = "sparc"
-	default y if BR2_HOSTARCH = "sparc64"
-	default y if BR2_HOSTARCH = "x86"
-	default y if BR2_HOSTARCH = "x86_64"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "arm"
+	default y if "$(HOSTARCH)" = "mips"
+	default y if "$(HOSTARCH)" = "mipsel"
+	default y if "$(HOSTARCH)" = "powerpc"
+	default y if "$(HOSTARCH)" = "powerpc64"
+	default y if "$(HOSTARCH)" = "powerpc64le"
+	default y if "$(HOSTARCH)" = "sparc"
+	default y if "$(HOSTARCH)" = "sparc64"
+	default y if "$(HOSTARCH)" = "x86"
+	default y if "$(HOSTARCH)" = "x86_64"
 
 config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	bool
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 67c843e5f6..b1b7d73d05 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 		BR2_mips || BR2_mips64
 	# -m32 flag is used for 32bit builds and host tools have
 	# limited architecture support
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
 	depends on !BR2_BINFMT_FLAT # qt5base-icu
 	depends on BR2_USE_MMU # libglib2, qt5base-dbus
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index baa68994e6..77f5bf0645 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -1,14 +1,14 @@
 # All host rust packages should depend on this option
 config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	bool
-	default y if BR2_HOSTARCH = "aarch64"
-	default y if BR2_HOSTARCH = "powerpc"
-	default y if BR2_HOSTARCH = "powerpc64"
-	default y if BR2_HOSTARCH = "powerpc64le"
-	default y if BR2_HOSTARCH = "riscv64"
-	default y if BR2_HOSTARCH = "s390x"
-	default y if BR2_HOSTARCH = "x86"
-	default y if BR2_HOSTARCH = "x86_64"
+	default y if "$(HOSTARCH)" = "aarch64"
+	default y if "$(HOSTARCH)" = "powerpc"
+	default y if "$(HOSTARCH)" = "powerpc64"
+	default y if "$(HOSTARCH)" = "powerpc64le"
+	default y if "$(HOSTARCH)" = "riscv64"
+	default y if "$(HOSTARCH)" = "s390x"
+	default y if "$(HOSTARCH)" = "x86"
+	default y if "$(HOSTARCH)" = "x86_64"
 
 # The pre-built Rust standard library is only available for a number
 # of architectures/C libraries combinations, with different levels of
diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
index cd11e8633e..9b2e2afb75 100644
--- a/package/sam-ba/Config.in.host
+++ b/package/sam-ba/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_SAM_BA
 	bool "host sam-ba"
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	help
 	  Atmel SAM-BA software provides an open set of tools for
 	  programming the Atmel SAM3, SAM7 and SAM9 ARM-based
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index 319415754a..d442846fdd 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SUPERTUXKART
 	bool "supertuxkart"
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # openal
@@ -34,7 +34,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	  http://supertuxkart.sourceforge.net/Main_Page
 
 comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++, gcc >= 4.9"
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
diff --git a/package/ti-cgt-pru/Config.in.host b/package/ti-cgt-pru/Config.in.host
index eab3cd72d5..cf56854dd1 100644
--- a/package/ti-cgt-pru/Config.in.host
+++ b/package/ti-cgt-pru/Config.in.host
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on BR2_arm
 
 config BR2_PACKAGE_HOST_TI_CGT_PRU
diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index 40f46335a3..093417fa21 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_TI_GFX
 	bool "ti-gfx"
 	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
diff --git a/package/wine/Config.in b/package/wine/Config.in
index db3b1570ef..cb764f0c9b 100644
--- a/package/wine/Config.in
+++ b/package/wine/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_WINE_ARCH_SUPPORTS
 	bool
 	default y
 	# Wine only builds on certain architectures
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" || \
-	           BR2_HOSTARCH = "powerpc" || BR2_HOSTARCH = "arm" || \
-	           BR2_HOSTARCH = "aarch64"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86" || \
+	           "$(HOSTARCH)" = "powerpc" || "$(HOSTARCH)" = "arm" || \
+	           "$(HOSTARCH)" = "aarch64"
 	# Wine has much CPU specific code and mostly makes sense on x86
 	depends on BR2_i386
 
diff --git a/system/Config.in b/system/Config.in
index 3fb17ed1c6..b8db1e755f 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -20,7 +20,7 @@ config BR2_ROOTFS_SKELETON_CUSTOM
 	  Use custom target skeleton.
 
 # skeleton from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.skeleton"
+source "$(BASE_DIR)/.br2-external.in.skeleton"
 
 endchoice
 
@@ -154,7 +154,7 @@ config BR2_INIT_NONE
 	  or with a rootfs-overlay.
 
 # Init systems from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.init"
+source "$(BASE_DIR)/.br2-external.in.init"
 
 endchoice
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e91aa16326..9067193282 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -38,7 +38,7 @@ source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in"
 source "toolchain/toolchain-external/toolchain-external-custom/Config.in"
 
 # Toolchains from br2-external trees, if any
-source "$BR2_BASE_DIR/.br2-external.in.toolchains"
+source "$(BASE_DIR)/.br2-external.in.toolchains"
 
 endchoice
 
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index 1cee601a89..07d1e4b232 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
 	bool "Arm AArch64 BE 13.2.rel1"
 	depends on BR2_aarch64_be
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 2565707def..65159c38bb 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	bool "Arm AArch64 13.2.rel1"
 	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index bee8d61164..bbc8168160 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -7,7 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "aarch64"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in
index 6552da9a84..1fa4fccb0f 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN
 	bool "Bootlin toolchains"
 	depends on BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	help
 	  Bootlin toolchains are built using Buildroot for a large
 	  number of architectures and C libraries configurations.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
index 8e067c8ffb..1938e8f5fc 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
@@ -5,7 +5,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	# Unsupported MIPS cores
 	depends on !BR2_mips_interaptiv
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on !BR2_MIPS_NABI32
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
index 295a8987f1..ae727ffc4c 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
 	bool "Linaro AArch64 BE 2018.05"
 	depends on BR2_aarch64_be
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
index 1b0ec7cd9f..bee49235d4 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 2018.05"
 	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
index 8b3b4c844e..4390482ab9 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
@@ -6,7 +6,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	bool "Linaro ARM 2018.05"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
index b143ee5e24..3448864e4c 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -6,7 +6,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	bool "Linaro armeb 2018.05"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on "$(HOSTARCH)" = "x86_64" || "$(HOSTARCH)" = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index 292e652fb0..44ff9593b3 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	bool "Synopsys ARC 2019.09 toolchain"
 	depends on BR2_arc
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on "$(HOSTARCH)" = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
