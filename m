Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC93C982C0
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 20:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFFDB84ADE;
	Fri, 16 Jan 2026 20:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjvvs2eBTJXx; Fri, 16 Jan 2026 20:57:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E5C884AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768597079;
	bh=Cs5EuqCP4VreQQFwHlAcDLgJmPt8vMpqHp0usCvkEbI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NglaxTfKNPBHh7SjjrNG/TH2aGiIDNM37wkyoPb1rmWcEtRmd0rUfvHVY3APh4ERS
	 5KW1WrYclZ65KES+7A9SxPv1eEHuTN8DdwZq4lQMIu4Tw6TOBrOVW0m7brPDmZezxb
	 +K2CKdfgM21jV97VCPCft7W5ie2Ld2xUegwJqu6lFj+MBvII1ih6gzCl6Qpg86WZbK
	 fO60QDoyybx0z1htrSymnCm182jRDgbbayAr0mobrJy0/DaY8uKChZc+zKzpROsJLI
	 JHbYZTetN1QiMmAD1CFy9TN4b2y+/fydjXi1YyW2Ph40kSUgQZ7tgZ2bN5FuruOei8
	 tRL/PjTbsf9yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E5C884AD1;
	Fri, 16 Jan 2026 20:57:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59143223
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76924615A3
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqrGZ3x-Q5Lt for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 20:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27740615B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27740615B0
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:57:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 253E780242; Fri, 16 Jan 2026 20:57:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 21:55:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f9d8b6e54f51bb1b3cc8f8e659267e9f9e3540a
X-Git-Newrev: f6e0678ba8c95a17b5ca7bedb05a0950ab727c9a
X-Patchwork-Hint: ignore
Message-Id: <20260116205749.253E780242@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lockdev: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f6e0678ba8c95a17b5ca7bedb05a0950ab727c9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package was removed from Debian in 2016:
https://tracker.debian.org/news/738763/removed-103-16-from-unstable/
"Obsolete and replaced by flock"

and causes build errors with musl.

Fixes:
https://autobuild.buildroot.net/results/9fa/9fa9323bac3ee1720396bb34fefb3017125e5a85/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 Config.in.legacy                                   |  7 +++
 package/Config.in                                  |  1 -
 ...stall-static-library-and-headers-separate.patch | 44 ----------------
 package/lockdev/Config.in                          |  6 ---
 package/lockdev/lockdev.hash                       |  5 --
 package/lockdev/lockdev.mk                         | 58 ----------------------
 7 files changed, 7 insertions(+), 115 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a25452290b..570c2bc489 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -607,7 +607,6 @@ package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch lib_p
 package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch lib_patch.Upstream
 package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch lib_patch.Upstream
 package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch lib_patch.Upstream
-package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch lib_patch.Upstream
 package/lockfile-progs/0001-sus3v-legacy.patch lib_patch.Sob lib_patch.Upstream
 package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch lib_patch.Upstream
 package/ltrace/0001-arm-plt.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index a9ced52e37..4502963b24 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LOCKDEV
+	bool "lockdev removed"
+	select BR2_LEGACY
+	help
+	  lockdev was no longer maintained upstream, so it has been
+	  dropped.
+
 config BR2_PACKAGE_DBUS_TRIGGERD
 	bool "dbus-triggerd removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 58518a787d..6ce16bce0a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1699,7 +1699,6 @@ menu "Filesystem"
 	source "package/liblockfile/Config.in"
 	source "package/libnfs/Config.in"
 	source "package/libsysfs/Config.in"
-	source "package/lockdev/Config.in"
 	source "package/physfs/Config.in"
 endmenu
 
diff --git a/package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch b/package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch
deleted file mode 100644
index d5a498a19e..0000000000
--- a/package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 0dcd2368c3e23a5cc1cc4a979d9c241ed9302236 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sun, 4 Jan 2015 16:06:07 +0100
-Subject: [PATCH] Makefile: install static library and headers separately
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Makefile | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index e27dcbd..ecf52d1 100644
---- a/Makefile
-+++ b/Makefile
-@@ -45,12 +45,10 @@ perl-lib:	static
- 	cd LockDev && make OPTIMIZE="-O2 -g -Wall"
- 	cd LockDev && make test
- 
--.PHONY: install install_dev install_dbg install_doc install_run 
--install:	install_dev install_dbg install_doc install_run
-+.PHONY: install install_dev install_dbg install_doc install_run install_static
-+install:	install_dev install_dbg install_doc install_run install_static
- 
--install_dev:	${static} src/lockdev.h
--	install -m755 -d	${libdir}
--	install -m644 ${static}	${libdir}
-+install_dev:	src/lockdev.h
- 	install -m755 -d	${incdir}
- 	install -m644 src/lockdev.h	${incdir}
- 	install -m644 src/ttylock.h	${incdir}
-@@ -69,6 +67,10 @@ install_doc:	docs/lockdev.3
- 	install -m755 -d	${mandir}/man3
- 	install -m644 docs/lockdev.3	${mandir}/man3
- 
-+install_static:	${static}
-+	install -m755 -d	${libdir}
-+	install -m644 ${static}	${libdir}
-+
- install_run:	${shared}
- 	install -m755 -d	${libdir}
- 	install -m644 ${shared}	${libdir}
--- 
-1.9.3
-
diff --git a/package/lockdev/Config.in b/package/lockdev/Config.in
deleted file mode 100644
index 4b386f4ab0..0000000000
--- a/package/lockdev/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_LOCKDEV
-	bool "lockdev"
-	help
-	  Library for locking devices.
-
-	  No upstream site, primary site is Debian.
diff --git a/package/lockdev/lockdev.hash b/package/lockdev/lockdev.hash
deleted file mode 100644
index e32466dfe7..0000000000
--- a/package/lockdev/lockdev.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev/lockdev_1.0.3-1.6.dsc
-sha256  ccae635d7ac3fdd50897eceb250872b3d9a191d298f213e7f0c836910d869f82  lockdev_1.0.3.orig.tar.gz
-sha256  a5405c6ee5e97e45eeb1c81330a7e9f444a58bda5e6771fa30007516c115007e  lockdev_1.0.3-1.6.diff.gz
-# Locally calculated
-sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  LICENSE
diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
deleted file mode 100644
index e491b132d3..0000000000
--- a/package/lockdev/lockdev.mk
+++ /dev/null
@@ -1,58 +0,0 @@
-################################################################################
-#
-# lockdev
-#
-################################################################################
-
-LOCKDEV_VERSION_MAJOR = 1
-LOCKDEV_VERSION = $(LOCKDEV_VERSION_MAJOR).0.3
-LOCKDEV_SOURCE = lockdev_$(LOCKDEV_VERSION).orig.tar.gz
-LOCKDEV_PATCH = lockdev_$(LOCKDEV_VERSION)-1.6.diff.gz
-LOCKDEV_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev
-LOCKDEV_LICENSE = LGPL-2.1
-LOCKDEV_LICENSE_FILES = LICENSE
-LOCKDEV_INSTALL_STAGING = YES
-
-ifeq ($(BR2_STATIC_LIBS),y)
-LOCKDEV_BUILD_ARGS = static
-LOCKDEV_INSTALL_ARGS = install_static
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-LOCKDEV_BUILD_ARGS = static shared
-LOCKDEV_INSTALL_ARGS = install_run install_static
-else # BR2_SHARED_LIBS
-LOCKDEV_BUILD_ARGS = shared
-LOCKDEV_INSTALL_ARGS = install_run
-endif
-
-# Make the code believe we are using a C library compatible with
-# glibc, which for the purpose of lockdev is actually true.
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-LOCKDEV_BUILD_ARGS += CFLAGS="$(TARGET_CFLAGS) -D__GNU_LIBRARY__"
-endif
-
-ifeq ($(BR2_SHARED_STATIC_LIBS)$(BR2_SHARED_LIBS),y)
-define LOCKDEV_CREATE_LINKS_STAGING
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.$(LOCKDEV_VERSION_MAJOR)
-endef
-
-define LOCKDEV_CREATE_LINKS_TARGET
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.$(LOCKDEV_VERSION_MAJOR)
-endef
-endif
-
-define LOCKDEV_BUILD_CMDS
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(LOCKDEV_BUILD_ARGS)
-endef
-
-define LOCKDEV_INSTALL_STAGING_CMDS
-	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) $(LOCKDEV_INSTALL_ARGS) install_dev
-	$(LOCKDEV_CREATE_LINKS_STAGING)
-endef
-
-define LOCKDEV_INSTALL_TARGET_CMDS
-	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) $(LOCKDEV_INSTALL_ARGS)
-	$(LOCKDEV_CREATE_LINKS_TARGET)
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
