From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 30 Oct 2019 00:38:14 +0100
Subject: [Buildroot] [git commit] package/gpsd: perform SCons build with
 Python3
Message-ID: <20191029233228.009628DB04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1df29189e84f165256f3d597fc495ef25102f34f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gpsd/gpsd.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 9268b2fe6b..fa9b057821 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -10,7 +10,7 @@ GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
 GPSD_INSTALL_STAGING = YES
 
-GPSD_DEPENDENCIES = host-python host-scons host-pkgconf
+GPSD_DEPENDENCIES = host-python3 host-scons host-pkgconf
 
 GPSD_LDFLAGS = $(TARGET_LDFLAGS)
 GPSD_CFLAGS = $(TARGET_CFLAGS)
@@ -205,7 +205,7 @@ GPSD_SCONS_ENV += LDFLAGS="$(GPSD_LDFLAGS)" CFLAGS="$(GPSD_CFLAGS)"
 define GPSD_BUILD_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
-		$(HOST_DIR)/bin/python2 $(SCONS) \
+		$(HOST_DIR)/bin/python3 $(SCONS) \
 		$(GPSD_SCONS_OPTS))
 endef
 
@@ -213,7 +213,7 @@ define GPSD_INSTALL_TARGET_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
 		DESTDIR=$(TARGET_DIR) \
-		$(HOST_DIR)/bin/python2 $(SCONS) \
+		$(HOST_DIR)/bin/python3 $(SCONS) \
 		$(GPSD_SCONS_OPTS) \
 		$(if $(BR2_PACKAGE_HAS_UDEV),udev-install,install))
 endef
@@ -235,7 +235,7 @@ define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
 		DESTDIR=$(STAGING_DIR) \
-		$(HOST_DIR)/bin/python2 $(SCONS) \
+		$(HOST_DIR)/bin/python3 $(SCONS) \
 		$(GPSD_SCONS_OPTS) \
 		install)
 endef
