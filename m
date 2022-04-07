Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17341C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 18:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACD716128C;
	Thu,  7 Apr 2022 18:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 838lijrwqvZ7; Thu,  7 Apr 2022 18:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BDA0612AC;
	Thu,  7 Apr 2022 18:30:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 921DD1BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 18:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EA61401C9
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 18:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fwjkZcQ_e2QT for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 18:30:49 +0000 (UTC)
X-Greylist: delayed 00:06:00 by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63E1B400D0
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 18:30:49 +0000 (UTC)
Received: from pwmachine.home (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id E253120B9CF0;
 Thu,  7 Apr 2022 11:24:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E253120B9CF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1649355892;
 bh=G2v2RgJFJRlpxEM6u4y7M+6REx+PgwkCKZcUzxzjRdE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dI0zHWe12aColcUJLS0fw9rlj5Db0cuK5NnDXP7vEhKrxCMNwcK052x+ZjdJ+LJ2i
 nmHxVXvWaT3xz4DRnJUElipJuhCvRw+KCxLOkBdkY40185gjLbrzBdLSlM8xIYHBwc
 8djAocdphP8sj4v+i53zUrJynbaRYS3LyfF6CRxA=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Thu,  7 Apr 2022 19:24:24 +0100
Message-Id: <20220407182425.194001-2-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407182425.194001-1-flaniel@linux.microsoft.com>
References: <20220407182425.194001-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v1 1/2] tbb: new package
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 bradford barr <bradford@density.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: bradford barr <bradford@density.io>

Intel Threading Building Blocks (TBB), is a C++ library to help developers
write highly parallelized applications. OpenCV uses it to accelerate some of
it's more heavy weight procedures.

Signed-off-by: bradford barr <bradford@density.io>
Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-tbb-Enable-cross-compilation.patch   | 55 +++++++++++++++++++
 package/tbb/Config.in                         | 16 ++++++
 package/tbb/tbb.hash                          |  2 +
 package/tbb/tbb.mk                            | 39 +++++++++++++
 6 files changed, 114 insertions(+)
 create mode 100644 package/tbb/0001-tbb-Enable-cross-compilation.patch
 create mode 100644 package/tbb/Config.in
 create mode 100644 package/tbb/tbb.hash
 create mode 100644 package/tbb/tbb.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a66b9d7eee..ef4ddcab50 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -970,6 +970,7 @@ F:	package/odhcploc/
 
 N:	Francis Laniel <flaniel@linux.microsoft.com>
 F:	package/pahole/
+F:	package/tbb/
 
 N:	Francisco Gonzalez <gzmorell@gmail.com>
 F:	package/ser2net/
diff --git a/package/Config.in b/package/Config.in
index 0d5d763180..24f7af5ea8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2044,6 +2044,7 @@ endif
 	source "package/skalibs/Config.in"
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
+	source "package/tbb/Config.in"
 	source "package/tinycbor/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
diff --git a/package/tbb/0001-tbb-Enable-cross-compilation.patch b/package/tbb/0001-tbb-Enable-cross-compilation.patch
new file mode 100644
index 0000000000..652d59c47b
--- /dev/null
+++ b/package/tbb/0001-tbb-Enable-cross-compilation.patch
@@ -0,0 +1,55 @@
+From 42c3faff14917f687aab405d8f571e352ffdf3f5 Mon Sep 17 00:00:00 2001
+From: Francis Laniel <flaniel@linux.microsoft.com>
+Date: Wed, 6 Apr 2022 15:58:02 +0100
+Subject: [PATCH] tbb: Enable cross-compilation.
+
+This patch replaces hardcoded value for CPLUS and CONLY with $(CXX) and $(CC).
+So, by defining CC= it is possible to cross compile this library using a
+cross-compiler.
+
+This patch was originally written by:
+Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+and taken from:
+https://github.com/intel/luv-yocto/blob/3b0688bc9a5e8d52b6ca461b15fb4abd3eaaf7a8/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
+
+Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
+---
+ build/linux.clang.inc | 5 +++--
+ build/linux.gcc.inc   | 5 +++--
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/build/linux.clang.inc b/build/linux.clang.inc
+index 5a459ef5..a0777db5 100644
+--- a/build/linux.clang.inc
++++ b/build/linux.clang.inc
+@@ -31,8 +31,9 @@ DYLIB_KEY = -shared
+ EXPORT_KEY = -Wl,--version-script,
+ LIBDL = -ldl
+ 
+-CPLUS = clang++
+-CONLY = clang
++CPLUS = $(CXX)
++CONLY = $(CC)
++CPLUS_FLAGS = $(CXXFLAGS)
+ LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
+ LIBS += -lpthread -lrt
+ LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
+diff --git a/build/linux.gcc.inc b/build/linux.gcc.inc
+index 786c4153..30242a82 100644
+--- a/build/linux.gcc.inc
++++ b/build/linux.gcc.inc
+@@ -32,8 +32,9 @@ DYLIB_KEY = -shared
+ EXPORT_KEY = -Wl,--version-script,
+ LIBDL = -ldl
+ 
+-CPLUS = g++
+-CONLY = gcc
++CPLUS = $(CXX)
++CONLY = $(CC)
++CPLUS_FLAGS = $(CXXFLAGS)
+ LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
+ LIBS += -lpthread -lrt
+ LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
+-- 
+2.25.1
+
diff --git a/package/tbb/Config.in b/package/tbb/Config.in
new file mode 100644
index 0000000000..0f40b74d31
--- /dev/null
+++ b/package/tbb/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_TBB
+	bool "tbb"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Intel(R) Threading Building Blocks (Intel(R) TBB) lets you
+	  easily write parallel C++ programs that take full advantage
+	  of multicore performance, that are portable, composable and
+	  have future-proof scalability.
+
+	  https://www.threadingbuildingblocks.org/
+
+comment "tbb needs a glibc toolchain w/ dynamic library, threads, C++"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
new file mode 100644
index 0000000000..e9fb7511b8
--- /dev/null
+++ b/package/tbb/tbb.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b8dbab5aea2b70cf07844f86fa413e549e099aa3205b6a04059ca92ead93a372  tbb-2018_U5.tar.gz
diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
new file mode 100644
index 0000000000..cf06579b98
--- /dev/null
+++ b/package/tbb/tbb.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# tbb
+#
+################################################################################
+
+TBB_VERSION = 2018_U5
+TBB_SITE = $(call github,01org,tbb,$(TBB_VERSION))
+TBB_INSTALL_STAGING = YES
+TBB_LICENSE = Apache-2.0
+TBB_LICENSE_FILES = LICENSE
+
+TBB_SO_VERSION = 2
+TBB_LIBS = libtbb libtbbmalloc libtbbmalloc_proxy
+TBB_BIN_PATH = $(@D)/build/linux_*
+
+define TBB_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) arch=$(BR2_ARCH) -C $(@D)
+endef
+
+define TBB_INSTALL_LIBS
+	$(foreach lib,$(TBB_LIBS),
+		$(INSTALL) -D -m 0755 $(TBB_BIN_PATH)/$(lib).so.$(TBB_SO_VERSION) \
+			$(1)/usr/lib/$(lib).so.$(TBB_SO_VERSION) ;
+		ln -sf $(lib).so.$(TBB_SO_VERSION) $(1)/usr/lib/$(lib).so
+	)
+endef
+
+define TBB_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/
+	cp -a $(@D)/include/* $(STAGING_DIR)/usr/include/
+	$(call TBB_INSTALL_LIBS,$(STAGING_DIR))
+endef
+
+define TBB_INSTALL_TARGET_CMDS
+	$(call TBB_INSTALL_LIBS,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
