From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  1 Oct 2014 13:32:26 -0500
Subject: [Buildroot] [PATCH 1/1] protobuf: add powerpc architecture support
Message-ID: <1412188346-16127-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---

We have been using this package on a powerpc e500mc platform since
the 2014.02 release without issue.  I've confirmed enabling powerpc
works and I'm curious if additional depends are needed for the case
where it had been proven not to work?

 package/protobuf/Config.in |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 6015b13..0d7472b 100644
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
-- 
1.7.9.5
