Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5498BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 18:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5628418F1;
	Tue, 29 Mar 2022 18:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sPY0WrVSYvO6; Tue, 29 Mar 2022 18:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74911418F3;
	Tue, 29 Mar 2022 18:51:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9394D1BF83C
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 18:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FF54418C7
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 18:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVFvEf3HXDsQ for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 18:51:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47474418E5
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 18:51:23 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id x2so18457235plm.7
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 11:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iTFpcxC17SOkEiD6dW58vZNtlNQ6Tf/Z7NCk5yM7GXM=;
 b=E5EUieCiTreDg3Xb3t3qra1HUhTii3GI2RRpmqunQoQbfJNsePE8rBMtR9JzBJhi6E
 AOGCR4Bqpe0HaPSlQW0iSqBQox8f+d+8LhsvoFlDnWm6tl8su8dCcYOCX6d/EgHpWSzl
 jY/ETVTJCRrjEL95pz9/8aZtCAqbYuQFV8bVAPsTzLwjCU2aIzsmOPlzmk3zOkiooqHv
 3/0p/aiOhl1W/jxlOh12zeOgybUq4tcmcQ11wnBJoxI+b0hNCYrF6H7s+tfxVIQGDAC8
 DjPoG9+zZBKMKv5BBic7Ko3u/4519OR04vkKcf8igJaDbXM8UlGOKKUpM8w+Pt1OJtww
 5ciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iTFpcxC17SOkEiD6dW58vZNtlNQ6Tf/Z7NCk5yM7GXM=;
 b=Id+gPPUlzM8qooTiSI5ba7T1MfxKEC3dFgKjnmcw4jjH0qUD1xhyatbgFrD/1E/yRl
 qJnhMW0szgvSN84UArMjYksGp4ehVuMMugh7iONU9vrRWRQ+tcHkZdVfa9DTQYqRgbBk
 8FLZAKF8Aqv5MwPNh2OAqKy7VM5dgBUNdcDvx04VN0Mg2kx8SKfpk8lhyFL1MEHUJvNT
 findSGM2JuQNePmreJaQOdWpryjc++BJxflqqyMfQWWs4GmAbogrS7q4M5RGBdAoBuxb
 q5O0ZCqchyOPkxYM2NMpbcglGvBxvGgkwEa4T7mF457IO4evj8d1Z9ML+d2qV4LPuHJU
 hHdQ==
X-Gm-Message-State: AOAM532K1bZ93qa4o61UoOoF3xgPRrquyWTtNTiJBtuGK18N1cAfNryy
 sBOb5ImFvS21QausH/qtLLYi3vY7BDzCsw==
X-Google-Smtp-Source: ABdhPJz3u45iNtQcQgj6qu6SbRqxsyB9wmBKLKSkZI8VcKvCxn5Y4tyejG+Fgeyujm4PlnsdWp7BUQ==
X-Received: by 2002:a17:90a:fd13:b0:1c9:ee13:d122 with SMTP id
 cv19-20020a17090afd1300b001c9ee13d122mr540280pjb.226.1648579882100; 
 Tue, 29 Mar 2022 11:51:22 -0700 (PDT)
Received: from mac-mini.. ([2806:1000:8003:5c6c::13])
 by smtp.googlemail.com with ESMTPSA id
 y12-20020a17090a784c00b001c6bdafc995sm4836774pjl.3.2022.03.29.11.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 11:51:21 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 18:50:57 +0000
Message-Id: <20220329185059.943889-2-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220329185059.943889-1-alseycmiller@gmail.com>
References: <20220329185059.943889-1-alseycmiller@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/libdispatch: add libdispatch package
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
Cc: Alsey Miller <alseycmiller@gmail.com>, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 package/Config.in                    |  1 +
 package/libdispatch/Config.in        | 43 ++++++++++++++++++++++
 package/libdispatch/libdispatch.hash |  1 +
 package/libdispatch/libdispatch.mk   | 53 ++++++++++++++++++++++++++++
 4 files changed, 98 insertions(+)
 create mode 100644 package/libdispatch/Config.in
 create mode 100644 package/libdispatch/libdispatch.hash
 create mode 100644 package/libdispatch/libdispatch.mk

diff --git a/package/Config.in b/package/Config.in
index 0d5d763180..e217ff5282 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1968,6 +1968,7 @@ menu "Other"
 	source "package/libcrossguid/Config.in"
 	source "package/libcsv/Config.in"
 	source "package/libdaemon/Config.in"
+	source "package/libdispatch/Config.in"
 	source "package/libeastl/Config.in"
 	source "package/libee/Config.in"
 	source "package/libev/Config.in"
diff --git a/package/libdispatch/Config.in b/package/libdispatch/Config.in
new file mode 100644
index 0000000000..f4fa5e47fb
--- /dev/null
+++ b/package/libdispatch/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_LIBDISPATCH_ARCH_SUPPORTS
+	bool
+	default y if BR2_x86_64
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_powerpc
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_mips64
+	default y if BR2_mips64el
+	default y if BR2_RISCV_64
+
+config BR2_PACKAGE_LIBDISPATCH_TARGET_ARCH
+	string
+	default "aarch64" if BR2_aarch64
+	default "armv5" if BR2_ARM_CPU_ARMV5
+	default "armv6" if BR2_ARM_CPU_ARMV6
+	default "armv7" if BR2_ARM_CPU_ARMV7A
+	default "x86_64" if BR2_x86_64
+	default "powerpc" if BR2_powerpc
+	default "mips" if BR2_mips
+	default "mipsel" if BR2_mipsel
+	default "mips64" if BR2_mips64
+	default "mips64el" if BR2_mips64el
+	default "riscv64" if BR2_RISCV_64
+
+config BR2_PACKAGE_LIBDISPATCH
+	bool "libdispatch"
+	depends on BR2_PACKAGE_LIBDISPATCH_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBBSD
+	
+	help
+	  Grand Central Dispatch (GCD or libdispatch) provides comprehensive support for concurrent code execution on multicore hardware.
+
+	  http://swift.org
+
+comment "libdispatch needs a toolchain w/ Glibc, wchar, threads, C++, dynamic library"
+	depends on BR2_PACKAGE_LIBDISPATCH_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
\ No newline at end of file
diff --git a/package/libdispatch/libdispatch.hash b/package/libdispatch/libdispatch.hash
new file mode 100644
index 0000000000..64543b56eb
--- /dev/null
+++ b/package/libdispatch/libdispatch.hash
@@ -0,0 +1 @@
+sha256 d2bbfb5b98d129caa2c6bd7662c850bf57cb434572d09844b56641c4558906ab libdispatch-swift-5.6-RELEASE.tar.gz
diff --git a/package/libdispatch/libdispatch.mk b/package/libdispatch/libdispatch.mk
new file mode 100644
index 0000000000..a3b441ba36
--- /dev/null
+++ b/package/libdispatch/libdispatch.mk
@@ -0,0 +1,53 @@
+### Grand Central Dispatch
+LIBDISPATCH_VERSION = 5.6
+LIBDISPATCH_SITE = $(call github,apple,swift-corelibs-libdispatch,swift-$(LIBDISPATCH_VERSION)-RELEASE)
+LIBDISPATCH_LICENSE = Apache-2.0
+LIBDISPATCH_LICENSE_FILES = LICENSE
+LIBDISPATCH_INSTALL_STAGING = YES
+LIBDISPATCH_SUPPORTS_IN_SOURCE_BUILD = NO
+LIBDISPATCH_SUPPORTS_CMAKE_TOOLCHAIN = NO
+LIBDISPATCH_DEPENDENCIES = host-clang host-lld libbsd
+
+LIBDISPATCH_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LIBDISPATCH_TARGET_ARCH))
+LIBDISPATCH_CLANG_PATH = $(HOST_DIR)/bin
+
+ifeq ($(LIBDISPATCH_TARGET_ARCH),armv7)
+LIBDISPATCH_TARGET_NAME		= armv7-unknown-linux-gnueabihf
+else ifeq ($(LIBDISPATCH_TARGET_ARCH),armv6)
+LIBDISPATCH_TARGET_NAME		= armv6-unknown-linux-gnueabihf
+else ifeq ($(LIBDISPATCH_TARGET_ARCH),armv5)
+LIBDISPATCH_TARGET_NAME		= armv5-unknown-linux-gnueabi
+else
+LIBDISPATCH_TARGET_NAME		= $(LIBDISPATCH_TARGET_ARCH)-unknown-linux-gnu
+endif
+
+ifeq ($(LIBDISPATCH_TARGET_ARCH),armv5)
+LIBDISPATCH_EXTRA_FLAGS		= -march=armv5te
+else ifeq ($(LIBDISPATCH_TARGET_ARCH),riscv64)
+LIBDISPATCH_EXTRA_FLAGS		= -mno-relax -mabi=lp64 -march=rv64imac -mfloat-abi=soft
+else ifeq ($(LIBDISPATCH_TARGET_ARCH),mipsel)
+LIBDISPATCH_EXTRA_FLAGS		= -msoft-float
+else ifeq ($(LIBDISPATCH_TARGET_ARCH),mips64el)
+LIBDISPATCH_EXTRA_FLAGS		= -msoft-float
+else ifeq ($(LIBDISPATCH_TARGET_ARCH),powerpc)
+LIBDISPATCH_EXTRA_FLAGS		= -mcpu=7400
+else
+LIBDISPATCH_EXTRA_FLAGS		= 
+endif
+
+LIBDISPATCH_CONF_OPTS += \
+	-DLibRT_LIBRARIES="${STAGING_DIR}/usr/lib/librt.a" \
+	-DCMAKE_C_COMPILER=$(LIBDISPATCH_CLANG_PATH)/clang \
+	-DCMAKE_CXX_COMPILER=$(LIBDISPATCH_CLANG_PATH)/clang++ \
+	-DCMAKE_C_FLAGS="-w -fuse-ld=lld $(LIBDISPATCH_EXTRA_FLAGS) -target $(LIBDISPATCH_TARGET_NAME) --sysroot=$(STAGING_DIR) -I$(STAGING_DIR)/usr/include -B$(STAGING_DIR)/usr/lib -B$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call qstrip,$(BR2_GCC_VERSION)) -L$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call qstrip,$(BR2_GCC_VERSION))" \
+	-DCMAKE_C_LINK_FLAGS="-target $(LIBDISPATCH_TARGET_NAME) --sysroot=$(STAGING_DIR)" \
+	-DCMAKE_CXX_FLAGS="-w -fuse-ld=lld $(LIBDISPATCH_EXTRA_FLAGS) -target $(LIBDISPATCH_TARGET_NAME) --sysroot=$(STAGING_DIR) -I$(STAGING_DIR)/usr/include -I$(HOST_DIR)/$(GNU_TARGET_NAME)/include/c++/$(call qstrip,$(BR2_GCC_VERSION))/ -I$(HOST_DIR)/$(GNU_TARGET_NAME)/include/c++/$(call qstrip,$(BR2_GCC_VERSION))/$(GNU_TARGET_NAME) -B$(STAGING_DIR)/usr/lib -B$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call qstrip,$(BR2_GCC_VERSION)) -L$(HOST_DIR)/lib/gcc/$(GNU_TARGET_NAME)/$(call qstrip,$(BR2_GCC_VERSION))" \
+	-DCMAKE_CXX_LINK_FLAGS="-target $(LIBDISPATCH_TARGET_NAME) --sysroot=$(STAGING_DIR)" \
+
+define LIBDISPATCH_INSTALL_TARGET_CMDS
+	(cd $(LIBDISPATCH_BUILDDIR) && \
+	cp ./*.so $(TARGET_DIR)/usr/lib/ \
+	)
+endef
+
+$(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
