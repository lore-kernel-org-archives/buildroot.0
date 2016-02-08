From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 16:27:03 +0100
Subject: [Buildroot] [git commit] rpi-userland: fix typos in the
	libilclient.so library installation
Message-ID: <20160208152716.4536880504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36c267e6f6ce88089c0c576a98d5c09406d51ca7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Schenk <michael.schenk@albistechnologies.com>
[Thomas: tweak commit title.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-userland/rpi-userland.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 0a25b2d..fbf6fb4 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -35,14 +35,14 @@ RPI_USERLAND_CONF_OPTS += -DALL_APPS=ON
 define RPI_USERLAND_EXTRA_LIBS_TARGET
 	$(INSTALL) -m 0644 -D \
 		$(@D)/build/lib/libilclient.so \
-		$(TARGET_DIR)/usr/lib/libilcient.so
+		$(TARGET_DIR)/usr/lib/libilclient.so
 endef
 RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_EXTRA_LIBS_TARGET
 
 define RPI_USERLAND_EXTRA_LIBS_STAGING
 	$(INSTALL) -m 0644 -D \
 		$(@D)/build/lib/libilclient.so \
-		$(STAGING_DIR)/usr/lib/libilcient.so
+		$(STAGING_DIR)/usr/lib/libilclient.so
 endef
 RPI_USERLAND_POST_INSTALL_STAGING_HOOKS += RPI_USERLAND_EXTRA_LIBS_STAGING
 
