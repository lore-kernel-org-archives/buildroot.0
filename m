From: George Redivo <george.redivo@datacom.ind.br>
Date: Mon, 22 Jun 2015 14:58:59 -0300
Subject: [Buildroot] [PATCH 1/1] protobuf: bump version to 2.6.1
Message-ID: <1434995939-8236-1-git-send-email-george.redivo@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Adds powerpc architecture support

Signed-off-by: George Redivo <george.redivo@datacom.ind.br>
---
 package/protobuf/Config.in   | 5 ++---
 package/protobuf/protobuf.mk | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index bbb927f..d112d4e 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_PROTOBUF
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# See src/google/protobuf/stubs/platform_macros.h for supported archs.
-	# PowerPC doesn't actually work.
-	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 || BR2_powerpc
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	help
@@ -15,5 +14,5 @@ config BR2_PACKAGE_PROTOBUF
 
 comment "protobuf needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 || BR2_powerpc
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 0426fce..144e5fb 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOBUF_VERSION = v2.5.0
+PROTOBUF_VERSION = v2.6.1
 PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
 PROTOBUF_LICENSE = BSD-3c
 PROTOBUF_LICENSE_FILES = COPYING.txt
-- 
1.9.1
