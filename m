From: Chris Zankel <chris@zankel.net>
Date: Tue, 22 Jan 2013 12:40:09 -0800
Subject: [Buildroot] [PATCH 2/2] xtensa: add support for Xtensa for the
	util-linux package
Message-ID: <50fefac0.68dc440a.126d.3b72@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Chris Zankel <chris@zankel.net>
---
 package/util-linux/util-linux-2.20.1-xtensa-support.patch |   11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/util-linux/util-linux-2.20.1-xtensa-support.patch

diff --git a/package/util-linux/util-linux-2.20.1-xtensa-support.patch b/package/util-linux/util-linux-2.20.1-xtensa-support.patch
new file mode 100644
index 0000000..ab294cc
--- /dev/null
+++ b/package/util-linux/util-linux-2.20.1-xtensa-support.patch
@@ -0,0 +1,11 @@
+--- util-linux-2.20.1/fdisk/fdiskbsdlabel.h.orig	2013-01-21 19:17:58.023049856 -0800
++++ util-linux-2.20.1/fdisk/fdiskbsdlabel.h	2013-01-21 19:18:09.867050151 -0800
+@@ -49,7 +49,7 @@
+ #if defined (i386) || defined (__sparc__) || defined (__arm__) || \
+     defined (__mips__) || defined (__s390__) || defined (__sh__) || \
+     defined(__x86_64__) || defined (__avr32__) || defined(__cris__) || \
+-    defined(__aarch64__)
++    defined(__aarch64__) || defined(__xtensa__)
+ #define BSD_LABELSECTOR   1
+ #define BSD_LABELOFFSET   0
+ #elif defined (__alpha__) || defined (__powerpc__) || defined (__ia64__) || defined (__hppa__)
-- 
1.7.10.4
