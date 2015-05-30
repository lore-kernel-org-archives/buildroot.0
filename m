From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 May 2015 13:36:18 +0200
Subject: [Buildroot] [PATCH] package/lttng-libust: needs shared libraries
Message-ID: <1432985778-32345-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/e89/e8974516173ea74c830b71e400fcbafdd69dea60/
    http://autobuild.buildroot.org/results/cac/cac7015c3be7e34dbeaa6accb59aebebe68eb6d2/
    http://autobuild.buildroot.org/results/4ce/4ce0a35316cd25536b58b50f096b6f75f6e3c1c9/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/lttng-libust/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 7c30d78..9eb2966 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	help
 	  Userspace tracing library for the LTTng 2.x tracing
 	  infrastructure. It allows userspace programs to create
@@ -16,9 +17,10 @@ config BR2_PACKAGE_LTTNG_LIBUST
 
 	  http://lttng.org
 
-comment "lttng-libust needs a toolchain w/ wchar, threads"
+comment "lttng-libust needs a toolchain w/ wchar, threadsi, dynamic library"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 
 comment "lttng-libust needs a toolchain not affected by GCC bug 58854"
-- 
1.9.1
