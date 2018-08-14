From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 23:41:06 +0200
Subject: [Buildroot] [git commit] qt5serialbus: examples need qt5 widgets
 module
Message-ID: <20180814213410.808A38D368@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3c3a54da9394afc819f70215a2cf34162c05b82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  make[2]: Entering directory '.../build/qt5serialbus-5.11.1/examples'
  Some of the required modules (qtHaveModule(widgets)) are not available.
  Skipped.
  [...]
  cp -dpfr .../host/mips64el-buildroot-linux-gnu/sysroot/usr/lib/qt/examples/serialbus .../target/usr/lib/qt/examples/
  cp: cannot stat '.../host/mips64el-buildroot-linux-gnu/sysroot/usr/lib/qt/examples/serialbus': No such file or directory

[1] http://autobuild.buildroot.net/results/147809b5f8758af935bee48c0fc83fd86a8509e9

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5serialbus/qt5serialbus.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 6de9f9b7d3..98c4466cb8 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -36,7 +36,7 @@ define QT5SERIALBUS_INSTALL_TARGET_LIBS
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES)$(BR2_PACKAGE_QT5BASE_WIDGETS),yy)
 define QT5SERIALBUS_INSTALL_TARGET_EXAMPLES
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/serialbus $(TARGET_DIR)/usr/lib/qt/examples/
 endef
