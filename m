From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  1 Oct 2014 20:52:37 -0500
Subject: [Buildroot] [PATCH 1/1] protobuf: bump version to 2.6.0
Message-ID: <1412214757-3948-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Adds powerpc architecture support
* Changes to the new github upstream site
* Updates the license filename

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/protobuf/Config.in   |    7 +++----
 package/protobuf/protobuf.mk |    6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 6015b13..e45ed14 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -3,17 +3,16 @@ config BR2_PACKAGE_PROTOBUF
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# See src/google/protobuf/stubs/platform_macros.h for supported archs.
-	# PowerPC doesn't actually work.
-	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 || BR2_powerpc
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	help
 	  Protocol buffers are Google's language-neutral, platform-neutral,
 	  extensible mechanism for serializing structured data.
 
-	  http://code.google.com/p/protobuf/
+	  https://github.com/google/protobuf/
 
 comment "protobuf needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 || BR2_powerpc
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index f5e11df..761b315 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PROTOBUF_VERSION = 2.5.0
-PROTOBUF_SITE = http://protobuf.googlecode.com/files
+PROTOBUF_VERSION = 2.6.0
+PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)/
 PROTOBUF_LICENSE = BSD-3c
-PROTOBUF_LICENSE_FILES = COPYING.txt
+PROTOBUF_LICENSE_FILES = LICENSE
 
 # N.B. Need to use host protoc during cross compilation.
 PROTOBUF_DEPENDENCIES = host-protobuf
-- 
1.7.9.5
