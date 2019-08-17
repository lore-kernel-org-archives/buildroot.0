From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 14:36:22 +0200
Subject: [Buildroot] [git commit] package/qt5serialbus: fix build with
 kernel >= 5.2
Message-ID: <20190817123420.BFEE28229D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d848ee039e4f13c93a38209efba336660a4789d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/ddacee1d09f34fc718ef05a6e4f0bbbe26cd56d1
 - http://autobuild.buildroot.org/results/34a4ed20705b581add96fb5d97828909cee9015c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ompiler-error-SIOCGSTAMP-was-not-declared.patch | 36 ++++++++++++++++++++++
 ...ompiler-error-SIOCGSTAMP-was-not-declared.patch | 36 ++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/package/qt5/qt5serialbus/5.12.4/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch b/package/qt5/qt5serialbus/5.12.4/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch
new file mode 100644
index 0000000000..8573e304fa
--- /dev/null
+++ b/package/qt5/qt5serialbus/5.12.4/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch
@@ -0,0 +1,36 @@
+From 43d746c2c0c87c8694e835f3b052317c8fa02482 Mon Sep 17 00:00:00 2001
+From: Andre Hartmann <aha_1980@gmx.de>
+Date: Mon, 8 Jul 2019 21:35:12 +0200
+Subject: =?UTF-8?q?SocketCAN:=20Fix=20compiler=20error=20"=E2=80=98SIOCGST?=
+ =?UTF-8?q?AMP=E2=80=99=20was=20not=20declared"?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: QTBUG-76957
+Change-Id: I8c4c86aa23137d67f5d20eedfe1c46a241c0632b
+Reviewed-by: Alex Blasche <alexander.blasche@qt.io>
+Reviewed-by: Denis Shienkov <denis.shienkov@gmail.com>
+
+[Retrieved from:
+https://code.qt.io/cgit/qt/qtserialbus.git/commit/?id=43d746c2c0c87c8694e835f3b052317c8fa02482]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/plugins/canbus/socketcan/socketcanbackend.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/plugins/canbus/socketcan/socketcanbackend.cpp b/src/plugins/canbus/socketcan/socketcanbackend.cpp
+index 74b0d1d..a2da146 100644
+--- a/src/plugins/canbus/socketcan/socketcanbackend.cpp
++++ b/src/plugins/canbus/socketcan/socketcanbackend.cpp
+@@ -45,6 +45,7 @@
+ 
+ #include <linux/can/error.h>
+ #include <linux/can/raw.h>
++#include <linux/sockios.h>
+ #include <errno.h>
+ #include <unistd.h>
+ #include <net/if.h>
+-- 
+cgit v1.2.1
+
diff --git a/package/qt5/qt5serialbus/5.6.3/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch b/package/qt5/qt5serialbus/5.6.3/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch
new file mode 100644
index 0000000000..8573e304fa
--- /dev/null
+++ b/package/qt5/qt5serialbus/5.6.3/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch
@@ -0,0 +1,36 @@
+From 43d746c2c0c87c8694e835f3b052317c8fa02482 Mon Sep 17 00:00:00 2001
+From: Andre Hartmann <aha_1980@gmx.de>
+Date: Mon, 8 Jul 2019 21:35:12 +0200
+Subject: =?UTF-8?q?SocketCAN:=20Fix=20compiler=20error=20"=E2=80=98SIOCGST?=
+ =?UTF-8?q?AMP=E2=80=99=20was=20not=20declared"?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: QTBUG-76957
+Change-Id: I8c4c86aa23137d67f5d20eedfe1c46a241c0632b
+Reviewed-by: Alex Blasche <alexander.blasche@qt.io>
+Reviewed-by: Denis Shienkov <denis.shienkov@gmail.com>
+
+[Retrieved from:
+https://code.qt.io/cgit/qt/qtserialbus.git/commit/?id=43d746c2c0c87c8694e835f3b052317c8fa02482]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/plugins/canbus/socketcan/socketcanbackend.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/plugins/canbus/socketcan/socketcanbackend.cpp b/src/plugins/canbus/socketcan/socketcanbackend.cpp
+index 74b0d1d..a2da146 100644
+--- a/src/plugins/canbus/socketcan/socketcanbackend.cpp
++++ b/src/plugins/canbus/socketcan/socketcanbackend.cpp
+@@ -45,6 +45,7 @@
+ 
+ #include <linux/can/error.h>
+ #include <linux/can/raw.h>
++#include <linux/sockios.h>
+ #include <errno.h>
+ #include <unistd.h>
+ #include <net/if.h>
+-- 
+cgit v1.2.1
+
