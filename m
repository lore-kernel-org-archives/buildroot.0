From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jan 2016 11:59:52 +0100
Subject: [Buildroot] [git commit] package/lttng-tools: reorder 'select' vs
	'depends on'
Message-ID: <20160123110007.2C1DE80836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9e879d5f0b1c2dd954a042d5918142af3c7b0ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Place 'depends on' statements before 'select' ones.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-tools/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 599095d..7808ba3 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -1,16 +1,16 @@
 config BR2_PACKAGE_LTTNG_TOOLS
 	bool "lttng-tools"
-	select BR2_PACKAGE_LIBURCU
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_POPT
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	# liburcu only works on some architectures and requires thread support
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # lttng-tools/gcc-4.{7,8}.x bug
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBURCU
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_POPT
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Userspace utilities for the LTTng 2.x tracing
 	  infrastructure.
