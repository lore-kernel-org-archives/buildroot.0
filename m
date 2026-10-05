Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B43CA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 22:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A47760760;
	Mon,  5 Oct 2026 22:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22yK4GFKeIMP; Mon,  5 Oct 2026 22:37:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3D546605D2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791239834;
	b=gOLOkDNlgAkDrowq62DHa7WV3diquUim0gEu6+xodMpfYFv+UxkSjz9yAdyKPKNB4YgW
	 IpnQGEVUaHnI3WIb8HScKD4n3qkq7ytyKDqDFRPiJ5PkSE48UvMRbp16h4XncrYsiRucp
	 4w5qKZ9mlH9PuNXMI1gXqyOx+0Oqvp5v4yRVH68pADIkw5Y/c/qnUAXMxQjdGx3hlLVhh
	 m33KwIWJQYHuXzTQDIlVrhTyWE2at3QeU7kuQ2jzMOtY39U8wmbxwKX9rKrhUWax/GCQv
	 bsZvQCGEbygCzekdemz2Epc1p6IpYoZyMwp+4agjf0Sa/UtC+LhN8nvBRodn0Zb+oXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791239834;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:From:
	 To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qthcupvDxWZwZrBzm2NXWbi876mdIWMsA9qFi9+IH2g=;
	b=Z2thB235KCitdP87H4nnn+8XuE+Ld/vvv+tMjsYQmj40qIVdg+E5BZMOim1bEJgptMTy
	 dV01A4VI0mGI+rg9UJ7uXR3PfZaUEh+nLhIMzEUP5AEt+5dNFqGb0fArtDBqaUADkNxQ4
	 1oj2dnHLW07bCGsHzMGBvQortQyTaMG0+9PPAQmc5vohDzlBIGV0RuuXTJd0ogqCf/wz7
	 IPS/+C8pcZ5ESVlL6q5BnvxC/xxQ9TfnbPO+5MjOnGm+7s0yXoLuKH9bD/QbLLq0GQcQJ
	 xmkoWbUw4jhi3gY6lbMX9NVrBUjrGG6x3AR5gTul2k47pKDZvZnb8dVbsWf4aU/YVLw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791239834;
	bh=qthcupvDxWZwZrBzm2NXWbi876mdIWMsA9qFi9+IH2g=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oAZRusKNUsZ1KNl6znKRoQJ/tgox5Xpclrzx/QblTwFitJJnJ6p3kZR763XhVOzU1
	 Em6dicuBhxhlIp5Zztl46rtX4uJAiNk/0+CoAAAy0BXZd9t6pMNRMamjQj/BqGUPfb
	 UlRgn8hhfSCsJ63xBBi4URN+OubmpR84awClBUJgUGxJ7A4SGwXluzkW6lgtH1VeSu
	 qzkZTi6y6SA5bo8VKS3iGC15F0k05YZx1MYhaTjGNX8oX5z+s4pSZoylRjSjfrbd2s
	 Z+I5gn4O7KhNI3/yBGUuGFFKJO6NLnBNlZvs8ApzKuUA/Fywbsah/c58HWvNLaAZzQ
	 3M0WRFY568CEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D546605D2;
	Mon,  5 Oct 2026 22:37:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CD2834E
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E7A5400AA
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMvXZyDFZZUZ for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 22:34:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 672D140042
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=207.191.199.123
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791239680;
 b=hiJ9uKGoRRRA3VVTaeGm5S404yyADo75SNJilFSfgzwiS0vOEQA3n/wu9QgOHlo6Kq8p
 bkHA5G+BAIUnb74DP09zoTscZXPhSpKojzfDnFcss8BL0TpzLToBE4Wre68tjHpOnLYr8
 XwaoSMdaAFpcj4jvkMGzSp1sbsVBXuQ/IaZlifv5kc42toHYnMFm39IeQW4YhhvxFJJt7
 7/t9yba6dDXjP25FZ7oWBHU1JGprcdGa/8YP97M4KJfWfTB1mr7md/YefS+mK7mcpkWeS
 o0Cbog2d+yWZlq+MK1mGOiDliqKQup0wd8xy5S3k1HOQnI0vSscSXOjNEG3aL1b78pA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791239680;
 h=Received-SPF:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=jm32skbJXvOCdfPQY4qy84O/bi7EVtu/T+ACJE4DX1g=;
 b=aS1PP0uGB93pvNV6bQDvJbWptYEbsNJTmr6s1Ce8SzhC/OsPWUwLs0soO9HeIW4i71BO
 TUMH1e7YbyhQDc9dIfOXSZ0L57ajaAr3+DpKWjUERlUx5rtDC1N42xZvMwaw/ahlJw2K4
 F92MHlQMdNU4skqPVK9nnjtqnqeb+tvuSriXOvkAMvmRkZqEeor8LGQWRTLPFZZdkp79j
 IYZuJvFY6AqsPivuOQdP6uYMUjx5vfQRParzUSBCIGhkTOevBupBVrMikIou3wmojhnIu
 4DUdXuOybuDCGR8zJLsyWl9x1D4OrmfWwW3iBx64ecXXh1FdVvMxFoe3PDF4RNxFTNA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=none header.from=realitydiluted.com; 
 arc=none smtp.remote-ip=207.191.199.123
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=207.191.199.123;
 helo=home.bethel-hill.org; envelope-from=sjhill@realitydiluted.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none)
 header.from=realitydiluted.com
Received: from home.bethel-hill.org
 (207-191-199-123.dhcp.imoncommunications.net [207.191.199.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 672D140042
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:34:40 +0000 (UTC)
Received: from localhost.centaur.lan ([127.0.0.1]:46348
 helo=home.bethel-hill.org)
 by home.bethel-hill.org with esmtp (Exim 4.98.2)
 (envelope-from <sjhill@realitydiluted.com>)
 id 1xDrGS-00000001Vch-31qA; Mon, 05 Oct 2026 22:34:32 +0000
From: "Steven J. Hill" <sjhill@realitydiluted.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Neal Frager <neal.frager@amd.com>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Steven J. Hill" <sjhill@realitydiluted.com>,
 "Steven J. Hill" <steven.hill@collins.com>
Date: Mon,  5 Oct 2026 22:33:10 +0000
Message-ID: <20261005223427.359874-2-sjhill@realitydiluted.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005223427.359874-1-sjhill@realitydiluted.com>
References: <20261005223427.359874-1-sjhill@realitydiluted.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] bare-metal-toolchain: add support for
 config options directory
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

This patch adds the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIG_DIR
option. The directory holds individual config files with options
for all build stages of the toolchain on a per-target basis. For
further information on using this, see the documentation file at
toolchain/toolchain-bare-metal-buildroot/configs/README.md

Signed-off-by: Steven J. Hill <steven.hill@collins.com>
Signed-off-by: Steven J. Hill <sjhill@realitydiluted.com>
---
 .../binutils-bare-metal.mk                    |  5 ++
 package/gcc-bare-metal/gcc-bare-metal.mk      |  5 ++
 .../newlib-bare-metal/newlib-bare-metal.mk    |  5 ++
 .../toolchain-bare-metal-buildroot/Config.in  | 16 +++++++
 .../configs/README.md                         | 47 +++++++++++++++++++
 .../configs/riscv64-unknown-elf.config        | 35 ++++++++++++++
 6 files changed, 113 insertions(+)
 create mode 100755 toolchain/toolchain-bare-metal-buildroot/configs/README.md
 create mode 100644 toolchain/toolchain-bare-metal-buildroot/configs/riscv64-unknown-elf.config

diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 343bf44c4d..e3746e0146 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -49,6 +49,7 @@ define HOST_BINUTILS_BARE_METAL_CONFIGURE_CMDS
 		CONFIG_SITE=/dev/null \
 		$(@D)/configure \
 			$(HOST_BINUTILS_BARE_METAL_CONF_OPTS) \
+			$(BINUTILS_BARE_METAL_EXTRA_CONF_OPTS_$(arch_tuple)) \
 			--target=$(arch_tuple)
 	)
 endef
@@ -70,3 +71,7 @@ define HOST_BINUTILS_BARE_METAL_INSTALL_CMDS
 endef
 
 $(eval $(host-autotools-package))
+
+ifneq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIG_DIR),)
+include $(wildcard $(subst ",,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIGS))/*)
+endif
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 4ec154bb53..ab38436d0d 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -70,6 +70,7 @@ define HOST_GCC_BARE_METAL_CONFIGURE_CMDS
 		CONFIG_SITE=/dev/null \
 		$(@D)/configure \
 			$(HOST_GCC_BARE_METAL_CONF_OPTS) \
+			$(GCC_INITIAL_BARE_METAL_EXTRA_CONF_OPTS_$(arch_tuple))\
 			--target=$(arch_tuple) \
 			--with-sysroot=$(HOST_DIR)/$(arch_tuple)/sysroot \
 			AR_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ar \
@@ -93,4 +94,8 @@ define HOST_GCC_BARE_METAL_INSTALL_CMDS
 	)
 endef
 
+ifneq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIG_DIR),)
+include $(wildcard $(subst ",,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIGS))/*)
+endif
+
 $(eval $(host-autotools-package))
diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index 5881993d3a..9fd3ef4637 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -52,6 +52,7 @@ define NEWLIB_BARE_METAL_CONFIGURE_CMDS
 		CONFIG_SITE=/dev/null \
 		$(@D)/configure \
 			$(NEWLIB_BARE_METAL_CONF_OPTS) \
+			$(NEWLIB_BARE_METAL_CONF_OPTS_$(arch_tuple)) \
 			--target=$(arch_tuple)
 	)
 endef
@@ -74,3 +75,7 @@ define NEWLIB_BARE_METAL_INSTALL_STAGING_CMDS
 endef
 
 $(eval $(generic-package))
+
+ifneq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIG_DIR),)
+include $(wildcard $(subst ",,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIGS))/*)
+endif
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index 65b49d36aa..b909238587 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -37,6 +37,22 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_NANO
 	  When enabled, this option will apply to all architecture
 	  tuples in the list.
 
+config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIGS
+	string "Additional config options"
+	help
+	  Search the specified directory for tuple config files with
+	  additional options for the toolchain build stages. For
+	  example, if the user specified two bare metal toolchains to be
+	  built:
+
+	  > BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf \
+	  >     riscv64-unknown-elf"
+
+	  The CONFIG_DIR directory would have invidual config files:
+
+	  > microblazeel-buildroot-elf.config
+	  > riscv64-unknown-elf.config
+
 source "package/newlib-bare-metal/Config.in"
 
 endif # BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
diff --git a/toolchain/toolchain-bare-metal-buildroot/configs/README.md b/toolchain/toolchain-bare-metal-buildroot/configs/README.md
new file mode 100755
index 0000000000..af8cb99f09
--- /dev/null
+++ b/toolchain/toolchain-bare-metal-buildroot/configs/README.md
@@ -0,0 +1,47 @@
+# Bare Metal Toolchain
+The original bare metal toolchain was for compiling only standard C code. Bare metal toolchains are for building code targeting micro-controllers. As such, multi threading, large block memory allocation and MMU are not supported. A bare metal toolchain only requires three software packages:
+
+1. binutils
+2. gcc
+3. newlib-baremetal
+
+Because the bare metal toolchain packages can use multiple bare metal toolchains. The configure, build and install targets in each makefile loop through each of the specified toolchain tuples as shown. Package `binutils` is built for every architecture, then `gcc` for the architectures and finally `newlib` for each.
+
+## Target-specific Options
+While adding C++ support to the bare metal toolchain, it was clear that additional configuration options would be necessary as each processor architecture's toolchain was built. The configuration and build options will undoubtedly be different for each bare metal toolchain combination or tuple. We need a simple and intuitive way to handle this. The new configuration `BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIG_DIR` option was added. When specified, the bare metal packages will include any and all files found at the path for all five stages of the toolchain build for any toolchain target specified. Currently, the config files only support `configure` options for each of the five build stages. A single line was added to each of the `configure` command loops:
+```
+        $(GCC_INITIAL_BARE_METAL_EXTRA_CONF_OPTS_$(arch_tuple)) \
+```
+As each target toolchain is built, it will only use the options specifically for that architecture. Using fictional configuration options:
+```
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf riscv64-unknown-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIG_DIR="board/madness/bare-metal"
+```
+Inside the directory `board/madness/bare-metal` we could have two files:
+```
+riscv64-unknown-elf.config
+microblazeel-xilinx-elf.config
+```
+For the riscv64 example, the config file could look like:
+```
+BINUTILS_BARE_METAL_EXTRA_CONF_OPTS_riscv64-unknown-elf = \
+        --with-abi=lp64d \
+        --with-arch=rv64gc \
+        --with-isa-spec=20191213
+
+GCC_INITIAL_BARE_METAL_EXTRA_CONF_OPTS_riscv64-unknown-elf = \
+        --with-abi=lp64d \
+        --with-arch=rv64gc \
+        --with-isa-spec=20191213 \
+        --with-system-zlib \
+        CFLAGS_FOR_TARGET="-Os -mcmodel=medlow" \
+        CXXFLAGS_FOR_TARGET="-Os -mcmodel=medlow"
+```
+There is nothing to prevent a user from putting everything in one file. It would be a terrible idea, but it would still work. So, at each stage of the bare metal toolchain the options would be included in with base configuration options of binutils and gcc initial stage steps. A complete sample config file can be found in the same directory as this file.
+
+## Toolchain Upgrade for C++ Support
+The bare metal toolchain now supports C++. Since a second stage compiler is needed for C++ (and other languages), the build steps are identical to those used for the traditional buildroot toolchain. The `gcc-bare-metal` package was completely rewritten to match the organization and steps of the `gcc` package. In order to support C++, the `newlib-bare-metal-nano` package was added to provide a micro C-runtime of sorts that would make gcc happy when building C++ support. The `binutils-bare-metal` and `newlib-bare-metal` were largely unchanged.
+
+## Future Work
+1. Support other languages like D and FORTRAN. This is fairly trivial to add, but it is highly likely a number of config and build options will need to be tuned.
+2. The architecture config files could support extra options for the `build` and `install` stages.
diff --git a/toolchain/toolchain-bare-metal-buildroot/configs/riscv64-unknown-elf.config b/toolchain/toolchain-bare-metal-buildroot/configs/riscv64-unknown-elf.config
new file mode 100644
index 0000000000..0daabd76a3
--- /dev/null
+++ b/toolchain/toolchain-bare-metal-buildroot/configs/riscv64-unknown-elf.config
@@ -0,0 +1,35 @@
+# Copyright 2026 Rockwell Collins
+
+BINUTILS_BARE_METAL_EXTRA_CONF_OPTS_riscv64-unknown-elf = \
+	--with-abi=lp64d \
+	--with-arch=rv64gc \
+	--with-isa-spec=20191213
+
+GCC_INITIAL_BARE_METAL_EXTRA_CONF_OPTS_riscv64-unknown-elf = \
+	--with-abi=lp64d \
+	--with-arch=rv64gc \
+	--with-isa-spec=20191213 \
+	--with-system-zlib \
+	CFLAGS_FOR_TARGET="-Os -mcmodel=medlow" \
+	CXXFLAGS_FOR_TARGET="-Os -mcmodel=medlow"
+
+GCC_FINAL_BARE_METAL_EXTRA_CONF_OPTS_riscv64-unknown-elf = \
+	--with-abi=lp64d \
+	--with-arch=rv64gc \
+	--with-isa-spec=20191213 \
+	--with-system-zlib \
+	--without-zstd \
+	--with-specs='%{!mcmodel*:-mcmodel=medlow}' \
+	CFLAGS_FOR_TARGET="-Os -mcmodel=medlow" \
+	CXXFLAGS_FOR_TARGET="-Os -mcmodel=medlow"
+
+NEWLIB_BARE_METAL_CONF_OPTS_riscv64-unknown-elf = \
+	--enable-newlib-register-fini \
+	--disable-nls \
+	CFLAGS_FOR_TARGET="-Os -D_POSIX_MODE -ffunction-sections -fdata-sections    -mcmodel=medlow" \
+	CXXFLAGS_FOR_TARGET="-Os -D_POSIX_MODE -ffunction-sections -fdata-sections    -mcmodel=medlow"
+
+NEWLIB_BARE_METAL_NANO_CONF_OPTS_riscv64-unknown-elf = \
+	--disable-nls \
+	CFLAGS_FOR_TARGET="-Os -D_POSIX_MODE -ffunction-sections -fdata-sections    -mcmodel=medlow" \
+	CXXFLAGS_FOR_TARGET="-Os -D_POSIX_MODE -ffunction-sections -fdata-sections    -mcmodel=medlow"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
