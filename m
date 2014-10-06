From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 09:22:54 +0200
Subject: [Buildroot] [git commit] Revert "protobuf: bump version to 2.6.0"
Message-ID: <20141006072404.7862FB0B6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61ae22810a8ca90d3b904d89eb3892c6cf92e87c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 7b6304af9d69d44ee3040c00b0670f19c02de7d2, since it
causing too many build failures, with python-protobuf and
host-protobuf-c.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/protobuf/Config.in   |    7 ++++---
 package/protobuf/protobuf.mk |    4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index e45ed14..6015b13 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -3,16 +3,17 @@ config BR2_PACKAGE_PROTOBUF
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# See src/google/protobuf/stubs/platform_macros.h for supported archs.
-	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 || BR2_powerpc
+	# PowerPC doesn't actually work.
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	help
 	  Protocol buffers are Google's language-neutral, platform-neutral,
 	  extensible mechanism for serializing structured data.
 
-	  https://github.com/google/protobuf/
+	  http://code.google.com/p/protobuf/
 
 comment "protobuf needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 || BR2_powerpc
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 7a621b8..9043f98 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROTOBUF_VERSION = 2.6.0
-PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)/
+PROTOBUF_VERSION = 2.5.0
+PROTOBUF_SITE = http://protobuf.googlecode.com/files
 PROTOBUF_LICENSE = BSD-3c
 PROTOBUF_LICENSE_FILES = COPYING.txt
 
