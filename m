From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 15:56:42 +0100
Subject: [Buildroot] [git commit] util-linux: add support for Xtensa
Message-ID: <20130205150055.7C9859A987@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b26e9f54996f1ccb198bf9599f6760be07da446f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas Petazzoni: rename patch to not have the package version in the
patch file name, adjust the commit title.]

Signed-off-by: Chris Zankel <chris@zankel.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../util-linux/util-linux-004-xtensa-support.patch |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

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
