From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Aug 2020 16:14:08 +0200
Subject: [Buildroot] [git commit] package/kmsxx: fix build with gcc 10
Message-ID: <20200815140813.E7E12822A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d82fa9e022f7f7781df8f1124430aa31688bf827
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/7777cd9496e8f8cdb093c3f82c550eebedda0b5d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-fix-compiler-errors-with-gcc-10.patch     | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/kmsxx/0001-fix-compiler-errors-with-gcc-10.patch b/package/kmsxx/0001-fix-compiler-errors-with-gcc-10.patch
new file mode 100644
index 0000000000..6ec080af97
--- /dev/null
+++ b/package/kmsxx/0001-fix-compiler-errors-with-gcc-10.patch
@@ -0,0 +1,35 @@
+From aa54634ce7cbbfc844de945e73a9f34cdcb9bb12 Mon Sep 17 00:00:00 2001
+From: Peter Trompeter <christoph@zen.fritz.box>
+Date: Fri, 15 May 2020 15:20:47 +0200
+Subject: [PATCH] fix compiler errors with gcc 10
+
+[Retrieved from:
+https://github.com/tomba/kmsxx/commit/aa54634ce7cbbfc844de945e73a9f34cdcb9bb12]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ kms++/inc/kms++/pixelformats.h | 1 +
+ kms++util/src/opts.cpp         | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/kms++/inc/kms++/pixelformats.h b/kms++/inc/kms++/pixelformats.h
+index 784717d..4e73d5d 100644
+--- a/kms++/inc/kms++/pixelformats.h
++++ b/kms++/inc/kms++/pixelformats.h
+@@ -2,6 +2,7 @@
+ 
+ #include <cstdint>
+ #include <string>
++#include <stdexcept>
+ 
+ namespace kms
+ {
+diff --git a/kms++util/src/opts.cpp b/kms++util/src/opts.cpp
+index afef452..5a14b84 100644
+--- a/kms++util/src/opts.cpp
++++ b/kms++util/src/opts.cpp
+@@ -1,4 +1,5 @@
+ #include <algorithm>
++#include <stdexcept>
+ 
+ #include <unistd.h>
+ #include <getopt.h>
