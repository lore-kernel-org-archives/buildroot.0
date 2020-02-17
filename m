From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:29 +0100
Subject: [Buildroot] [PATCH v6 07/28] package/qt5tools: Partially convert to
 qmake infra
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-8-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use generic configure command but for now keep custom build and
install logic.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5tools/qt5tools.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 0d00022998..8e06706dd6 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -50,10 +50,6 @@ QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTPATHS) += qtpaths
 QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
 QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
 
-define QT5TOOLS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
 define QT5TOOLS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) sub-src-qmake_all
 	$(foreach p,$(QT5TOOLS_BUILD_DIRS_y), \
@@ -71,4 +67,4 @@ define QT5TOOLS_INSTALL_TARGET_CMDS
 		$(INSTALL) -D -m0755 $(@D)/bin/$(p) $(TARGET_DIR)/usr/bin/$(p)$(sep))
 endef
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
-- 
2.25.0
