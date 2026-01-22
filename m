Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB80D3F09D
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A810B408F0;
	Wed, 28 Jan 2026 17:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9v-tDs4ZcPJy; Wed, 28 Jan 2026 17:20:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04AB54099A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769620845;
	bh=qPZt95FNhJtkLe4qVe6zd272F+JO70PysVl0/wHSfjE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YEicOvPd4+pQG2biEgSI+ld+gL0qzqQk3QYiSRLOGo/uaGtRC04fwaA4REYQ487QU
	 Kfe6TFE14TTe8xBIXjuS47QPjGH4DVnK4qzV2thFKmLDdTMCZ0onx/u+NMxPM59dVK
	 Ar8/YpU8PWK/Z10y2/oY+E+r3B8FKKiZ4jD68uxpAyxmeEpP4Kz3J5nSuNxK+J6cv7
	 1yzOBb0Gg/6XI6xV4OqmXXXqOMG+FdwH+r8XBsIRHnew7tFOXprWUmAScUWM74gfwN
	 WJvEPK9z6bevFfQH3/Dw9EBWZXVEcNflf2BjkkzGQlkhMYHBBVBteukGLIgklktc0j
	 IDlELdaAFQ89Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04AB54099A;
	Wed, 28 Jan 2026 17:20:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C324A1AD
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A757E8243B
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elmNW59ojRgP for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D1F582433
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D1F582433
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77EB785FE9; Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 15:51:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 87191f62b57932715557ae69ab794113c50f84ff
X-Git-Newrev: 6484bd3cafdb6c582c65dde2c86c2ed21a99d1c3
X-Patchwork-Hint: ignore
Message-Id: <20260128172037.77EB785FE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/criu: remove
 package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6484bd3cafdb6c582c65dde2c86c2ed21a99d1c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The criu package was added in Nov 2023, and then bumped once in
December 2023. Since then, it has never been bumped again, and all
follow-up fixes were provided by other people than the original
package submitter listed in the DEVELOPERS file.

criu has seen several upstream releases since then, and most notably
is causing a number of build issues in our autobuilders:

  https://autobuild.buildroot.net/?reason=criu-3.19

The package was never updated to those newer upstream releases, and
the autobuilder issues have not been addressed.

Therefore, let's drop this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9cf28c6573da793357fa0b073fde9274e6dbb2c8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy       |  8 ++++++
 DEVELOPERS             |  1 -
 package/Config.in      |  1 -
 package/criu/Config.in | 52 ----------------------------------
 package/criu/criu.hash |  3 --
 package/criu/criu.mk   | 77 --------------------------------------------------
 6 files changed, 8 insertions(+), 134 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 286f024a71..053f5c7c77 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.02.11"
 
+config BR2_PACKAGE_CRIU
+	bool "criu has been removed"
+	select BR2_LEGACY
+	help
+	  criu was removed from Buildroot as it was insufficiently
+	  maintained. It can be re-added if someone volunteers to
+	  maintain it.
+
 config BR2_PACKAGE_GCONF
 	bool "gconf package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index dede88c5ee..56b47ca168 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2200,7 +2200,6 @@ F:	support/testing/tests/package/test_python_pytest.py
 F:	support/testing/tests/package/test_python_pytest_asyncio.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
-F:	package/criu/
 F:	package/libcamera/
 F:	package/libcamera-apps/
 F:	package/libostree/
diff --git a/package/Config.in b/package/Config.in
index fbb651c688..2dd7d4ec3e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2797,7 +2797,6 @@ menu "System tools"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
-	source "package/criu/Config.in"
 	source "package/crun/Config.in"
 	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
diff --git a/package/criu/Config.in b/package/criu/Config.in
deleted file mode 100644
index 04a2080041..0000000000
--- a/package/criu/Config.in
+++ /dev/null
@@ -1,52 +0,0 @@
-# criu only builds on certain architectures
-config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
-	bool
-	default y if BR2_ARM_CPU_ARMV6
-	default y if BR2_ARM_CPU_ARMV7A
-	default y if BR2_ARM_CPU_ARMV7M
-	default y if BR2_ARM_CPU_ARMV8A && !BR2_aarch64_be
-	default y if BR2_aarch64
-	default y if BR2_x86_64
-	default y if BR2_powerpc64le # Only support powerpc64 with LE
-	# CRIU has "some" support for s390 but it is not included due to
-	# BE/LE endian issues.
-	depends on BR2_USE_MMU # libcap
-	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-
-config BR2_PACKAGE_CRIU
-	bool "criu"
-	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # -march=armv7-a+fp, protobuf
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 # rseq.h
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no aio.h
-	depends on !BR2_STATIC_LIBS # protobuf, libbsd
-	depends on BR2_INSTALL_LIBSTDCPP # protobuf
-	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
-	depends on BR2_USE_WCHAR # libbsd
-	select BR2_PACKAGE_HOST_PYTHON3_SSL
-	select BR2_PACKAGE_PROTOBUF
-	select BR2_PACKAGE_PROTOBUF_C
-	select BR2_PACKAGE_LIBAIO
-	select BR2_PACKAGE_LIBBSD
-	select BR2_PACKAGE_LIBCAP
-	select BR2_PACKAGE_LIBNET
-	select BR2_PACKAGE_LIBNL
-	select BR2_PACKAGE_PYTHON3
-	help
-	  Checkpoint/Restore In Userspace (CRIU), is a software
-	  tool for the Linux operating system to make it possible
-	  to freeze a running application and checkpoint it to
-	  persistent storage as a collection of files.
-
-	  https://criu.org/Main_Page
-
-comment "criu needs a glibc or musl toolchain w/ threads, host gcc >= 7, gcc >= 8, headers >= 4.18, C++, dynamic library, wchar"
-	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 \
-		|| BR2_TOOLCHAIN_USES_UCLIBC || !BR2_INSTALL_LIBSTDCPP \
-		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| !BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/criu/criu.hash b/package/criu/criu.hash
deleted file mode 100644
index c3fcdbc03f..0000000000
--- a/package/criu/criu.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  990cdd147cb670a5d5d14216c2b5c2fc2b9a53ef19396569a6413807ba2a6aa2  criu-3.19.tar.gz
-sha256  568a1fa9d90e18a1a1a61ea58ec2eece16b56a5042cc72c1b4f8d4455ae6fcb7  COPYING
diff --git a/package/criu/criu.mk b/package/criu/criu.mk
deleted file mode 100644
index 3b72a1131e..0000000000
--- a/package/criu/criu.mk
+++ /dev/null
@@ -1,77 +0,0 @@
-################################################################################
-#
-# CRIU
-#
-################################################################################
-
-CRIU_VERSION = 3.19
-CRIU_SITE = $(call github,checkpoint-restore,criu,v$(CRIU_VERSION))
-
-CRIU_LICENSE = GPL-2.0, LGPL-2.1 (for lib/), MIT (for images/)
-CRIU_LICENSE_FILES = COPYING images/LICENSE
-
-CRIU_DEPENDENCIES =\
-	host-pkgconf \
-	host-protobuf-c \
-	host-python3 \
-	host-python-pip \
-	libaio \
-	libbsd \
-	libcap \
-	libnet \
-	libnl \
-	protobuf \
-	protobuf-c \
-	python3
-
-CRIU_MAKE_ENV =\
-	$(TARGET_MAKE_ENV) \
-	$(TARGET_CONFIGURE_OPTS) \
-	CROSS_COMPILE=$(TARGET_CROSS) \
-	WERROR=0
-
-# Remap to match the used in criu.
-ifeq ($(BR2_NORMALIZED_ARCH),"x86_64")
-CRIU_MAKE_ENV += ARCH=x86
-else ifeq ($(BR2_NORMALIZED_ARCH),"powerpc")
-CRIU_MAKE_ENV += ARCH=ppc64
-else ifeq ($(BR2_NORMALIZED_ARCH),"arm64")
-CRIU_MAKE_ENV += ARCH=aarch64
-else
-CRIU_MAKE_ENV += ARCH=$(BR2_NORMALIZED_ARCH)
-endif
-
-ifeq ($(BR2_ARM_CPU_ARMV6),y)
-CRIU_MAKE_ENV += SUBARCH=armv6
-else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
-CRIU_MAKE_ENV += SUBARCH=armv7
-else ifeq ($(BR2_ARM_CPU_ARMV7M),y)
-CRIU_MAKE_ENV += SUBARCH=armv7
-else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
-CRIU_MAKE_ENV += SUBARCH=armv8
-endif
-
-# Criu needs Kernel Checkpoint/restore support which is not enabled
-# by default.
-define CRIU_LINUX_CONFIG_FIXUPS
-	$(call KCONFIG_ENABLE_OPT,CONFIG_CHECKPOINT_RESTORE)
-endef
-
-define CRIU_BUILD_CMDS
-	rm -rf $(@D)/images/google/protobuf/descriptor.proto
-	cp -a  $(STAGING_DIR)/usr/include/google/protobuf/descriptor.proto \
-		$(@D)/images/google/protobuf/descriptor.proto
-	$(CRIU_MAKE_ENV) $(MAKE) -C $(@D) \
-		PREFIX=/usr
-endef
-
-define CRIU_INSTALL_TARGET_CMDS
-	$(CRIU_MAKE_ENV) $(MAKE) -C $(@D) \
-		PREFIX=/usr \
-		DESTDIR=$(TARGET_DIR) \
-		install-criu \
-		install-lib \
-		install-compel
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
