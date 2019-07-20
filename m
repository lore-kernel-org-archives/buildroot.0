From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jul 2019 15:36:27 +0200
Subject: [Buildroot] [git commit] package/tesseract-ocr: fix build on musl
Message-ID: <20190720133425.CCB02814E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bc55061d9d52b290304a0a7f2b1ece8ac792784
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes autobuild failures like:
- http://autobuild.buildroot.net/results/e47da689b4a2912b626f5d31086f6414e3e53774/

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-timeval-structure-build-failure.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/tesseract-ocr/0001-Fix-timeval-structure-build-failure.patch b/package/tesseract-ocr/0001-Fix-timeval-structure-build-failure.patch
new file mode 100644
index 0000000000..0b0bb1a899
--- /dev/null
+++ b/package/tesseract-ocr/0001-Fix-timeval-structure-build-failure.patch
@@ -0,0 +1,27 @@
+From ea1e1ddfc0af9966a0c613a93087bc3e0a5979a7 Mon Sep 17 00:00:00 2001
+From: Gilles Talis <gilles.talis@gmail.com>
+Date: Fri, 19 Jul 2019 18:52:03 +0200
+Subject: [PATCH] Fix timeval structure build failure
+
+timeval structure definition requires <sys/time.h> to be included
+
+Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
+---
+ src/ccutil/ocrclass.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ccutil/ocrclass.h b/src/ccutil/ocrclass.h
+index d39a6dd..2a01118 100644
+--- a/src/ccutil/ocrclass.h
++++ b/src/ccutil/ocrclass.h
+@@ -28,6 +28,7 @@
+ 
+ #include <chrono>
+ #include <ctime>
++#include <sys/time.h>
+ #ifdef _WIN32
+ #include <winsock2.h> // for timeval
+ #endif
+-- 
+2.7.4
+
