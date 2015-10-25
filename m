From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:00:41 +0100
Subject: [Buildroot] [git commit] q5base: use TARGET_MAKE_ENV
Message-ID: <20151025200324.E96BF8192A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81a6fb28799fd4ee535ec17929be3dbcba29f756
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So our tools (E.G. pkg-config) in $(HOST_DIR) are found.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 570cd35..3d1ada4 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -173,6 +173,7 @@ endif
 define QT5BASE_CONFIGURE_CMDS
 	$(QT5BASE_CONFIGURE_CONFIG_FILE)
 	(cd $(@D); \
+		$(TARGET_MAKE_ENV) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
@@ -196,11 +197,11 @@ define QT5BASE_CONFIGURE_CMDS
 endef
 
 define QT5BASE_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define QT5BASE_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
