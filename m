From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Oct 2014 22:54:37 +0200
Subject: [Buildroot] [git commit] protobuf: bump version to 2.6.0
Message-ID: <20141002205533.3EADC9D7E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b6304af9d69d44ee3040c00b0670f19c02de7d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Adds powerpc architecture support
* Changes to the new github upstream site
* Updates the license filename

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf/Config.in   |    7 +++----
 package/protobuf/protobuf.mk |    4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

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
index f5e11df..c8f5d63 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROTOBUF_VERSION = 2.5.0
-PROTOBUF_SITE = http://protobuf.googlecode.com/files
+PROTOBUF_VERSION = 2.6.0
+PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)/
 PROTOBUF_LICENSE = BSD-3c
 PROTOBUF_LICENSE_FILES = COPYING.txt
 
