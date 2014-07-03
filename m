From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Jul 2014 23:36:42 +0200
Subject: [Buildroot] [git commit] dbus-python: bump to version 1.2.0
Message-ID: <20140703213741.DD4D09D14E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94423c82518aba5dbe9bfa25200822f82ecfd670
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...us-python-0001-fix-python-configure-check.patch |   27 ++++++++++++++++++
 .../dbus-python-fix-python-configure-check.patch   |   30 --------------------
 package/dbus-python/dbus-python.mk                 |    2 +-
 3 files changed, 28 insertions(+), 31 deletions(-)

diff --git a/package/dbus-python/dbus-python-0001-fix-python-configure-check.patch b/package/dbus-python/dbus-python-0001-fix-python-configure-check.patch
new file mode 100644
index 0000000..2df4da8
--- /dev/null
+++ b/package/dbus-python/dbus-python-0001-fix-python-configure-check.patch
@@ -0,0 +1,27 @@
+Python: add am_cv_python_includes to override runtime python-config check
+[Gustavo: update for dbus-python 1.2.0]
+
+diff -Nura dbus-python-1.2.0.orig/configure dbus-python-1.2.0/configure
+--- dbus-python-1.2.0.orig/configure	2013-05-08 04:48:42.000000000 -0300
++++ dbus-python-1.2.0/configure	2014-07-03 16:54:25.922727033 -0300
+@@ -11762,6 +11762,12 @@
+ else
+     { $as_echo "$as_me:${as_lineno-$LINENO}: checking for Python headers using $PYTHON-config --includes" >&5
+ $as_echo_n "checking for Python headers using $PYTHON-config --includes... " >&6; }
++if test "${am_cv_python_includes+set}" = set; then
++  $as_echo_n "(cached) $ECHO_C" >&6
++  PYTHON_INCLUDES=${am_cv_python_includes}
++  { $as_echo "$as_me:$LINENO: result: $PYTHON_INCLUDES" >&5
++$as_echo_t "${ECHO_T}$PYTHON_INCLUDES" >&6; }
++else
+   PYTHON_INCLUDES=`$PYTHON-config --includes`
+   if test $? = 0; then
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $PYTHON_INCLUDES" >&5
+@@ -11781,6 +11787,7 @@
+ $as_echo "$PYTHON_INCLUDES" >&6; }
+   fi
+ fi
++fi
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether those headers are sufficient" >&5
+ $as_echo_n "checking whether those headers are sufficient... " >&6; }
diff --git a/package/dbus-python/dbus-python-fix-python-configure-check.patch b/package/dbus-python/dbus-python-fix-python-configure-check.patch
deleted file mode 100644
index 30eeb48..0000000
--- a/package/dbus-python/dbus-python-fix-python-configure-check.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Python: add am_cv_python_includes to override runtime python-config check
----
- configure |    7 +++++++
- 1 file changed, 7 insertions(+)
-
-Index: dbus-python-0.83.0/configure
-===================================================================
---- dbus-python-0.83.0.orig/configure
-+++ dbus-python-0.83.0/configure
-@@ -10176,6 +10176,12 @@
- 
- { echo "$as_me:$LINENO: checking for Python headers using $PYTHON-config --includes" >&5
- echo $ECHO_N "checking for Python headers using $PYTHON-config --includes... $ECHO_C" >&6; }
-+if test "${am_cv_python_includes+set}" = set; then
-+  echo $ECHO_N "(cached) $ECHO_C" >&6
-+  PYTHON_INCLUDES=${am_cv_python_includes}
-+  { echo "$as_me:$LINENO: result: $PYTHON_INCLUDES" >&5
-+echo "${ECHO_T}$PYTHON_INCLUDES" >&6; }
-+else
- PYTHON_INCLUDES=`$PYTHON-config --includes`
- if test $? = 0; then
-   { echo "$as_me:$LINENO: result: $PYTHON_INCLUDES" >&5
-@@ -10194,6 +10200,7 @@
-   { echo "$as_me:$LINENO: result: $PYTHON_INCLUDES" >&5
- echo "${ECHO_T}$PYTHON_INCLUDES" >&6; }
- fi
-+fi
- 
- { echo "$as_me:$LINENO: checking whether those headers are sufficient" >&5
- echo $ECHO_N "checking whether those headers are sufficient... $ECHO_C" >&6; }
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 4dd3d8c..930eb2c 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_PYTHON_VERSION = 0.83.0
+DBUS_PYTHON_VERSION = 1.2.0
 DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python/
 DBUS_PYTHON_INSTALL_STAGING = YES
 DBUS_PYTHON_LICENSE = MIT
