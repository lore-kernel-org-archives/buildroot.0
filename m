Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F204FC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E8288123C;
	Wed,  1 Nov 2023 17:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E8288123C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gPAOElEq3yG8; Wed,  1 Nov 2023 17:27:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 187FD84B27;
	Wed,  1 Nov 2023 17:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 187FD84B27
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07E631BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D58618123C
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D58618123C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Skv9gD9_D2Pe for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:27:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C998584B89
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C998584B89
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2F2E863C1; Wed,  1 Nov 2023 17:27:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 18:27:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a96361901dcc7b962a0c43f163e97a2de65687f3
X-Git-Newrev: 3e4b479f39c15ffdf307ec8395d856680c727204
X-Patchwork-Hint: ignore
Message-Id: <20231101172743.B2F2E863C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/criu: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e4b479f39c15ffdf307ec8395d856680c727204
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Checkpoint/Restore In Userspace (CRIU), is a software tool for the
Linux operating system to make it possible to freeze a running
application and checkpoint it to persistent storage as a collection of files.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
[yann.morin.1998@free.fr:
  - BR2_ARM_CPU_ARMV8M does not exist
  - BR2_BR2_powerpc64le misspelled
  - move all arch dependencies to BR2_PACKAGE_CRIU_ARCH_SUPPORTS
  - comment hidden with arch dependencies
  - select host-python3, don't depend on it
  - extend legal-info: LPLG-2.1 for lib/, MIT for images/
  - PREFIX is also used at compile time for PLUGINDIR
  - copy .proto file, rather than symlinking
  - wrap long lines
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/criu/Config.in | 53 ++++++++++++++++++++++++++++++++++
 package/criu/criu.hash |  3 ++
 package/criu/criu.mk   | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 135 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c64fd07002..ca812b3ae6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2008,6 +2008,7 @@ F:	support/testing/tests/package/test_python_pytest.py
 F:	support/testing/tests/package/test_python_pytest_asyncio.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
+F:	package/criu/
 F:	package/libcamera/
 F:	package/libcamera-apps/
 F:	package/libostree/
diff --git a/package/Config.in b/package/Config.in
index 57e9261eea..3ce78a2461 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2679,6 +2679,7 @@ menu "System tools"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
+	source "package/criu/Config.in"
 	source "package/crun/Config.in"
 	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
diff --git a/package/criu/Config.in b/package/criu/Config.in
new file mode 100644
index 0000000000..ff3bf30229
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
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_mips
+	default y if BR2_x86_64
+	default y if BR2_powerpc64le # Only support powerpc64 with LE
+	# CRIU has "some" support for s390 but it is not included due to
+	# BE/LE endian issues.
+	depends on BR2_USE_MMU # libcap
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+
+config BR2_PACKAGE_CRIU
+	bool "criu"
+	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # -march=armv7-a+fp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 # rseq.h
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no aio.h
+	depends on !BR2_STATIC_LIBS # protobuf, libbsd
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
+	depends on BR2_USE_WCHAR # libbsd
+	select BR2_PACKAGE_HOST_PYTHON3
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
+	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
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
index 0000000000..7f70c89068
--- /dev/null
+++ b/package/criu/criu.mk
@@ -0,0 +1,77 @@
+################################################################################
+#
+# CRIU
+#
+################################################################################
+
+CRIU_VERSION = 3.18
+CRIU_SITE = $(call github,checkpoint-restore,criu,v$(CRIU_VERSION))
+
+CRIU_LICENSE = GPL-2.0, LGPL-2.1 (for lib/), MIT (for images/)
+CRIU_LICENSE_FILES = COPYING images/LICENSE
+
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
+# Remap to match the used in criu.
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
+ifeq ($(BR2_ARM_CPU_ARMV6),y)
+CRIU_MAKE_ENV += SUBARCH=armv6
+else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
+CRIU_MAKE_ENV += SUBARCH=armv7
+else ifeq ($(BR2_ARM_CPU_ARMV7M),y)
+CRIU_MAKE_ENV += SUBARCH=armv7
+else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
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
+	cp -a  $(STAGING_DIR)/usr/include/google/protobuf/descriptor.proto \
+		$(@D)/images/google/protobuf/descriptor.proto
+	$(CRIU_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX=/usr
+endef
+
+define CRIU_INSTALL_TARGET_CMDS
+	$(CRIU_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX=/usr \
+		DESTDIR=$(TARGET_DIR) \
+		install-criu \
+		install-lib \
+		install-compel
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
