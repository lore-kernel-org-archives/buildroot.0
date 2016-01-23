From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 23 Jan 2016 11:52:22 +0100
Subject: [Buildroot] [PATCH 2/2] package/lttng-tools: needs dynamic library
	support
In-Reply-To: <1453546342-14457-1-git-send-email-s.martin49@gmail.com>
References: <1453546342-14457-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1453546342-14457-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/b48bc7ad4bede4d16c079da0ae1121e6796a0e8d/
  http://autobuild.buildroot.net/results/25dcb19c3dd32e50990f9b45053d71ea18746a80/
  http://autobuild.buildroot.net/results/a3f93498811491d37ba13d024e33e68a8bc7ba18/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/lttng-tools/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 7808ba3..b758d32 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # uses dlfcn
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_POPT
@@ -29,9 +30,9 @@ config BR2_PACKAGE_LTTNG_TOOLS
 
 	  http://lttng.org
 
-comment "lttng-tools needs a toolchain w/ threads, wchar"
+comment "lttng-tools needs a toolchain w/ threads, wchar, dynamic library"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # lttng-tools/gcc-4.{7,8}.x bug
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 
-- 
2.7.0
