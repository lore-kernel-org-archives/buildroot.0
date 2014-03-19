From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Mar 2014 20:30:09 +0100
Subject: [Buildroot] [PATCH 4 of 4] qextserialport: use TARGET_MAKE_ENV when
 running make and qmake
In-Reply-To: <patchbomb.1395257405@argentina>
References: <patchbomb.1395257405@argentina>
Message-ID: <caeab58814c94c25ce68.1395257409@argentina>
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
 package/qextserialport/qextserialport.mk |  4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
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
