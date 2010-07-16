From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 16 Jul 2010 23:55:30 +0200
Subject: [Buildroot] [git commit master 1/1] qt: fix directfb dependency
Message-ID: <20100716215736.DEA9382A80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b922151c25a5b0a2e5555700e0a809779809e436
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2221

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    1 +
 package/qt/qt.mk |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 35e7fde..e1f8a0e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -59,6 +59,7 @@
 	#2155: Compression lzo don't set for ubifs
 	#2166: [SECURITY] Update libpng to 1.2.44
 	#2167: Bump busybox to 1.17.0, convert to gentargets, drop 1.12, ...
+	#2221: Qt does not compile (dependencies not taken into account?)
 
 2010.05, Released May 30th, 2010:
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index b4b6b29..dd43ae0 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -115,6 +115,7 @@ QT_CONFIGURE += -no-gfx-multiscreen
 endif
 ifeq ($(BR2_PACKAGE_QT_GFX_DIRECTFB),y)
 QT_CONFIGURE += -qt-gfx-directfb
+QT_DEP_LIBS+=directfb
 else
 QT_CONFIGURE += -no-gfx-directfb
 endif
-- 
1.7.1
