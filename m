From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Feb 2013 23:52:08 +0100
Subject: [Buildroot] [PATCH 2/3] util-linux: add support for Xtensa
In-Reply-To: <1360018329-3911-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360018329-3911-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360018329-3911-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Chris Zankel <chris@zankel.net>

[Thomas Petazzoni: rename patch to not have the package version in the
patch file name, adjust the commit title.]

Signed-off-by: Chris Zankel <chris@zankel.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../util-linux/util-linux-004-xtensa-support.patch |   11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/util-linux/util-linux-004-xtensa-support.patch

diff --git a/package/util-linux/util-linux-004-xtensa-support.patch b/package/util-linux/util-linux-004-xtensa-support.patch
new file mode 100644
index 0000000..ab294cc
--- /dev/null
+++ b/package/util-linux/util-linux-004-xtensa-support.patch
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
1.7.9.5
