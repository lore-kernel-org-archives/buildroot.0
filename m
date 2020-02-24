From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2020 23:20:35 +0100
Subject: [Buildroot] [PATCH 18/36] package/qt5serialbus: drop qt 5.6 support
In-Reply-To: <20200224222054.2686-1-peter@korsgaard.com>
References: <20200224222054.2686-1-peter@korsgaard.com>
Message-ID: <20200224222054.2686-18-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And get rid of the 5.12.7 subdir now that the version selection is gone.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../qt5/qt5serialbus/5.12.7/qt5serialbus.hash |  8 -----
 ...er-error-SIOCGSTAMP-was-not-declared.patch | 36 -------------------
 .../qt5/qt5serialbus/5.6.3/qt5serialbus.hash  |  8 -----
 package/qt5/qt5serialbus/qt5serialbus.hash    | 10 ++++--
 4 files changed, 8 insertions(+), 54 deletions(-)
 delete mode 100644 package/qt5/qt5serialbus/5.12.7/qt5serialbus.hash
 delete mode 100644 package/qt5/qt5serialbus/5.6.3/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch
 delete mode 100644 package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash

diff --git a/package/qt5/qt5serialbus/5.12.7/qt5serialbus.hash b/package/qt5/qt5serialbus/5.12.7/qt5serialbus.hash
deleted file mode 100644
index fa3ccc1475..0000000000
--- a/package/qt5/qt5serialbus/5.12.7/qt5serialbus.hash
+++ /dev/null
@@ -1,8 +0,0 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtserialbus-everywhere-src-5.12.7.tar.xz.sha256
-sha256 82201edf971e957d849b041ab2914f7497226939c62884ec2906b37576987eae qtserialbus-everywhere-src-5.12.7.tar.xz
-
-# Hashes for license files:
-sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
-sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5serialbus/5.6.3/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch b/package/qt5/qt5serialbus/5.6.3/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch
deleted file mode 100644
index 8573e304fa..0000000000
--- a/package/qt5/qt5serialbus/5.6.3/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 43d746c2c0c87c8694e835f3b052317c8fa02482 Mon Sep 17 00:00:00 2001
-From: Andre Hartmann <aha_1980@gmx.de>
-Date: Mon, 8 Jul 2019 21:35:12 +0200
-Subject: =?UTF-8?q?SocketCAN:=20Fix=20compiler=20error=20"=E2=80=98SIOCGST?=
- =?UTF-8?q?AMP=E2=80=99=20was=20not=20declared"?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes: QTBUG-76957
-Change-Id: I8c4c86aa23137d67f5d20eedfe1c46a241c0632b
-Reviewed-by: Alex Blasche <alexander.blasche@qt.io>
-Reviewed-by: Denis Shienkov <denis.shienkov@gmail.com>
-
-[Retrieved from:
-https://code.qt.io/cgit/qt/qtserialbus.git/commit/?id=43d746c2c0c87c8694e835f3b052317c8fa02482]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/plugins/canbus/socketcan/socketcanbackend.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/plugins/canbus/socketcan/socketcanbackend.cpp b/src/plugins/canbus/socketcan/socketcanbackend.cpp
-index 74b0d1d..a2da146 100644
---- a/src/plugins/canbus/socketcan/socketcanbackend.cpp
-+++ b/src/plugins/canbus/socketcan/socketcanbackend.cpp
-@@ -45,6 +45,7 @@
- 
- #include <linux/can/error.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- #include <errno.h>
- #include <unistd.h>
- #include <net/if.h>
--- 
-cgit v1.2.1
-
diff --git a/package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash b/package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash
deleted file mode 100644
index 6715392eba..0000000000
--- a/package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash
+++ /dev/null
@@ -1,8 +0,0 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialbus-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 71c89be3879414e2a11cad93a4882758f9259b1c0aec980560309192c99f9a9e qtserialbus-opensource-src-5.6.3.tar.xz
-
-# Hashes for license files:
-sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
-sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
-sha256 f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d LICENSE.FDL
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 5316f03b10..fa3ccc1475 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,2 +1,8 @@
-# This hash file is not used; instead, update the
-# hash files in the per-version sub-directories.
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtserialbus-everywhere-src-5.12.7.tar.xz.sha256
+sha256 82201edf971e957d849b041ab2914f7497226939c62884ec2906b37576987eae qtserialbus-everywhere-src-5.12.7.tar.xz
+
+# Hashes for license files:
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-- 
2.20.1
