From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 26 Sep 2011 14:47:06 +0300
Subject: [Buildroot] [PATCH 1/2] valgrind: fix build on Linux kernel 3.x
Message-ID: <a0e42495d61b96627650851ccde32672b8cedc7d.1317037531.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../valgrind-3.6.1-configure-support-linux-3.patch |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/valgrind/valgrind-3.6.1-configure-support-linux-3.patch

diff --git a/package/valgrind/valgrind-3.6.1-configure-support-linux-3.patch b/package/valgrind/valgrind-3.6.1-configure-support-linux-3.patch
new file mode 100644
index 0000000..a3b2482
--- /dev/null
+++ b/package/valgrind/valgrind-3.6.1-configure-support-linux-3.patch
@@ -0,0 +1,30 @@
+Add support for kernel 3.x. From upstream r11796 (via Debian).
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+
+Index: valgrind-3.6.1/configure.in
+===================================================================
+--- valgrind-3.6.1.orig/configure.in	2011-02-15 18:31:17.000000000 +0100
++++ valgrind-3.6.1/configure.in	2011-07-08 22:36:36.051563848 +0200
+@@ -220,7 +220,7 @@
+         kernel=`uname -r`
+ 
+         case "${kernel}" in
+-             2.6.*) 
++             2.6.*|3.*) 
+         	    AC_MSG_RESULT([2.6 family (${kernel})])
+         	    AC_DEFINE([KERNEL_2_6], 1, [Define to 1 if you're using Linux 2.6.x])
+         	    ;;
+Index: valgrind-3.6.1/configure
+===================================================================
+--- valgrind-3.6.1.orig/configure	2011-07-08 22:37:18.911240743 +0200
++++ valgrind-3.6.1/configure	2011-07-08 22:37:44.847045178 +0200
+@@ -5348,7 +5348,7 @@
+         kernel=`uname -r`
+ 
+         case "${kernel}" in
+-             2.6.*)
++             2.6.*|3.*)
+         	    { $as_echo "$as_me:${as_lineno-$LINENO}: result: 2.6 family (${kernel})" >&5
+ $as_echo "2.6 family (${kernel})" >&6; }
+ 
-- 
1.7.6.3
