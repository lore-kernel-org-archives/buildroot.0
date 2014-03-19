From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Mar 2014 20:30:07 +0100
Subject: [Buildroot] [PATCH 2 of 4] qwt: use TARGET_MAKE_ENV when running
	make and qmake
In-Reply-To: <patchbomb.1395257405@argentina>
References: <patchbomb.1395257405@argentina>
Message-ID: <163c8448b6f2a17be27d.1395257407@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch prepends TARGET_MAKE_ENV to $(MAKE) and $(QT_QMAKE) command
lines, to make sure PATH is set correctly, and to line up with the qt5
packages that do this consistently.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/qwt/qwt.mk |  4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -28,11 +28,11 @@ endif
 
 define QWT_CONFIGURE_CMDS
 	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
-	(cd $(@D); $(QT_QMAKE))
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT_QMAKE))
 endef
 
 define QWT_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 # After installation, we fixup the INSTALL_PREFIX in qwtconfig.pri so
