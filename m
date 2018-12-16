From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:36:13 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/swupdate: default
 website have a new API
Message-ID: <20181216213238.C88D78D5B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d2b9223563396bc84b57a7687c24e9592cf5b2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

2018.03 introduce a new website with Websocket asynchronous
communication[1]

[1] https://github.com/sbabic/swupdate/blob/master/doc/source/mongoose.rst

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2d9e9d04d7e810e4c97f14dd84acfbdb43b9b3ea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 8649931eb7..abf46c9256 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -125,7 +125,7 @@ define SWUPDATE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/swupdate $(TARGET_DIR)/usr/bin/swupdate
 	$(if $(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE), \
 		mkdir -p $(TARGET_DIR)/var/www/swupdate; \
-		cp -dpf $(@D)/www/* $(TARGET_DIR)/var/www/swupdate)
+		cp -dpfr $(@D)/examples/www/v2/* $(TARGET_DIR)/var/www/swupdate)
 endef
 
 # Checks to give errors that the user can understand
