From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 23:51:02 +0100
Subject: [Buildroot] [PATCH for-2012.11] qextserialport: don't require Qt
	GUI module
Message-ID: <1352847062-16275-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes e.g.
http://autobuild.buildroot.net/results/e80ae76fa21f87bef10e08c7452b796dc0986ff2/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/qextserialport/qextserialport-gui.patch |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/qextserialport/qextserialport-gui.patch b/package/qextserialport/qextserialport-gui.patch
new file mode 100644
index 0000000..d3dedae
--- /dev/null
+++ b/package/qextserialport/qextserialport-gui.patch
@@ -0,0 +1,16 @@
+Don't require Qt GUI module
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+diff -Nrup qextserialport-f83b4e7ca922e53.orig/qextserialport.pro qextserialport-f83b4e7ca922e53/qextserialport.pro
+--- qextserialport-f83b4e7ca922e53.orig/qextserialport.pro	2012-10-17 09:13:53.000000000 +0200
++++ qextserialport-f83b4e7ca922e53/qextserialport.pro	2012-11-13 22:48:29.249431510 +0100
+@@ -41,6 +41,8 @@ macx:qesp_mac_framework {
+ 
+ win32|mac:!wince*:!win32-msvc:!macx-xcode:CONFIG += debug_and_release build_all
+ 
++!win32*:!wince*:QT -= gui
++
+ #generate proper library name
+ greaterThan(QT_MAJOR_VERSION, 4) {
+     QESP_LIB_BASENAME = QtExtSerialPort
-- 
tg: (234fe44..) t/qtextserialport (depends on: master)
