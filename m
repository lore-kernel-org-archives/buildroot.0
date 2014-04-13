From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Apr 2014 21:58:58 +0200
Subject: [Buildroot] [PATCH 4/4] lttng-tools: mark as affected by gcc bug
	58595
In-Reply-To: <1397419138-8776-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1397419138-8776-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1397419138-8776-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/6a6/6a66a389035939af542e172dbe2027ffa671e28a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-tools/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index f0d45d9..cde9baf 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	# liburcu only works on some architectures and requires thread support
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # lttng-tools/gcc-4.{7,8}.x bug
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
@@ -32,7 +33,8 @@ comment "lttng-tools needs a toolchain w/ largefile, threads, wchar"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # lttng-tools/gcc-4.{7,8}.x bug
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 
-comment "lttng-tools needs a toolchain not affected by GCC bug 58854"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854
+comment "lttng-tools needs a toolchain not affected by GCC bug 58854 and 58595"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854 || BR2_TOOLCHAIN_HAS_GCC_BUG_58595
-- 
1.8.3.2
