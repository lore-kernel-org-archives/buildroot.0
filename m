Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA68CD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 08:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52D4F40201;
	Mon, 18 Sep 2023 08:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52D4F40201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFpqkccACPlN; Mon, 18 Sep 2023 08:45:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59FF0411A1;
	Mon, 18 Sep 2023 08:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59FF0411A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7EAC1BF295
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 08:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDD068179A
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 08:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDD068179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YcK2HhgFwrOG for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 08:45:27 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8654A81585
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 08:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8654A81585
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50300141a64so2870074e87.0
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 01:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695026725; x=1695631525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HNlHspBzsPJoVbfccJHmSkqOXucVDUo1WvE08GVKkMc=;
 b=oxwi1RxrkIGLoXfhT/uffJbbKErBvZLGcuQNmITFCEphVDOPBjIFX/bBx/tuCT/Q4x
 dGgezS/hB2+6b2AkI7W0yIMuX3PqXo7HfMJQND2v9O4YFu2ah82QQAtnpD7+xS98Qlae
 NwuB/NYytGhcW9JUmT+pNTAtJUaQUdCl/k3Jy1+KzyH2xNOycsYZV8E7JUoBdsf7xWDw
 eelm7vV+awg+FujD/GrKQEOPU7NCNWHpuaoKad9Tw8eKTMMWuSHGMMYyuJ/6d/l5ygVF
 gTx728mjmU+Pj0IpHgCw8xMYOXX1chH3rikwFsPbtfz6dxAntodjBz1cKPto0poE6pMA
 0etg==
X-Gm-Message-State: AOJu0YzYqAkAn1h5YzL9rHB7nU/9djw+WQVg8DiHgshnBRDXvh/MzgSt
 4xrr2l9HSEylynBGkqLNSOotgv5QE542Ug==
X-Google-Smtp-Source: AGHT+IHNUVfTm5d8qAhUqsc49YXm/Vpo511ivyC6DvqOFg5/GdLTVGQn5DV76uhKLbc4rdldmMNKzQ==
X-Received: by 2002:a05:6512:4003:b0:500:b63f:4db3 with SMTP id
 br3-20020a056512400300b00500b63f4db3mr8958840lfb.35.1695026724546; 
 Mon, 18 Sep 2023 01:45:24 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 a24-20020a056512201800b0050307304a80sm860516lfb.205.2023.09.18.01.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 01:45:24 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Mon, 18 Sep 2023 10:48:25 +0200
Message-ID: <20230918084825.786715-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695026725; x=1695631525; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HNlHspBzsPJoVbfccJHmSkqOXucVDUo1WvE08GVKkMc=;
 b=YahOz5xroXjae8sNq78UVBP6tqdz6djfMHYoNNtkYJzw7XMj2f/PCzk+N4ITvJzkHA
 Ws4RSg+kZIBJ2hey/6NZ128Usn04a6ykn4Jkmhm8Ig38ybqJD/PIbDUVUtyXBi8LHeH1
 gdHUunxDdxmvwAvP8Mno8zqV+cJjT6V8GIhwHoia7L4yrbeRouNSBgBuOwTDPQyDJx/R
 All71XtBIznbjM6vaIw00gGXA83oolC8t1SOQno5rJF5WHSIJjq3ieQq1+E96Jq8ieOI
 7rRs5EjK2/vwS8dvlQzyUfDwGvsMIZ+CKoOjL//b8/dt6m3vYGLs5CB2TmU4BHliW2TF
 gjpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YahOz5xr
Subject: [Buildroot] [PATCH v3] package/criu: new package
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

 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/criu/Config.in | 48 ++++++++++++++++++++++++++++++++++
 package/criu/criu.hash |  3 +++
 package/criu/criu.mk   | 59 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 112 insertions(+)
 create mode 100644 package/criu/Config.in
 create mode 100644 package/criu/criu.hash
 create mode 100644 package/criu/criu.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7fae4841e4..d6e6a98202 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1986,6 +1986,7 @@ F:	support/testing/tests/package/test_python_pytest.py
 F:	support/testing/tests/package/test_python_pytest_asyncio.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
+F:	package/criu/
 F:	package/libcamera/
 F:	package/libcamera-apps/
 F:	package/libostree/
diff --git a/package/Config.in b/package/Config.in
index e8dbadadf3..9a754cb072 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2667,6 +2667,7 @@ menu "System tools"
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
index 0000000000..3da7ec90ab
--- /dev/null
+++ b/package/criu/criu.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# CRIU
+#
+################################################################################
+
+CRIU_VERSION = 3.18
+CRIU_SOURCE = criu-$(CRIU_VERSION).tar.gz
+CRIU_SITE = https://github.com/checkpoint-restore/criu/archive/refs/tags/v$(CRIU_VERSION)
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
+ # Criu needs Kernel Checkpoint/restore support which is not enabled
+ # by default.
+ define CRIU_LINUX_CONFIG_FIXUPS
+		 $(call KCONFIG_ENABLE_OPT,CONFIG_CHECKPOINT_RESTORE)
+ endef
+
+define CRIU_BUILD_CMDS
+	rm -rf $(@D)/images/google/protobuf/descriptor.proto
+	ln -s  $(STAGING_DIR)/usr/include/google/protobuf/descriptor.proto $(@D)/images/google/protobuf/descriptor.proto
+	$(CRIU_MAKE_ENV) $(MAKE) USERCFLAGS="$(TARGET_CFLAGS)" -C $(@D)
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
