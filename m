From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Mar 2014 23:20:33 +0100
Subject: [Buildroot] [git commit] qextserialport: use TARGET_MAKE_ENV when
	running make and qmake
Message-ID: <20140327222046.E95129C1CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab310df1887d1d862af287c1353a1e38e99cad6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch prepends TARGET_MAKE_ENV to $(MAKE) and $(QT_QMAKE) command
lines, to make sure PATH is set correctly, and to line up with the qt5
packages that do this consistently.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qextserialport/qextserialport.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 45dc9b8..b888435 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -15,11 +15,11 @@ QEXTSERIALPORT_DEPENDENCIES = qt
 QEXTSERIALPORT_INSTALL_STAGING = YES
 
 define QEXTSERIALPORT_CONFIGURE_CMDS
-	(cd $(@D); $(QT_QMAKE))
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT_QMAKE))
 endef
 
 define QEXTSERIALPORT_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define QEXTSERIALPORT_INSTALL_STAGING_CMDS
