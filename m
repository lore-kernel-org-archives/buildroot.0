From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 15:58:21 +0100
Subject: [Buildroot] [git commit] python: add patch to make ossaudiodev
	module optional
Message-ID: <20150110153345.3AC1E80159@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ad8036ef2a07884ceef6ca13f2fc13194916ee0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This module causes some build failures in certain setups and is not
very useful.

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/115-optional-ossaudiodev.patch |   30 +++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/python/115-optional-ossaudiodev.patch b/package/python/115-optional-ossaudiodev.patch
new file mode 100644
index 0000000..de82036
--- /dev/null
+++ b/package/python/115-optional-ossaudiodev.patch
@@ -0,0 +1,30 @@
+From 30351d9b41a03c43d627d52d46e49ab91bfe342d Mon Sep 17 00:00:00 2001
+From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+Date: Thu, 8 Jan 2015 11:41:40 +0100
+Subject: [PATCH 1/1] Add an option to disable the ossaudiodev module
+
+Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+---
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index e8cb52a..579e05b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2717,6 +2717,12 @@ if test "$CURSES" = "no"; then
+    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
+ fi
+ 
++AC_ARG_ENABLE(ossaudiodev,
++       AS_HELP_STRING([--disable-ossaudiodev], [disable OSSAUDIODEV]),
++       [ if test "$enableval" = "no"; then
++            DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ossaudiodev"
++         fi])
++
+ AC_SUBST(PYDOC)
+ 
+ AC_ARG_ENABLE(pydoc,
+-- 
+2.1.0
+
