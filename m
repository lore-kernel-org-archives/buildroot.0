Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF7DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 21:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CAAB61038;
	Tue, 29 Mar 2022 21:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69FG8pt9w8Au; Tue, 29 Mar 2022 21:54:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 196A060BC5;
	Tue, 29 Mar 2022 21:54:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA2231BF41A
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 21:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A24CA4193E
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 21:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QfmUVPgPyqis for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 21:54:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F26A41936
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 21:54:40 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id p8so17089835pfh.8
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 14:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cCMxSpu9Qp8dOQSoQO2NvkRr7b0CTdWEptUbV6GwivM=;
 b=EXQmkHxp/N/V8t8zl+355i9vCO5MY/OBEIQj2Je1zxTcD1lCjiKq6fZWmyNQH2fbPX
 O0MHM6Vf7dudKZXnvhr7WswIhdLMqwkTxDf2iq8PTshiMyQXcRp3wxeYwpHnaW4klU/M
 ysSjt3eKRRURyWD1P0OJcMdiYA5vSRBKle4dJdxD5wrNVKDFZ9ej1QEoTAj3oEreQdAC
 bdmCFmRN+50UpXSLneusYQgyI016Q6Y1rQ6xPLQnCUZJZ604yt3D8VmBmT5rm/6s15/K
 /Wd2vIm4DWhSmRQSNyTIscpKyuKUv7+g4UietZkygts4xSUzptLZc6ACsxUFJsDqqsYS
 rIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cCMxSpu9Qp8dOQSoQO2NvkRr7b0CTdWEptUbV6GwivM=;
 b=pCTOqamWkICDY5eWtb5gMwTWGLcIG76eYD/z96zCSaCahK/+fHvP16zR74oN19qugc
 Gzj94Yyj147edWX4StOFjDVstXz72KwFfwY8zQiY+F2ld3k48gL97Ta0MgA9LuE4kakj
 eAFEC0l8ZdbefAqaIpbiz36CfhaJ40g5m9Jb+le34HOUqqWZKHl4wyRKHDCjwTAyDMCy
 p9zArSgIPWCIF4Mm2t0xmVkyhto0dJUoQs+rw5xod/RfjfaHpyd9pODHYdYfAcAP950f
 A1LUWrHwPW17dIS0g47h0QapSWnejuJe4OxcuTOF9Ylaa2VBubU4rh41AAavhG+8wO3x
 xn0Q==
X-Gm-Message-State: AOAM531CSE2oREjzN/T39Hh0CLMHd/BqjbXw1xmpCcIWxvhA6/AW72YG
 rQX/2lc51+4PyRd+C+Jeg6R17s1Zp1GOjg==
X-Google-Smtp-Source: ABdhPJzHKxF7VMQ92cI8jUdZO/Nq+YLvvpXO2JwG4To2++J7Be7sZYmJRPRIMVqhhW1M3uewaR3E0Q==
X-Received: by 2002:a05:6a00:14c6:b0:4fa:eae3:ffe4 with SMTP id
 w6-20020a056a0014c600b004faeae3ffe4mr29005485pfu.45.1648590879210; 
 Tue, 29 Mar 2022 14:54:39 -0700 (PDT)
Received: from mac-mini.. ([2806:1000:8003:5c6c::13])
 by smtp.googlemail.com with ESMTPSA id
 f15-20020a056a001acf00b004fb2ad05521sm13084559pfv.215.2022.03.29.14.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 14:54:38 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 21:54:32 +0000
Message-Id: <20220329215433.1018660-1-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libdispatch: add libdispatch package
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
Cc: Alsey Miller <alseycmiller@gmail.com>,
 James Hillard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 DEVELOPERS                           |  3 ++
 package/Config.in                    |  1 +
 package/libdispatch/Config.in        | 43 +++++++++++++++++++++++
 package/libdispatch/libdispatch.hash |  1 +
 package/libdispatch/libdispatch.mk   | 52 ++++++++++++++++++++++++++++
 5 files changed, 100 insertions(+)
 create mode 100644 package/libdispatch/Config.in
 create mode 100644 package/libdispatch/libdispatch.hash
 create mode 100644 package/libdispatch/libdispatch.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a66b9d7eee..555ec0175b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -122,6 +122,9 @@ F:	boot/opensbi/
 F:	configs/hifive_unleashed_defconfig
 F:	package/xen/
 
+N:	Alsey Miller <alseycmiller@gmail.com>
+F:	package/libdispatch/
+
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
 F:	package/dcron/
 F:	package/libxmlrpc/
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
index 0000000000..79fc4f7780
--- /dev/null
+++ b/package/libdispatch/libdispatch.mk
@@ -0,0 +1,52 @@
+### Grand Central Dispatch
+LIBDISPATCH_VERSION = 5.6
+LIBDISPATCH_SITE = $(call github,apple,swift-corelibs-libdispatch,swift-$(LIBDISPATCH_VERSION)-RELEASE)
+LIBDISPATCH_LICENSE = Apache-2.0
+LIBDISPATCH_LICENSE_FILES = LICENSE
+LIBDISPATCH_INSTALL_STAGING = YES
+LIBDISPATCH_SUPPORTS_IN_SOURCE_BUILD = NO
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
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
