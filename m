From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 29 May 2015 08:09:38 +0300
Subject: [Buildroot] [PATCH] lttng-libust: requires dynamic library support
Message-ID: <2e9483dffc8aec167b27aa9f41b680b9f964c5c2.1432876178.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e89/e8974516173ea74c830b71e400fcbafdd69dea60/
http://autobuild.buildroot.net/results/cac/cac7015c3be7e34dbeaa6accb59aebebe68eb6d2/
http://autobuild.buildroot.net/results/4ce/4ce0a35316cd25536b58b50f096b6f75f6e3c1c9/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lttng-libust/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 7c30d7846d9a..1c26843e21f6 100644
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
@@ -16,9 +17,9 @@ config BR2_PACKAGE_LTTNG_LIBUST
 
 	  http://lttng.org
 
-comment "lttng-libust needs a toolchain w/ wchar, threads"
+comment "lttng-libust needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 
 comment "lttng-libust needs a toolchain not affected by GCC bug 58854"
-- 
2.1.4
