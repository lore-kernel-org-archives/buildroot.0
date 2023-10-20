Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78CDCDB474
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 05:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1778640160;
	Fri, 20 Oct 2023 05:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1778640160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13WpHMQ6g4zn; Fri, 20 Oct 2023 05:58:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AED6840423;
	Fri, 20 Oct 2023 05:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AED6840423
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B74491BF2FA
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 05:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 898E784472
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 05:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 898E784472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b58LSP_KJNOi for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 05:58:48 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B83F84469
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 05:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B83F84469
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c50cf61f6dso6731281fa.2
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 22:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697781525; x=1698386325;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mda3n/+M8DIWcz7Hg0xHUBOnsWdVUxhKRHdL1kVGelk=;
 b=ff4Zl01wDw6gwHuVuhFdRHzjrO3aJZF7AebwEukXhNvKZ38yG6lC0dxpkcfINJjiB4
 dSU/sNbVNM9EpY3lZ1UYyZe7gzZg47m+g/msW6D52Bj0mIs8O50aj20MHCvm16JDeQiS
 jEH0uZRZfBB/Shrp8ZsT8DWGHsD+a4ojRcDNlNNdETQFpIwwADcrtbElowXb2eJ3hbRD
 YgloIc/YAIZsL0CLpQaYp4vbi7FJ33S/Zuumt1EA0MjMp7RHOtNjpQgCJ7umAP7NmLHu
 dAHfhHM9iQrZtHkWrzGlO78Ebuo0/8MtZfr15Pq43YKem6zh3gfVcp1QDn1z6n0PHziB
 H7Hw==
X-Gm-Message-State: AOJu0YyPLf3htdDVsBwAVnozOiHUvvL+dNXMEWvohFaV7zTysedum1SG
 K6q+rzfENXrZDJnEbDG7zmyd8pK+peg=
X-Google-Smtp-Source: AGHT+IEqYXpCX7UjKQnQ1DipakyU0Jdic4TXw6bK9SX6lV7ZHPPujrM5jz0wZf8y9oq9JrrIHBNUFw==
X-Received: by 2002:a2e:8e2a:0:b0:2b5:7f93:b3b0 with SMTP id
 r10-20020a2e8e2a000000b002b57f93b3b0mr532023ljk.17.1697781525147; 
 Thu, 19 Oct 2023 22:58:45 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 w10-20020a2e160a000000b002c032e54948sm227042ljd.117.2023.10.19.22.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 22:58:44 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Fri, 20 Oct 2023 08:02:36 +0200
Message-ID: <20231020060236.3725194-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697781525; x=1698386325; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mda3n/+M8DIWcz7Hg0xHUBOnsWdVUxhKRHdL1kVGelk=;
 b=l0I/3rcZ1X21ZFZf0tDWEmZ+ZF9AEcC5bp+CNHz063KpMS5EXqLYjL18Z5oCYBzZQb
 ygkiiMjrI9ymWGFG5VROPlGmi8tTUw29EwFxeYUtOqL0LYsvaWeL7cdrBTr1uf6FVytb
 ZMPc26V0MVyN2F2yzACK6zHMTFq6YtQjsQ9hF5i+fWrM3W0ZMhZZKKmVUG/C2B7nQfOT
 kZ/oWZRBzCEbSfzu4xOG13V51YLykNYAq8yJ2abklphFejS3h8iYy2ZcfobCoAi6+G2u
 B1PbVpyMerE24XUEBbzYLrF8WW0eo1ae8V5P4M9JDQ9ojAMVyWnqK0rK+Z/QRlRheljE
 KoaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l0I/3rcZ
Subject: [Buildroot] [PATCH v4] package/criu: new package
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

 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/criu/Config.in | 48 +++++++++++++++++++++++++++++
 package/criu/criu.hash |  3 ++
 package/criu/criu.mk   | 70 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 123 insertions(+)
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
index 0000000000..06e809fb83
--- /dev/null
+++ b/package/criu/Config.in
@@ -0,0 +1,48 @@
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
+	default y if BR2_powerpc64
+	default y if BR2_s390x
+
+menuconfig BR2_PACKAGE_CRIU
+	bool "criu"
+	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_PYTHON3 # host-python3-ssl
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
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
+comment "criu needs a toolchain w/ threads, dynamic library, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_USE_WCHAR
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
index 0000000000..a84c625696
--- /dev/null
+++ b/package/criu/criu.mk
@@ -0,0 +1,70 @@
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
+#x86_64 is treated as x86 in criu
+#Also, powerpc64 is refered to as ppc64 in criu.
+ifeq ($(BR2_ARCH),"x86_64")
+CRIU_MAKE_ENV += ARCH=x86
+else ifeq ($(BR2_ARCH),"powerpc64")
+CRIU_MAKE_ENV += ARCH=ppc64
+else
+CRIU_MAKE_ENV += ARCH=$(BR2_ARCH)
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
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
