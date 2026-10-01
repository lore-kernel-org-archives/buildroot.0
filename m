Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EF2CA5FCE
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 23:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D9B80D66;
	Thu,  1 Oct 2026 23:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46-U0mBiZDgD; Thu,  1 Oct 2026 23:18:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D15B580BE8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790896680;
	b=cbZH7oxxokFCNjyv5MQAagAX/DCcwAv6OuEUb05Wq6cGWjdTKmFtrnoUjVo6JNTgwi6W
	 bHOJ8C8P1ON50PYUAriJalosDFIQzIVffC5fkwvVGdNllzq8YEoO4Di5hj2lYIbHbpl5x
	 HfsgrRD1DhbrEE4eEpOiDfNdbREl/U0+bpd382xXzQKxCsrp3KqQaJCuzC+pwuJgGlCyw
	 rT2+CJNMqeww5Lz/h8ztdd2J4BFjYfLKTD1sWVdICxadE0JiW8gQHdYQy1Kgji500xGev
	 +xpDQS2YP6jJ7m8aazPDCo0rOntQB2ar9YSB66lh+lP34XA6neb6rcttKV3/phIqwGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790896680;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:From:
	 To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uz1TZzeFYIsl+NSNQG53q1zrPz0o6/OXeIZqf5kfTyM=;
	b=EKMUTc0f0niwUMr+Dp+06qZeq24om7so0eOy8mCWnlupLN9kzv+9CAFTu4uKLbTjskeN
	 hn800WCD+JjKCvT0fVs4ab7yO61oSuO+9CLY3id1aG7LH+QCmHRO6YWkZD14P9ANw0f3B
	 qIR43JcLzQJAUKj0JdsGh1sTNkeRXYuTeJSg2faPqk+3dFUt3U8aHoC7nbFSXiCRZwQYM
	 9GpmHGjKmPEcNfbiolaNe8VD4dISeD8NvePcQDuMVL9zS2V0wWcSAbQkD/7kGIh1L4KY2
	 dltSTM/76zQrA/SETbXn10sHk4+WRsRxYSrbZ41RXcJNf8js6P9EYNzuZDQVZ/TopQg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790896679;
	bh=uz1TZzeFYIsl+NSNQG53q1zrPz0o6/OXeIZqf5kfTyM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DuVJqykeJcJ2WUmVsuPqLtjqQddV06e4+yc5ElJQIJmtbm9CRP/cO8fzPib1xkNeQ
	 TXwiftSVAGJhQyu+eTf32Xym7lxzmAzXCt8XakLOyM1TdZfqzHIGnhYJibRmReVa1t
	 yyVVuNfQigvPX6E4hFqYCMkrtT4N7zNyt8Nz54Ji8UYsiQrsFS/OJhdLuvy/8IBnoL
	 Z/ErptMrb7QAjGfmWKQV96f/b321eglOLWIWUlie/7HQijORJSEhhsrW7HefRRnG9x
	 2sI+vW/XNHGq7x2UiRbgfLuoz3GckCzJU3Q1ep8URoBWRc/1tV0AhV1qrngse6qbsc
	 6/7zziLx33eoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D15B580BE8;
	Thu,  1 Oct 2026 23:17:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1F2332F
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 23:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7F654084B
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 23:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oL-aerKPiaBs for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 23:17:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B19094080B
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=207.191.199.123
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790896675;
 b=WJDSwdUl4buoJIg/HVhA3ML4GVHWyZZMy2LHgyr6uCl2hHyLunEsBgfzHDoz6Sn62PvU
 hamzd8EDBJM3wyLZa/dJ+6U/5DlIYbKp8bf4UamxKufVtSG9QDYusSDgZuY0CKhgvMlrA
 M8olACd/aR7O4rdiclyc4YUIlIBW1Rn1XuoVjue5yBW6T4fZNEzMjp28xfxcD6hlnK6iM
 8ohuUPnUBGvCyiUejBjnWKJtAeVuyKK2Z/p2jT7V3of+fKOmUMFyD6CSoCDxRsNpCwy+Z
 iP8yb+ittg+C/CcbT1GOE/EjCJKqYLOtSqBfVpngHOpeH2VHAQNLLnn/nJ395Y/gOpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790896675;
 h=Received-SPF:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=Vvh4coo7/bdano69v7bAnHgMJNHajTGl3wUQTTWS/iE=;
 b=bH9DqL/saTrSrDrTgRW1YA0N4WcpJhok4Q6v4WhOV5710iZheTu+gEC5ADO5FRpAojlX
 8s68UeRzQIKVkwOyWmoA4TpDEjrRRQRZqHvh/o2VssjfEACQhzS6eE/f9OnEsedf1jCGK
 Cmg3tJ14+07rBqa7vBFYiiKtoZ3/suGV0J3Yr1CFhQIDFLrOpsTRGnKmQnh7jTYY2f3h8
 f+waLDMikXfEDdRLSV+UahnLgZ5riMLzjB3NuS1lLCthgeDKfDcUl1RWZpWCVxBChS2wF
 TvKMUdgUAmzW7delCiY6xGTQKE0s8p4fOkv2UPl7RIT6+ucYuquXTQEjJ/usDynS/Iw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=realitydiluted.com; 
 arc=none smtp.remote-ip=207.191.199.123
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=207.191.199.123;
 helo=home.bethel-hill.org; envelope-from=sjhill@realitydiluted.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none)
 header.from=realitydiluted.com
Received: from home.bethel-hill.org
 (207-191-199-123.dhcp.imoncommunications.net [207.191.199.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B19094080B
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 23:17:54 +0000 (UTC)
Received: from localhost.centaur.lan ([127.0.0.1]:34650
 helo=home.bethel-hill.org)
 by home.bethel-hill.org with esmtp (Exim 4.98.2)
 (envelope-from <sjhill@realitydiluted.com>)
 id 1xCQ26-00000001D2b-2sZ2; Thu, 01 Oct 2026 23:17:46 +0000
From: "Steven J. Hill" <sjhill@realitydiluted.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Neal Frager <neal.frager@amd.com>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Steven J. Hill" <steven.hill@collins.com>,
 "Steven J. Hill" <sjhill@realitydiluted.com>
Date: Thu,  1 Oct 2026 23:17:44 +0000
Message-ID: <20261001231744.288451-1-sjhill@realitydiluted.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1 v2]
 toolchain/toolchain-bare-metal-buildroot: Add C++ support
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

From: "Steven J. Hill" <steven.hill@collins.com>

Add C++ support for bare metal toolchains.

Signed-off-by: Steven J. Hill <steven.hill@collins.com>
Signed-off-by: Steven J. Hill <sjhill@realitydiluted.com>
---
V1->V2
- Removed headers and footers throughout.
- Fix missing gcc version in hash files.
---
 .../binutils-bare-metal.mk                    |   6 ++
 package/gcc-bare-metal/Config.in              |   5 +
 .../gcc-bare-metal-final.hash                 |  20 ++++
 .../gcc-bare-metal-final.mk                   |  98 +++++++++++++++++
 .../gcc-bare-metal-initial.hash               |  20 ++++
 .../gcc-bare-metal-initial.mk                 |  72 +++++++++++++
 package/gcc-bare-metal/gcc-bare-metal.hash    |  10 ++
 package/gcc-bare-metal/gcc-bare-metal.mk      |  80 +++++---------
 package/newlib-bare-metal-nano/Config.in      |  12 +++
 .../newlib-bare-metal-nano.hash               |   1 +
 .../newlib-bare-metal-nano.mk                 | 100 ++++++++++++++++++
 package/newlib-bare-metal/Config.in           |  12 +++
 .../newlib-bare-metal/newlib-bare-metal.mk    |   9 +-
 .../toolchain-bare-metal-buildroot/Config.in  |  28 +++++
 .../configs/README.md                         |  47 ++++++++
 .../configs/riscv64-unknown-elf.config        |  35 ++++++
 .../toolchain-bare-metal-buildroot.mk         |   5 +
 17 files changed, 506 insertions(+), 54 deletions(-)
 create mode 100644 package/gcc-bare-metal/Config.in
 create mode 100644 package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.hash
 create mode 100644 package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.mk
 create mode 100644 package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.hash
 create mode 100644 package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.mk
 create mode 100644 package/newlib-bare-metal-nano/Config.in
 create mode 120000 package/newlib-bare-metal-nano/newlib-bare-metal-nano.hash
 create mode 100644 package/newlib-bare-metal-nano/newlib-bare-metal-nano.mk
 create mode 100755 toolchain/toolchain-bare-metal-buildroot/configs/README.md
 create mode 100644 toolchain/toolchain-bare-metal-buildroot/configs/riscv64-unknown-elf.config

diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 343bf44c4d..4e3f01f7aa 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -37,6 +37,7 @@ HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
 	--disable-shared \
 	--enable-lto \
 	--disable-initfini-array \
+	--disable-nls \
 	$(HOST_BINUTILS_BARE_METAL_MULTILIB) \
 	--disable-werror
 
@@ -49,6 +50,7 @@ define HOST_BINUTILS_BARE_METAL_CONFIGURE_CMDS
 		CONFIG_SITE=/dev/null \
 		$(@D)/configure \
 			$(HOST_BINUTILS_BARE_METAL_CONF_OPTS) \
+			$(BINUTILS_BARE_METAL_EXTRA_CONF_OPTS_$(arch_tuple)) \
 			--target=$(arch_tuple)
 	)
 endef
@@ -70,3 +72,7 @@ define HOST_BINUTILS_BARE_METAL_INSTALL_CMDS
 endef
 
 $(eval $(host-autotools-package))
+
+ifneq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIG_DIR),"")
+include $(shell grep -v '^\s*#' $(wildcard $(subst ",,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIGS))/*)
+endif
diff --git a/package/gcc-bare-metal/Config.in b/package/gcc-bare-metal/Config.in
new file mode 100644
index 0000000000..298885e26e
--- /dev/null
+++ b/package/gcc-bare-metal/Config.in
@@ -0,0 +1,5 @@
+# Copyright 2026 Rockwell Collins
+
+config BR2_PACKAGE_BARE_METAL_GCC_FINAL
+	bool
+	default y if BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
diff --git a/package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.hash b/package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.hash
new file mode 100644
index 0000000000..e25d9b8dc2
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.hash
@@ -0,0 +1,20 @@
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
+sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.4.0/sha512.sum
+sha512  725ed8bdd43ef1726ffe8b5e8615a13e247fac9575b7626ae013a2975d000ea213212dc414b2f2631ac4785c1c8beca85555222faf9904d3b2fa6a3807a83a15  gcc-14.4.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum
+sha512  89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de  gcc-15.2.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-15.3.0/sha512.sum
+sha512  0de9e296153b52c021b1c7e63c9c62151d7a0ac03f23ce6e9f772c1b0eb783f6acdd81cc4567bfe4128a6f64968c2cfc8eff40b36229cba7425349f7d637c654  gcc-15.3.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-16.2.0/sha512.sum
+sha512  c51c30ca7422d0cbecf504b2e0f33c3aca31e0f90a76b65217f465163fa6fa17b3f5de39e145c47e5bab90ac0ce7fff3b03c8d553ae36e01faaea5a50f8648d1  gcc-16.2.0.tar.xz
+
+# Locally calculated (fetched from Github)
+sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
+
+# Locally calculated
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING3.LIB
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  9d6b43ce4d8de0c878bf16b54d8e7a10d9bd42b75178153e3af6a815bdc90f74  COPYING.RUNTIME
diff --git a/package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.mk b/package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.mk
new file mode 100644
index 0000000000..08c36769c5
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.mk
@@ -0,0 +1,98 @@
+################################################################################
+#
+# gcc-bare-metal-final
+#
+################################################################################
+
+# Copyright 2026 Rockwell Collins
+
+GCC_BARE_METAL_FINAL_VERSION = $(GCC_BARE_METAL_VERSION)
+GCC_BARE_METAL_FINAL_SITE = $(GCC_BARE_METAL_SITE)
+GCC_BARE_METAL_FINAL_SOURCE = $(GCC_BARE_METAL_SOURCE)
+GCC_BARE_METAL_FINAL_LICENSE = $(GCC_BARE_METAL_SOURCE)
+GCC_BARE_METAL_FINAL_LICENSE_FILES = $(GCC_BARE_METAL_LICENSE)
+GCC_BARE_METAL_FINAL_CPE_ID_VENDOR = gnu
+GCC_BARE_METAL_FINAL_CPE_ID_PRODUCT = gcc
+
+GCC_BARE_METAL_FINAL_ADD_TOOLCHAIN_DEPENDENCY = NO
+GCC_BARE_METAL_FINAL_INSTALL_STAGING = YES
+
+GCC_BARE_METAL_FINAL_DL_SUBDIR = $(HOST_GCC_BARE_METAL_DL_SUBDIR)
+HOST_GCC_BARE_METAL_FINAL_DL_SUBDIR = $(GCC_BARE_METAL_FINAL_DL_SUBDIR)
+
+HOST_GCC_BARE_METAL_FINAL_DEPENDENCIES = \
+	$(HOST_GCC_BARE_METAL_DEPENDENCIES) \
+	newlib-bare-metal-nano
+
+HOST_GCC_BARE_METAL_FINAL_EXCLUDES = \
+	$(HOST_GCC_BARE_METAL_EXCLUDES)
+
+HOST_GCC_BARE_METAL_FINAL_MAKE_OPTS = \
+	$(HOST_GCC_BARE_METAL_MAKE_OPTS) \
+	all-gcc \
+	all-target-libgcc
+
+HOST_GCC_BARE_METAL_FINAL_INSTALL_OPTS = \
+	$(HOST_GCC_BARE_METAL_INSTALL_OPTS)
+
+HOST_GCC_BARE_METAL_FINAL_CONF_OPTS = \
+	$(HOST_GCC_BARE_METAL_CONF_OPTS) \
+	$(HOST_GCC_BARE_METAL_FINAL_MULTILIB) \
+	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS)) \
+	--with-build-time-tools=$(HOST_DIR)/$(GNU_TARGET_NAME)/bin \
+	--with-native-system-header-dir=/usr/include \
+	--enable-languages=c,c++ \
+	--enable-lto \
+	--disable-shared \
+	--disable-threads \
+	--enable-languages=c,c++ \
+	--enable-tls \
+	--with-newlib \
+	--disable-libmudflap \
+	--disable-libssp \
+	--disable-libquadmath \
+	--disable-libgomp \
+	--disable-nls \
+	--disable-tm-clone-registry \
+	--disable-multilib
+
+HOST_GCC_BARE_METAL_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib*
+
+define HOST_GCC_BARE_METAL_FINAL_CONFIGURE_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		cd $(@D)/build-$(arch_tuple) && \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		MAKEINFO=missing \
+		CONFIG_SITE=/dev/null \
+		$(@D)/configure \
+			$(HOST_GCC_BARE_METAL_FINAL_CONF_OPTS) \
+			$(GCC_FINAL_BARE_METAL_EXTRA_CONF_OPTS_$(arch_tuple)) \
+			--target=$(arch_tuple) \
+			--with-sysroot=$(HOST_DIR)/$(arch_tuple)/sysroot \
+			AR_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ar \
+			RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ranlib
+	)
+endef
+
+define HOST_GCC_BARE_METAL_FINAL_BUILD_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_GCC_BARE_FINAL_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
+define HOST_GCC_BARE_METAL_FINAL_INSTALL_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			-C $(@D)/build-$(arch_tuple) \
+			$(HOST_GCC_BARE_METAL_FINAL_INSTALL_OPTS) \
+			install
+	)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-autotools-package))
diff --git a/package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.hash b/package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.hash
new file mode 100644
index 0000000000..e25d9b8dc2
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.hash
@@ -0,0 +1,20 @@
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
+sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.4.0/sha512.sum
+sha512  725ed8bdd43ef1726ffe8b5e8615a13e247fac9575b7626ae013a2975d000ea213212dc414b2f2631ac4785c1c8beca85555222faf9904d3b2fa6a3807a83a15  gcc-14.4.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum
+sha512  89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de  gcc-15.2.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-15.3.0/sha512.sum
+sha512  0de9e296153b52c021b1c7e63c9c62151d7a0ac03f23ce6e9f772c1b0eb783f6acdd81cc4567bfe4128a6f64968c2cfc8eff40b36229cba7425349f7d637c654  gcc-15.3.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-16.2.0/sha512.sum
+sha512  c51c30ca7422d0cbecf504b2e0f33c3aca31e0f90a76b65217f465163fa6fa17b3f5de39e145c47e5bab90ac0ce7fff3b03c8d553ae36e01faaea5a50f8648d1  gcc-16.2.0.tar.xz
+
+# Locally calculated (fetched from Github)
+sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
+
+# Locally calculated
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING3.LIB
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  9d6b43ce4d8de0c878bf16b54d8e7a10d9bd42b75178153e3af6a815bdc90f74  COPYING.RUNTIME
diff --git a/package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.mk b/package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.mk
new file mode 100644
index 0000000000..931c2a1d1e
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.mk
@@ -0,0 +1,72 @@
+################################################################################
+#
+# gcc-bare-metal-initial
+#
+################################################################################
+
+# Copyright 2026 Rockwell Collins
+
+GCC_BARE_METAL_INITIAL_VERSION = $(GCC_BARE_METAL_VERSION)
+GCC_BARE_METAL_INITIAL_SITE = $(GCC_BARE_METAL_SITE)
+GCC_BARE_METAL_INITIAL_SOURCE = $(GCC_BARE_METAL_SOURCE)
+GCC_BARE_METAL_INITIAL_LICENSE = $(GCC_BARE_METAL_LICENSE)
+GCC_BARE_METAL_INITIAL_LICENSE_FILES = $(GCC_BARE_METAL_LICENSE_FILES)
+
+HOST_GCC_BARE_METAL_INITIAL_DL_SUBDIR = $(HOST_GCC_BARE_METAL_DL_SUBDIR)
+
+HOST_GCC_BARE_METAL_INITIAL_DEPENDENCIES = \
+	$(HOST_GCC_BARE_METAL_DEPENDENCIES)
+
+HOST_GCC_BARE_METAL_INITIAL_EXCLUDES = \
+	$(HOST_GCC_BARE_METAL_EXCLUDES)
+
+HOST_GCC_BARE_METAL_INITIAL_MAKE_OPTS = \
+	$(HOST_GCC_BARE_METAL_MAKE_OPTS) \
+	all-gcc \
+	all-target-libgcc
+
+HOST_GCC_BARE_METAL_INITIAL_INSTALL_OPTS = \
+	$(HOST_GCC_BARE_METAL_INSTALL_OPTS)
+
+HOST_GCC_BARE_METAL_INITIAL_CONF_OPTS = \
+	$(HOST_GCC_BARE_METAL_CONF_OPTS) \
+	--enable-languages=c \
+	--disable-__cxa_atexit \
+	--disable-largefile \
+	--disable-libstdcxx-pch \
+	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
+
+define HOST_GCC_BARE_METAL_INITIAL_CONFIGURE_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		cd $(@D)/build-$(arch_tuple) && \
+		$(HOST_CONFIGURE_OPTS) \
+		MAKEINFO=missing \
+		CONFIG_SITE=/dev/null \
+		$(@D)/configure \
+			$(HOST_GCC_BARE_METAL_INITIAL_CONF_OPTS) \
+			$(GCC_INITIAL_BARE_METAL_EXTRA_CONF_OPTS_$(arch_tuple))\
+			--target=$(arch_tuple) \
+			--with-sysroot=$(HOST_DIR)/$(arch_tuple)/sysroot \
+			AR_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ar \
+			RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ranlib
+	)
+endef
+
+define HOST_GCC_BARE_METAL_INITIAL_BUILD_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_GCC_BARE_INITIAL_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
+define HOST_GCC_BARE_METAL_INITIAL_INSTALL_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_GCC_BARE_METAL_INTIAL_INSTALL_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
+$(eval $(host-autotools-package))
diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
index 1e1003eec9..49f87e25bb 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.hash
+++ b/package/gcc-bare-metal/gcc-bare-metal.hash
@@ -1,8 +1,18 @@
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
+sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.4.0/sha512.sum
+sha512  725ed8bdd43ef1726ffe8b5e8615a13e247fac9575b7626ae013a2975d000ea213212dc414b2f2631ac4785c1c8beca85555222faf9904d3b2fa6a3807a83a15  gcc-14.4.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-15.3.0/sha512.sum
+sha512  0de9e296153b52c021b1c7e63c9c62151d7a0ac03f23ce6e9f772c1b0eb783f6acdd81cc4567bfe4128a6f64968c2cfc8eff40b36229cba7425349f7d637c654  gcc-15.3.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-16.2.0/sha512.sum
 sha512  c51c30ca7422d0cbecf504b2e0f33c3aca31e0f90a76b65217f465163fa6fa17b3f5de39e145c47e5bab90ac0ce7fff3b03c8d553ae36e01faaea5a50f8648d1  gcc-16.2.0.tar.xz
 
+# Locally calculated (fetched from Github)
+sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
+
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING3.LIB
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  9d6b43ce4d8de0c878bf16b54d8e7a10d9bd42b75178153e3af6a815bdc90f74  COPYING.RUNTIME
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 4ec154bb53..f4b92c1000 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,15 +4,18 @@
 #
 ################################################################################
 
+# Copyright 2026 Rockwell Collins
+
 GCC_BARE_METAL_VERSION = 16.2.0
 GCC_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VERSION)
 GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
-
 GCC_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
 GCC_BARE_METAL_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
 GCC_BARE_METAL_CPE_ID_VENDOR = gnu
 GCC_BARE_METAL_CPE_ID_PRODUCT = gcc
 
+HOST_GCC_BARE_METAL_DL_SUBDIR = gcc
+
 HOST_GCC_BARE_METAL_DEPENDENCIES = \
 	host-binutils-bare-metal \
 	host-gmp \
@@ -20,16 +23,15 @@ HOST_GCC_BARE_METAL_DEPENDENCIES = \
 	host-mpfr \
 	host-isl
 
-# Don't build documentation. It takes up extra space / build time,
-# and sometimes needs specific makeinfo versions to work
-HOST_GCC_BARE_METAL_CONF_ENV = MAKEINFO=missing
+HOST_GCC_BARE_METAL_EXCLUDES = \
+	libjava/* libgo/*
 
 HOST_GCC_BARE_METAL_MAKE_OPTS = \
-	$(HOST_GCC_COMMON_MAKE_OPTS) \
-	all-gcc \
-	all-target-libgcc
+	gcc_cv_prog_makeinfo_modern=no
 
-HOST_GCC_BARE_METAL_INSTALL_OPTS = install-gcc install-target-libgcc
+HOST_GCC_BARE_METAL_INSTALL_OPTS = \
+	install-gcc \
+	install-target-libgcc
 
 ifeq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB),y)
 HOST_GCC_BARE_METAL_MULTILIB = "--enable-multilib"
@@ -43,54 +45,26 @@ HOST_GCC_BARE_METAL_CONF_OPTS = \
 	--localstatedir=$(HOST_DIR)/var \
 	$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
 	$(QUIET) \
-	--disable-shared \
-	--disable-initfini-array \
-	--disable-__cxa_atexit \
-	--disable-libstdcxx-pch \
-	--with-newlib \
-	--disable-threads \
-	--enable-plugins \
-	--with-gnu-as \
-	--disable-libitm \
-	--without-long-double-128 \
-	--without-headers \
-	--enable-languages=c \
 	$(HOST_GCC_BARE_METAL_MULTILIB) \
 	--with-gmp=$(HOST_DIR) \
 	--with-mpc=$(HOST_DIR) \
 	--with-mpfr=$(HOST_DIR) \
-	--with-isl=$(HOST_DIR)
-
-define HOST_GCC_BARE_METAL_CONFIGURE_CMDS
-	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
-		mkdir -p $(@D)/build-$(arch_tuple) && \
-		cd $(@D)/build-$(arch_tuple) && \
-		$(HOST_CONFIGURE_OPTS) \
-		$(HOST_GCC_BARE_METAL_CONF_ENV) \
-		CONFIG_SITE=/dev/null \
-		$(@D)/configure \
-			$(HOST_GCC_BARE_METAL_CONF_OPTS) \
-			--target=$(arch_tuple) \
-			--with-sysroot=$(HOST_DIR)/$(arch_tuple)/sysroot \
-			AR_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ar \
-			RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ranlib
-	)
-endef
-
-define HOST_GCC_BARE_METAL_BUILD_CMDS
-	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
-		$(HOST_MAKE_ENV) $(MAKE) \
-			$(HOST_GCC_BARE_METAL_MAKE_OPTS) \
-			-C $(@D)/build-$(arch_tuple)
-	)
-endef
+	--with-isl=$(HOST_DIR) \
+	--with-newlib \
+	--disable-shared \
+	--disable-threads \
+	--disable-tls \
+	--disable-libatomic \
+	--disable-libgomp \
+	--disable-libitm \
+	--disable-libmudflap \
+	--disable-libquadmath \
+	--disable-libssp \
+	--disable-nls \
+	--disable-tm-clone-registry
 
-define HOST_GCC_BARE_METAL_INSTALL_CMDS
-	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
-		$(HOST_MAKE_ENV) $(MAKE) \
-			$(HOST_GCC_BARE_METAL_INSTALL_OPTS) \
-			-C $(@D)/build-$(arch_tuple)
-	)
-endef
+ifneq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIG_DIR),"")
+include $(shell grep -v '^\s*#' $(wildcard $(subst ",,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIGS))/*)
+endif
 
-$(eval $(host-autotools-package))
+include $(sort $(wildcard package/gcc-bare-metal/*/*.mk))
diff --git a/package/newlib-bare-metal-nano/Config.in b/package/newlib-bare-metal-nano/Config.in
new file mode 100644
index 0000000000..1e16240ea4
--- /dev/null
+++ b/package/newlib-bare-metal-nano/Config.in
@@ -0,0 +1,12 @@
+# Copyright 2026 Rockwell Collins
+
+config BR2_PACKAGE_NEWLIB_BARE_METAL_NANO
+	bool
+	default y if BR2_PACKAGE_NEWLIB_BARE_METAL
+	help
+	  newlib-nano is an open source C library (libc) targeting
+	  embedded microcontrollers (MCU). Implementation focus is on
+	  code and data size reduction through optimization and removal
+	  of non-MCU features.
+
+	  https://github.com/32bitmicro/newlib-nano-1.0
diff --git a/package/newlib-bare-metal-nano/newlib-bare-metal-nano.hash b/package/newlib-bare-metal-nano/newlib-bare-metal-nano.hash
new file mode 120000
index 0000000000..f5ffcdfaba
--- /dev/null
+++ b/package/newlib-bare-metal-nano/newlib-bare-metal-nano.hash
@@ -0,0 +1 @@
+../newlib-bare-metal/newlib-bare-metal.hash
\ No newline at end of file
diff --git a/package/newlib-bare-metal-nano/newlib-bare-metal-nano.mk b/package/newlib-bare-metal-nano/newlib-bare-metal-nano.mk
new file mode 100644
index 0000000000..38a95ae7dc
--- /dev/null
+++ b/package/newlib-bare-metal-nano/newlib-bare-metal-nano.mk
@@ -0,0 +1,100 @@
+################################################################################
+#
+# newlib-bare-metal-nano
+#
+################################################################################
+
+# Copyright 2026 Rockwell Collins
+
+NEWLIB_BARE_METAL_NANO_VERSION = $(NEWLIB_BARE_METAL_VERSION)
+NEWLIB_BARE_METAL_NANO_SITE = $(NEWLIB_BARE_METAL_SITE)
+NEWLIB_BARE_METAL_NANO_SOURCE = $(NEWLIB_BARE_METAL_SOURCE)
+NEWLIB_BARE_METAL_NANO_DEPENDENCIES = newlib-bare-metal
+NEWLIB_BARE_METAL_NANO_ADD_TOOLCHAIN_DEPENDENCY = NO
+NEWLIB_BARE_METAL_NANO_LICENSE = $(NEWLIB_BARE_METAL_LICENSE)
+NEWLIB_BARE_METAL_NANO_LICENSE_FILES = $(NEWLIB_BARE_METAL_LICENSE_FILES)
+NEWLIB_BARE_METAL_NANO_CPE_ID_VENDOR = $(NEWLIB_BARE_METAL_CPE_ID_VENDOR)
+NEWLIB_BARE_METAL_NANO_CPE_ID_PRODUCT = $(NEWLIB_BARE_METAL_CPE_ID_PRODUCT)
+
+NEWLIB_BARE_METAL_NANO_INSTALL_STAGING = YES
+NEWLIB_BARE_METAL_NANO_INSTALL_TARGET = NO
+
+NEWLIB_BARE_METAL_NANO_CONF_OPTS = \
+	--build=$(GNU_HOST_NAME) \
+	--prefix=/usr \
+	--exec-prefix=/usr \
+	--sysconfdir=/etc \
+	--localstatedir=/var \
+	--program-prefix="" \
+	$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
+	$(QUIET) \
+	--enable-newlib-io-c99-formats \
+	--enable-newlib-io-long-long \
+	--enable-newlib-io-float \
+	--enable-newlib-io-long-double \
+	--with-tooldir=/usr
+
+define NEWLIB_BARE_METAL_NANO_CONFIGURE_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		cd $(@D)/build-$(arch_tuple) && \
+		mkdir -p $(@D)/build-$(arch_tuple)/tmp-install && \
+		PATH=$(BR_PATH) \
+		CONFIG_SITE=/dev/null \
+		$(@D)/configure \
+			$(NEWLIB_BARE_METAL_NANO_CONF_OPTS) \
+			$(NEWLIB_BARE_METAL_NANO_EXTRA_CONF_OPTS_$(arch_tuple))\
+			--enable-multilib \
+		        --prefix=$(@D)/build-$(arch_tuple)-nano/tmp-install \
+		        --enable-newlib-reent-small \
+		        --disable-newlib-fvwrite-in-streamio \
+		        --disable-newlib-fseek-optimization \
+		        --disable-newlib-wide-orient \
+		        --enable-newlib-nano-malloc \
+		        --disable-newlib-unbuf-stream-opt \
+		        --enable-lite-exit \
+		        --enable-newlib-global-atexit \
+		        --enable-newlib-nano-formatted-io \
+		        --disable-newlib-supplied-syscalls \
+			--enable-multilib \
+		        --disable-nls \
+		        CFLAGS_FOR_TARGET="-Os -ffunction-sections -fdata-sections    -mcmodel=medlow" \
+		        CXXFLAGS_FOR_TARGET="-Os -ffunction-sections -fdata-sections    -mcmodel=medlow" \
+			--target=$(arch_tuple)
+	)
+endef
+
+define NEWLIB_BARE_METAL_NANO_BUILD_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		PATH=$(BR_PATH) $(MAKE1) \
+			$(NEWLIB_BARE_METAL_NANO_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
+define NEWLIB_BARE_METAL_NANO_INSTALL_STAGING_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		PATH=$(BR_PATH) $(MAKE1) \
+			$(NEWLIB_BARE_METAL_NANO_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple) \
+			DESTDIR=$(@D)/build-$(arch_tuple)/tmp-install \
+			install
+		cp -a $(@D)/build-$(arch_tuple)/tmp-install/usr/lib/libc.a \
+			$(HOST_DIR)/$(arch_tuple)/sysroot/usr/lib/libc_nano.a
+		cp -a $(@D)/build-$(arch_tuple)/tmp-install/usr/lib/libm.a \
+			$(HOST_DIR)/$(arch_tuple)/sysroot/usr/lib/libm_nano.a
+		cp -a $(@D)/build-$(arch_tuple)/tmp-install/usr/lib/libg.a \
+			$(HOST_DIR)/$(arch_tuple)/sysroot/usr/lib/libg_nano.a
+		cp -a $(@D)/build-$(arch_tuple)/tmp-install/usr/lib/libgloss.a \
+			$(HOST_DIR)/$(arch_tuple)/sysroot/usr/lib/libgloss_nano.a
+		mkdir -p $(HOST_DIR)/$(arch_tuple)/sysroot/usr/include/newlib-nano
+		cp -a $(@D)/build-$(arch_tuple)/tmp-install/usr/include/newlib.h \
+			$(HOST_DIR)/$(arch_tuple)/sysroot/usr/include/newlib-nano
+	)
+endef
+
+$(eval $(generic-package))
+
+ifneq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIG_DIR),"")
+include $(shell grep -v '^\s*#' $(wildcard $(subst ",,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIGS))/*)
+endif
diff --git a/package/newlib-bare-metal/Config.in b/package/newlib-bare-metal/Config.in
index 1ff3d5d8ec..8b064af1e4 100644
--- a/package/newlib-bare-metal/Config.in
+++ b/package/newlib-bare-metal/Config.in
@@ -1,2 +1,14 @@
+# Copyright 2026 Rockwell Collins
+
 config BR2_PACKAGE_NEWLIB_BARE_METAL
 	bool
+	default y if BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
+	help
+	  Newlib is a C library intended for use on embedded systems.
+
+	  Newlib is a C standard library implementation intended for use
+	  on embedded systems. It is a conglomeration of several library
+	  parts, all under free software licenses that make them easily
+	  usable on embedded products.
+
+	  https://sourceware.org/git/newlib-cygwin.git
diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index 5881993d3a..c8f1c9e8da 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
+# Copyright 2026 Rockwell Collins
+
 NEWLIB_BARE_METAL_VERSION = 4.6.0.20260123
 NEWLIB_BARE_METAL_SITE = https://sourceware.org/ftp/newlib
 NEWLIB_BARE_METAL_SOURCE = newlib-$(NEWLIB_BARE_METAL_VERSION).tar.gz
-NEWLIB_BARE_METAL_DEPENDENCIES = host-gcc-bare-metal
+NEWLIB_BARE_METAL_DEPENDENCIES = host-gcc-bare-metal-initial
 NEWLIB_BARE_METAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 NEWLIB_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
 NEWLIB_BARE_METAL_LICENSE_FILES = \
@@ -52,6 +54,7 @@ define NEWLIB_BARE_METAL_CONFIGURE_CMDS
 		CONFIG_SITE=/dev/null \
 		$(@D)/configure \
 			$(NEWLIB_BARE_METAL_CONF_OPTS) \
+			$(NEWLIB_BARE_METAL_CONF_OPTS_$(arch_tuple)) \
 			--target=$(arch_tuple)
 	)
 endef
@@ -74,3 +77,7 @@ define NEWLIB_BARE_METAL_INSTALL_STAGING_CMDS
 endef
 
 $(eval $(generic-package))
+
+ifneq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIG_DIR),"")
+include $(shell grep -v '^\s*#' $(wildcard $(subst ",,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIGS))/*)
+endif
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index 7ba579b570..90f957aed4 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -26,6 +26,34 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB
 	  When enabled, this option will apply to all architecture
 	  tuples in the list.
 
+config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_NANO
+	bool "Enable nano"
+	select BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB
+	select BR2_PACKAGE_NEWLIB_BARE_METAL_NANO
+	help
+	  Build the nano newlib libraries to allow support for
+	  other languages like c++ and FORTRAN.
+
+	  When enabled, this option will apply to all architecture
+	  tuples in the list.
+
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
+source "package/newlib-bare-metal-nano/Config.in"
 
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
diff --git a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
index 71063fcee4..eeeacffaf3 100644
--- a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
+++ b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
@@ -4,7 +4,12 @@
 #
 ################################################################################
 
+# Copyright 2026 Rockwell Collins
+
 TOOLCHAIN_BARE_METAL_BUILDROOT_DEPENDENCIES = newlib-bare-metal
+ifeq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_NANO),y)
+TOOLCHAIN_BARE_METAL_BUILDROOT_DEPENDENCIES += host-gcc-bare-metal-final
+endif
 TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE = $(call qstrip,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH))
 TOOLCHAIN_BARE_METAL_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
