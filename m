From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 20 Dec 2012 01:43:44 +0200
Subject: [Buildroot] [PATCH 06/12] elfutils: new package
In-Reply-To: <1355960630-25089-1-git-send-email-stefan.froberg@petroprogram.com>
References: <y>
 <1355960630-25089-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1355960630-25089-6-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is an mismatch with gnulib gettext version and the
version of gettext that elfutils is using.
Disable using locale stuff for now.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/elfutils/elfutils-disable-po.patch |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 package/elfutils/elfutils-disable-po.patch

diff --git a/package/elfutils/elfutils-disable-po.patch b/package/elfutils/elfutils-disable-po.patch
new file mode 100644
index 0000000..bafc4e6
--- /dev/null
+++ b/package/elfutils/elfutils-disable-po.patch
@@ -0,0 +1,12 @@
+diff -Naur elfutils-0.155.org/Makefile.am elfutils-0.155/Makefile.am
+--- elfutils-0.155.org/Makefile.am	2012-12-18 23:11:18.119231653 +0200
++++ elfutils-0.155/Makefile.am	2012-12-18 23:11:32.016997982 +0200
+@@ -24,7 +24,7 @@
+ 
+ # Add doc back when we have some real content.
+ SUBDIRS = config m4 gnulib lib libelf libebl libdwfl libdw libcpu libasm backends \
+-	  src po tests
++	  src tests
+ 
+ EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
+ 	     COPYING COPYING-GPLV2 COPYING-LGPLV3 gnulib-cache.m4
-- 
1.7.7.6
