From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:39 +0100
Subject: [Buildroot] [PATCH 07/51] portmap: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We also switch to using a full destination path as the second argument
of $(INSTALL).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/portmap/portmap.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index 0189597..dd60809 100644
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
+	$(INSTALL) -m 0755 package/portmap/S13portmap $(TARGET_DIR)/etc/init.d/S13portmap
 endef
 
 $(eval $(generic-package))
-- 
2.1.0
