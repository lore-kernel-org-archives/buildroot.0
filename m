From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Dec 2012 18:29:40 +0100
Subject: [Buildroot] [PATCH 3/5] util-linux: fix build on AArch64
In-Reply-To: <1355592582-31374-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1355592582-31374-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1355592582-31374-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

 http://autobuild.buildroot.org/results/5b63022f4c2d8bdd72697e8007e8a6101a64dd12/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../util-linux-fdisk-aarch64-support.patch         |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/util-linux/util-linux-fdisk-aarch64-support.patch

diff --git a/package/util-linux/util-linux-fdisk-aarch64-support.patch b/package/util-linux/util-linux-fdisk-aarch64-support.patch
new file mode 100644
index 0000000..825e82c
--- /dev/null
+++ b/package/util-linux/util-linux-fdisk-aarch64-support.patch
@@ -0,0 +1,22 @@
+Add case for the aarch64 architecture
+
+Taken from https://bugs.launchpad.net/ubuntu/+source/util-linux/+bug/1061609
+
+Code written by Wookey.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/fdisk/fdiskbsdlabel.h
+===================================================================
+--- a/fdisk/fdiskbsdlabel.h
++++ b/fdisk/fdiskbsdlabel.h
+@@ -48,7 +48,8 @@
+ 
+ #if defined (i386) || defined (__sparc__) || defined (__arm__) || \
+     defined (__mips__) || defined (__s390__) || defined (__sh__) || \
+-    defined(__x86_64__) || defined (__avr32__) || defined(__cris__)
++    defined(__x86_64__) || defined (__avr32__) || defined(__cris__) || \
++    defined(__aarch64__)
+ #define BSD_LABELSECTOR   1
+ #define BSD_LABELOFFSET   0
+ #elif defined (__alpha__) || defined (__powerpc__) || defined (__ia64__) || defined (__hppa__)
-- 
1.7.9.5
