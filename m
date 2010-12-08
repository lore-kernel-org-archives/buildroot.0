From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 Dec 2010 23:09:24 +0100
Subject: [Buildroot] [git commit master 1/1] qt: only build gui module if
	enabled
Message-ID: <20101208221111.0FC2E8E203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d3d67f7fb527b3b549d9da0c67b42477a224b00b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2905

Signed-off-by: Frederik Pasch <fpasch@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    6 +++++-
 package/qt/qt.mk |    4 ++++
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index f08353d..45585c1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,10 +3,14 @@
 	Ccache support reworked. Now used for both host and target
 	compilation, and cache is stored in ~/.buildroot-ccache.
 
-	Updated/fixed packages: cloop, m4, openssh, xz
+	Updated/fixed packages: cloop, m4, openssh, qt, xz
 
 	New packages: lsuio
 
+	Issues resolved (http://bugs.uclibc.org):
+
+	#2905: Qt: Speed up compilation, if gui-module isn't selected
+
 2010.11, Released November 30th, 2010:
 
 	Fixes all over the tree.
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index e344259..2b5b31b 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -190,6 +190,10 @@ else
 QT_CONFIGURE+= -big-endian
 endif
 
+ifneq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
+QT_CONFIGURE+= -no-gui
+endif
+
 ifeq ($(BR2_PACKAGE_QT_GIF),y)
 QT_CONFIGURE+= -qt-gif
 else
-- 
1.7.2.2
