From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Nov 2014 20:42:45 -0300
Subject: [Buildroot] [PATCH 2/2] bmon: uclinux is also linux
In-Reply-To: <1415749365-10946-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415749365-10946-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1415749365-10946-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/4d0/4d0c3c8b68b37f532378f19041379cb5c5798950/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../bmon/0001-build-uclinux-is-also-linux.patch    | 25 ++++++++++++++++++++++
 package/bmon/bmon.mk                               |  2 ++
 2 files changed, 27 insertions(+)
 create mode 100644 package/bmon/0001-build-uclinux-is-also-linux.patch

diff --git a/package/bmon/0001-build-uclinux-is-also-linux.patch b/package/bmon/0001-build-uclinux-is-also-linux.patch
new file mode 100644
index 0000000..18f517e
--- /dev/null
+++ b/package/bmon/0001-build-uclinux-is-also-linux.patch
@@ -0,0 +1,25 @@
+From adcf320db5cc2844209d001f9484b0ff0cab4e0b Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 11 Nov 2014 20:22:37 -0300
+Subject: [PATCH] build: uclinux is also linux
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: pull request in github
+
+diff --git a/configure.ac b/configure.ac
+index 3059e52..10388fd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,7 +70,7 @@ fi
+ PKG_CHECK_MODULES([CONFUSE], [libconfuse], [], AC_MSG_ERROR([requires libconfuse]))
+ 
+ case ${target_os} in
+-    linux*)
++    linux*|uclinux*)
+         PKG_CHECK_MODULES([LIBNL], [libnl-3.0], [], AC_MSG_ERROR([requires libnl3-dev]))
+         PKG_CHECK_MODULES([LIBNL_ROUTE], [libnl-route-3.0], [], AC_MSG_ERROR([requires libnl3-route]))
+     ;;
+-- 
+2.0.4
+
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index d440156..99f074b 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -9,6 +9,8 @@ BMON_SITE = https://github.com/tgraf/bmon/releases/download/v$(BMON_VERSION)/
 BMON_DEPENDENCIES = host-pkgconf libconfuse libnl ncurses
 BMON_LICENSE = BSD-2c
 BMON_LICENSE_FILES = LICENSE
+# For 0001-build-uclinux-is-also-linux.patch
+BMON_AUTORECONF = YES
 
 # link dynamically unless explicitly requested otherwise
 ifeq ($(BR2_PREFER_STATIC_LIB),)
-- 
2.0.4
