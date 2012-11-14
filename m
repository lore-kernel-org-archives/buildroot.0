From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:44:50 +0100
Subject: [Buildroot] [git commit] qextserialport: don't require Qt GUI module
Message-ID: <20121114214738.427A799B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bac970e99d751dd58561313a38311962ea0a79f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes e.g.
http://autobuild.buildroot.net/results/e80ae76fa21f87bef10e08c7452b796dc0986ff2/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qextserialport/qextserialport-gui.patch |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

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
