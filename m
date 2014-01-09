From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 9 Jan 2014 11:57:32 +0000
Subject: [Buildroot] [PATCH 1/2] sdl: rename patches to add sequence numbers
Message-ID: <1389268653-45909-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../sdl/sdl-0001-use-correct-directfb-config.patch |   40 ++++++++++++++++++++
 package/sdl/sdl-use-correct-directfb-config.patch  |   40 --------------------
 2 files changed, 40 insertions(+), 40 deletions(-)
 create mode 100644 package/sdl/sdl-0001-use-correct-directfb-config.patch
 delete mode 100644 package/sdl/sdl-use-correct-directfb-config.patch

diff --git a/package/sdl/sdl-0001-use-correct-directfb-config.patch b/package/sdl/sdl-0001-use-correct-directfb-config.patch
new file mode 100644
index 0000000..2250790
--- /dev/null
+++ b/package/sdl/sdl-0001-use-correct-directfb-config.patch
@@ -0,0 +1,40 @@
+[PATCH] configure.in: use correct directfb-config in version check
+
+The configure script has just checked for the correct directfb-config
+script, so also use it for the version check instead of whatever
+might be in the path.
+
+Also patch the generated configure, as it doesn't cleanly autoreconf.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ configure    |    2 +-
+ configure.in |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: SDL-1.2.15/configure.in
+===================================================================
+--- SDL-1.2.15.orig/configure.in
++++ SDL-1.2.15/configure.in
+@@ -1276,7 +1276,7 @@
+         else
+             set -- `echo $DIRECTFB_REQUIRED_VERSION | sed 's/\./ /g'`
+             NEED_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
+-            set -- `directfb-config --version | sed 's/\./ /g'`
++            set -- `$DIRECTFBCONFIG --version | sed 's/\./ /g'`
+             HAVE_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
+             if test $HAVE_VERSION -ge $NEED_VERSION; then
+                 DIRECTFB_CFLAGS=`$DIRECTFBCONFIG --cflags`
+Index: SDL-1.2.15/configure
+===================================================================
+--- SDL-1.2.15.orig/configure
++++ SDL-1.2.15/configure
+@@ -24958,7 +24958,7 @@
+         else
+             set -- `echo $DIRECTFB_REQUIRED_VERSION | sed 's/\./ /g'`
+             NEED_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
+-            set -- `directfb-config --version | sed 's/\./ /g'`
++            set -- `$DIRECTFBCONFIG --version | sed 's/\./ /g'`
+             HAVE_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
+             if test $HAVE_VERSION -ge $NEED_VERSION; then
+                 DIRECTFB_CFLAGS=`$DIRECTFBCONFIG --cflags`
diff --git a/package/sdl/sdl-use-correct-directfb-config.patch b/package/sdl/sdl-use-correct-directfb-config.patch
deleted file mode 100644
index 2250790..0000000
--- a/package/sdl/sdl-use-correct-directfb-config.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-[PATCH] configure.in: use correct directfb-config in version check
-
-The configure script has just checked for the correct directfb-config
-script, so also use it for the version check instead of whatever
-might be in the path.
-
-Also patch the generated configure, as it doesn't cleanly autoreconf.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- configure    |    2 +-
- configure.in |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: SDL-1.2.15/configure.in
-===================================================================
---- SDL-1.2.15.orig/configure.in
-+++ SDL-1.2.15/configure.in
-@@ -1276,7 +1276,7 @@
-         else
-             set -- `echo $DIRECTFB_REQUIRED_VERSION | sed 's/\./ /g'`
-             NEED_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
--            set -- `directfb-config --version | sed 's/\./ /g'`
-+            set -- `$DIRECTFBCONFIG --version | sed 's/\./ /g'`
-             HAVE_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
-             if test $HAVE_VERSION -ge $NEED_VERSION; then
-                 DIRECTFB_CFLAGS=`$DIRECTFBCONFIG --cflags`
-Index: SDL-1.2.15/configure
-===================================================================
---- SDL-1.2.15.orig/configure
-+++ SDL-1.2.15/configure
-@@ -24958,7 +24958,7 @@
-         else
-             set -- `echo $DIRECTFB_REQUIRED_VERSION | sed 's/\./ /g'`
-             NEED_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
--            set -- `directfb-config --version | sed 's/\./ /g'`
-+            set -- `$DIRECTFBCONFIG --version | sed 's/\./ /g'`
-             HAVE_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
-             if test $HAVE_VERSION -ge $NEED_VERSION; then
-                 DIRECTFB_CFLAGS=`$DIRECTFBCONFIG --cflags`
-- 
1.7.1
