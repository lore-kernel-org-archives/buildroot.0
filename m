From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Nov 2014 13:20:31 +0100
Subject: [Buildroot] [git commit] package/qt5webkit: fix build failure
Message-ID: <20141114122107.411EC9D768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7178c9b764d64448590cde0805747b6edfb7d796
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes build failure when the host python interpreter is python3.

Fixes:
  http://autobuild.buildroot.net/results/af8/af8f3d3cc018006cee58d57cd9e8c6d8b3de3247/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Fix-build-failure-with-python3.patch      |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5webkit/0002-Fix-build-failure-with-python3.patch b/package/qt5/qt5webkit/0002-Fix-build-failure-with-python3.patch
new file mode 100644
index 0000000..dc0854e
--- /dev/null
+++ b/package/qt5/qt5webkit/0002-Fix-build-failure-with-python3.patch
@@ -0,0 +1,31 @@
+Fetched from: https://codereview.qt-project.org/#/c/99784/
+
+From e9d00f6279f9cfefc5a3144d5953bb7934aed418 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Thu, 13 Nov 2014 15:29:38 +0100
+Subject: [PATCH] Fix build failure with python3
+
+Task-number: QTBUG-33692
+Change-Id: I7a3bc6217110ce3a0bf5fee4b3b675dee39d8ac5
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ Source/JavaScriptCore/disassembler/udis86/itab.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/JavaScriptCore/disassembler/udis86/itab.py b/Source/JavaScriptCore/disassembler/udis86/itab.py
+index 3d50ad0..90bd3e0 100644
+--- a/Source/JavaScriptCore/disassembler/udis86/itab.py
++++ b/Source/JavaScriptCore/disassembler/udis86/itab.py
+@@ -314,7 +314,7 @@ class UdItabGenerator( ud_opcode.UdOpcodeTables ):
+         self.ItabH.write( "\n" )
+ 
+         self.ItabH.write("\n/* itab entry operand definitions */\n");
+-        operands = self.OperandDict.keys()
++        operands = list( self.OperandDict.keys() )
+         operands.sort()
+         for o in operands:
+             self.ItabH.write("#define O_%-7s { %-12s %-8s }\n" %
+-- 
+2.1.3
+
