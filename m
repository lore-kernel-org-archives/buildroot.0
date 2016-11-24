From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 24 Nov 2016 23:37:47 +0100
Subject: [Buildroot] [PATCH 3/3] qextserialport: remove redundant patch
	0001-gui
In-Reply-To: <20161124223747.31342-1-arnout@mind.be>
References: <20161124223747.31342-1-arnout@mind.be>
Message-ID: <20161124223747.31342-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The same thing was done in upstream commit 220d7a2f "QtGui module only
needed by Windows", though it was done differently upstream.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
This one is probably for next (though it depends on the other 2, so only
apply after the merge).
---
 ...0001-Create-a-main-include-file-QExtSerialPort.patch} |  0
 package/qextserialport/0001-gui.patch                    | 16 ----------------
 ...make-to-add-a-pkgconfig-file-to-ease-usage-wit.patch} |  0
 3 files changed, 16 deletions(-)
 rename package/qextserialport/{0002-Create-a-main-include-file-QExtSerialPort.patch => 0001-Create-a-main-include-file-QExtSerialPort.patch} (100%)
 delete mode 100644 package/qextserialport/0001-gui.patch
 rename package/qextserialport/{0003-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch => 0002-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch} (100%)

diff --git a/package/qextserialport/0002-Create-a-main-include-file-QExtSerialPort.patch b/package/qextserialport/0001-Create-a-main-include-file-QExtSerialPort.patch
similarity index 100%
rename from package/qextserialport/0002-Create-a-main-include-file-QExtSerialPort.patch
rename to package/qextserialport/0001-Create-a-main-include-file-QExtSerialPort.patch
diff --git a/package/qextserialport/0001-gui.patch b/package/qextserialport/0001-gui.patch
deleted file mode 100644
index d3dedae..0000000
--- a/package/qextserialport/0001-gui.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Don't require Qt GUI module
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
-diff -Nrup qextserialport-f83b4e7ca922e53.orig/qextserialport.pro qextserialport-f83b4e7ca922e53/qextserialport.pro
---- qextserialport-f83b4e7ca922e53.orig/qextserialport.pro	2012-10-17 09:13:53.000000000 +0200
-+++ qextserialport-f83b4e7ca922e53/qextserialport.pro	2012-11-13 22:48:29.249431510 +0100
-@@ -41,6 +41,8 @@ macx:qesp_mac_framework {
- 
- win32|mac:!wince*:!win32-msvc:!macx-xcode:CONFIG += debug_and_release build_all
- 
-+!win32*:!wince*:QT -= gui
-+
- #generate proper library name
- greaterThan(QT_MAJOR_VERSION, 4) {
-     QESP_LIB_BASENAME = QtExtSerialPort
diff --git a/package/qextserialport/0003-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch b/package/qextserialport/0002-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch
similarity index 100%
rename from package/qextserialport/0003-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch
rename to package/qextserialport/0002-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch
-- 
2.10.2
