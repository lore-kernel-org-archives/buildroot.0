From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 23:05:53 +0100
Subject: [Buildroot] [git commit] package/qt5cinex: convert to qmake
 infrastructure
Message-ID: <20200311215326.084B590A0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4fb0177a0e7a0c0eab2341f29cccefd890b47b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Keep custom install logic because qt5cinex has no built-in install
target.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5cinex/qt5cinex.mk | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
index 89c38ee3f5..70038028d9 100644
--- a/package/qt5cinex/qt5cinex.mk
+++ b/package/qt5cinex/qt5cinex.mk
@@ -12,19 +12,11 @@ QT5CINEX_HD = rpi_
 endif
 
 QT5CINEX_SOURCE = Qt5_CinematicExperience_$(QT5CINEX_HD)$(QT5CINEX_VERSION).tgz
-QT5CINEX_DEPENDENCIES = qt5base qt5declarative
+QT5CINEX_DEPENDENCIES = qt5declarative
 
 QT5CINEX_LICENSE = CC-BY-3.0
 QT5CINEX_LICENSE_FILES = README
 
-define QT5CINEX_CONFIGURE_CMDS
-	cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake
-endef
-
-define QT5CINEX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
 # In addition to the Cinematic Experience itself, we also install a
 # wrapper shell script to /usr/bin: the Cinematic Experience binary
 # wants its resource files to be available directly under a contents/
@@ -39,4 +31,4 @@ define QT5CINEX_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/bin/CinematicExperience-demo
 endef
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
