From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Mar 2014 17:04:52 +0100
Subject: [Buildroot] [git commit] qwt: use TARGET_MAKE_ENV when running make
	and qmake
Message-ID: <20140326160936.79D879C2A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae5234e3156eb9db3873daf19916307e0f670349
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch prepends TARGET_MAKE_ENV to $(MAKE) and $(QT_QMAKE) command
lines, to make sure PATH is set correctly, and to line up with the qt5
packages that do this consistently.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qwt/qwt.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index aa5ec9b..776780b 100644
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
