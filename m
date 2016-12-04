From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 23:52:39 +0100
Subject: [Buildroot] [git commit] qextserialport: remove redundant patch
	0001-gui
Message-ID: <20161204225256.86071817A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d50a127127a2e93caab994d4f9ae2d884640e1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The same thing was done in upstream commit 220d7a2f "QtGui module only
needed by Windows", though it was done differently upstream.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0001-Create-a-main-include-file-QExtSerialPort.patch} |  0
 package/qextserialport/0001-gui.patch                    | 16 ----------------
 ...make-to-add-a-pkgconfig-file-to-ease-usage-wit.patch} |  0
 3 files changed, 16 deletions(-)

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
