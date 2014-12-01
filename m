From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:43:28 +0100
Subject: [Buildroot] [git commit] portmap: use <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221140.621CD8002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d67d8436fb7fa4dfc31be568dc7ca3d236469a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We also switch to using a full destination path as the second argument
of $(INSTALL).

[Peter: use install -D as noted by Yann]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/portmap/portmap.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index 0189597..2bffb9e 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -30,8 +30,10 @@ define PORTMAP_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/share/man/man8/pmap_dump.8
 	$(INSTALL) -D $(@D)/pmap_set.8 \
 		$(TARGET_DIR)/usr/share/man/man8/pmap_set.8
-	$(INSTALL) -m 0755 package/portmap/S13portmap \
-		$(TARGET_DIR)/etc/init.d
+endef
+
+define PORTMAP_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/portmap/S13portmap $(TARGET_DIR)/etc/init.d/S13portmap
 endef
 
 $(eval $(generic-package))
