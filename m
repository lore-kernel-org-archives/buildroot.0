From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:38 +0100
Subject: [Buildroot] [PATCH v6 16/28] package/qt5cinex: Convert to qmake
 infra
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-17-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Keep custom install logic because qt5cinex has no built-in install target.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5cinex/qt5cinex.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
index 89c38ee3f5..2b27f651d8 100644
--- a/package/qt5cinex/qt5cinex.mk
+++ b/package/qt5cinex/qt5cinex.mk
@@ -17,13 +17,6 @@ QT5CINEX_DEPENDENCIES = qt5base qt5declarative
 QT5CINEX_LICENSE = CC-BY-3.0
 QT5CINEX_LICENSE_FILES = README
 
-define QT5CINEX_CONFIGURE_CMDS
-	cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake
-endef
-
-define QT5CINEX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
 
 # In addition to the Cinematic Experience itself, we also install a
 # wrapper shell script to /usr/bin: the Cinematic Experience binary
@@ -39,4 +32,4 @@ define QT5CINEX_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/bin/CinematicExperience-demo
 endef
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
-- 
2.25.0
