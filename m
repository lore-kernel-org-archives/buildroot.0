Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D32C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 15:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03C3B84C3A;
	Wed,  1 Nov 2023 15:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03C3B84C3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yww2pmd9H82I; Wed,  1 Nov 2023 15:18:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F0D584C4A;
	Wed,  1 Nov 2023 15:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F0D584C4A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FC581BF35B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 15:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FCE384C4A
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 15:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FCE384C4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmLJaJY_7zky for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 15:18:01 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26F6C84C3A
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 15:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26F6C84C3A
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c50ec238aeso96508051fa.0
 for <buildroot@buildroot.org>; Wed, 01 Nov 2023 08:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698851878; x=1699456678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X/nomNPhjP88eq7zsB4EhwEZZo7N2PMalwD22PqndC8=;
 b=ZUV/q8egAYCbZv/2ASPtXIaJMls/xUG9QZ3oTOyFiXRByPw1t9znhHty7xKwfXkgJQ
 4XUvQZHB4jkEld4tFVBVIkdsKsH0lRyQMBFGDwxQS6DxAdNRT560gXO/lt10tIhWHE1z
 hz/m5GzWlRPg7wXYiqFJOhyWN4A4zU/fDQN7fGF0yWATWapeVrpC2hfEzaBYwJBiyqCT
 2RXkbA4GM6Bx+w9d0O67h0W3MDT0WdF6F4UzBiP1E7UGbLDcqs7dQ/uOcVxbeZy9ol/y
 19+Mozt2vTRd0YiW1VgTuNuDXVhItnVn4l7ivC9+1rhZnqw1kCQxxCMZ4Xh/MZ+tEiSG
 tKPA==
X-Gm-Message-State: AOJu0YxfYjv7hViEm04Bjl6+HYqn8/SFLI98XYvlrduGMcpi6y60zerZ
 515z4rynB66eoLr8thNmDbEAqAXTWe8=
X-Google-Smtp-Source: AGHT+IH62WwNz0S2QpOjjsJ2CBpBNQXAGJUaQCIyvOMLgaTeJt9caFmi2lsCTlyY9LGN1bXtnx9hPA==
X-Received: by 2002:a2e:be0c:0:b0:2c5:1bd9:f95c with SMTP id
 z12-20020a2ebe0c000000b002c51bd9f95cmr15354981ljq.53.1698851877426; 
 Wed, 01 Nov 2023 08:17:57 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 q126-20020a2e5c84000000b002c5038e11cdsm239203ljb.53.2023.11.01.08.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 08:17:56 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Wed,  1 Nov 2023 16:22:05 +0100
Message-ID: <20231101152205.530647-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698851878; x=1699456678; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X/nomNPhjP88eq7zsB4EhwEZZo7N2PMalwD22PqndC8=;
 b=WV2QrluSl10CyTwWHBAZmSqFAHrK7NvsVDuOffEq4Lx/lOZH8As7GSm4DfciYiMZpe
 /da2hHxeLF1xRENRTKEOms10qH/kL4nJgaCNUBsuzBlXvh8RAUqoL4GtJQwwO1vYUSQS
 yMmfqnS9f+mz+PgMwfcO6BqYumttrlfZLcYQfJ/1Q2u6aBKFzSnvTRxp2G07e0LsDwx2
 Ub5mSYINrB+81kYVkUgfne1IyX/N0jVTHY3Ys43eOnZb+cxasR3Cjwy+FyFTRXLmSpTe
 e/QR4nfpSP61UAGDGtNar7X31kOyETgmTNdes01Ta8liF5hickmuYbS6K09+/v3XsWQh
 14Ig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WV2QrluS
Subject: [Buildroot] [PATCH v6] package/criu: new package
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Checkpoint/Restore In Userspace (CRIU), is a software tool for the
Linux operating system to make it possible to freeze a running
application and checkpoint it to persistent storage as a collection of files.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

Notes:
    v2:
     - Addressed comments from Thomas.
     - Tested on ARM target and on x86_64 with qemu.
    
    v3:
     - set CONFIG_CHECKPOINT_RESTORE in kernel config
     - Only be available for ARMv6, ARMv7 and ARMv8
    
    v4:
    - set SUBARCH for armv6, armv7 and armv8
    - Use github download helper
    
    Result from test-pkg:
                        bootlin-armv5-uclibc [1/6]: SKIPPED
                         bootlin-armv7-glibc [2/6]: OK
                       bootlin-armv7m-uclibc [3/6]: SKIPPED
                         bootlin-x86-64-musl [4/6]: OK
                          br-arm-full-static [5/6]: SKIPPED
                                sourcery-arm [6/6]: SKIPPED
    6 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
    
    v5:
    - Remove support for s390 arch
    - Depend on BR2_HOST_GCC_AT_LEAST_8
    - Depend on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
    - Depend on !BR2_TOOLCHAIN_USES_UCLIBC
    - Use BR2_NORMALIZED_ARCH instead of BR2_ARCH
    
    v6:
    - Replace dependency BR2_HOST_GCC_AT_LEAST_8 with BR2_TOOLCHAIN_GCC_AT_LEAST_8
    - Remove dependency BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
    - Reflect changes in comment

 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/criu/Config.in | 53 +++++++++++++++++++++++++++++++
 package/criu/criu.hash |  3 ++
 package/criu/criu.mk   | 71 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 129 insertions(+)
 create mode 100644 package/criu/Config.in
 create mode 100644 package/criu/criu.hash
 create mode 100644 package/criu/criu.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 57015e245e..2047827bd9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2007,6 +2007,7 @@ F:	support/testing/tests/package/test_python_pytest.py
 F:	support/testing/tests/package/test_python_pytest_asyncio.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
+F:	package/criu/
 F:	package/libcamera/
 F:	package/libcamera-apps/
 F:	package/libostree/
diff --git a/package/Config.in b/package/Config.in
index 4e489c4706..9e2099f6a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2678,6 +2678,7 @@ menu "System tools"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
+	source "package/criu/Config.in"
 	source "package/crun/Config.in"
 	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
diff --git a/package/criu/Config.in b/package/criu/Config.in
new file mode 100644
index 0000000000..fbc66d322b
--- /dev/null
+++ b/package/criu/Config.in
@@ -0,0 +1,53 @@
+# criu only builds on certain architectures
+config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
+	bool
+	default y if BR2_ARM_CPU_ARMV6
+	default y if BR2_ARM_CPU_ARMV7A
+	default y if BR2_ARM_CPU_ARMV7M
+	default y if BR2_ARM_CPU_ARMV8A
+	default y if BR2_ARM_CPU_ARMV8M
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_mips
+	default y if BR2_x86_64
+	default y if BR2_BR2_powerpc64le #Only support powerpc64 with LE
+	#CRIU has "some" support for s390 but it is not included due to
+	#BE/LE endian issues.
+
+menuconfig BR2_PACKAGE_CRIU
+	bool "criu"
+	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_PYTHON3 # host-python3-ssl
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # -march=armv7-a+fp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 # rseq.h
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no aio.h
+	depends on !BR2_STATIC_LIBS # protobuf, libbsd
+	depends on BR2_USE_WCHAR # libbsd
+	depends on BR2_USE_MMU # libcap
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_PROTOBUF_C
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_LIBBSD
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBNET
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_PYTHON3
+	help
+	  Checkpoint/Restore In Userspace (CRIU), is a software
+	  tool for the Linux operating system to make it possible
+	  to freeze a running application and checkpoint it to
+	  persistent storage as a collection of files.
+
+	  https://criu.org/Main_Page
+
+comment "criu needs a glibc or musl toolchain w/ threads, gcc >= 8, headers >= 4.18, dynamic library, wchar"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 \
+		|| BR2_TOOLCHAIN_USES_UCLIBC \
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/criu/criu.hash b/package/criu/criu.hash
new file mode 100644
index 0000000000..2c4a07252b
--- /dev/null
+++ b/package/criu/criu.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  6a9997981c9fe4730c848ce59346b3a22fad69b803607cb67a3f6ec0557fa474  criu-3.18.tar.gz
+sha256  568a1fa9d90e18a1a1a61ea58ec2eece16b56a5042cc72c1b4f8d4455ae6fcb7  COPYING
diff --git a/package/criu/criu.mk b/package/criu/criu.mk
new file mode 100644
index 0000000000..9814e4a0de
--- /dev/null
+++ b/package/criu/criu.mk
@@ -0,0 +1,71 @@
+################################################################################
+#
+# CRIU
+#
+################################################################################
+
+CRIU_VERSION = 3.18
+CRIU_SITE = $(call github,checkpoint-restore,criu,v$(CRIU_VERSION))
+
+CRIU_LICENSE = GPL-2.0
+CRIU_LICENSE_FILES = COPYING
+CRIU_DEPENDENCIES =\
+	host-pkgconf \
+	host-protobuf-c \
+	host-python3 \
+	host-python-pip \
+	libaio \
+	libbsd \
+	libcap \
+	libnet \
+	libnl \
+	protobuf \
+	protobuf-c \
+	python3
+
+CRIU_MAKE_ENV =\
+	$(TARGET_MAKE_ENV) \
+	$(TARGET_CONFIGURE_OPTS) \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	WERROR=0
+
+#Remap to match the used in criu.
+ifeq ($(BR2_NORMALIZED_ARCH),"x86_64")
+CRIU_MAKE_ENV += ARCH=x86
+else ifeq ($(BR2_NORMALIZED_ARCH),"powerpc")
+CRIU_MAKE_ENV += ARCH=ppc64
+else ifeq ($(BR2_NORMALIZED_ARCH),"arm64")
+CRIU_MAKE_ENV += ARCH=aarch64
+else
+CRIU_MAKE_ENV += ARCH=$(BR2_NORMALIZED_ARCH)
+endif
+
+ifeq ($(BR2_ARM_CPU_ARMV6), y)
+CRIU_MAKE_ENV += SUBARCH=armv6
+else ifeq ($(BR2_ARM_CPU_ARMV7A), y)
+CRIU_MAKE_ENV += SUBARCH=armv7
+else ifeq ($(BR2_ARM_CPU_ARMV7M), y)
+CRIU_MAKE_ENV += SUBARCH=armv7
+else ifeq ($(BR2_ARM_CPU_ARMV8A), y)
+CRIU_MAKE_ENV += SUBARCH=armv8
+else ifeq ($(BR2_ARM_CPU_ARMV8M), y)
+CRIU_MAKE_ENV += SUBARCH=armv8
+endif
+
+# Criu needs Kernel Checkpoint/restore support which is not enabled
+# by default.
+define CRIU_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CHECKPOINT_RESTORE)
+endef
+
+define CRIU_BUILD_CMDS
+	rm -rf $(@D)/images/google/protobuf/descriptor.proto
+	ln -s  $(STAGING_DIR)/usr/include/google/protobuf/descriptor.proto $(@D)/images/google/protobuf/descriptor.proto
+	$(CRIU_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define CRIU_INSTALL_TARGET_CMDS
+	$(CRIU_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install-criu install-lib install-compel
+endef
+
+$(eval $(generic-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
