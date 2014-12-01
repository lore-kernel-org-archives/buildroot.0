From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:36:57 +0100
Subject: [Buildroot] [git commit] thttpd: use the <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221140.4D7988002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0df50e1f450c5f0456fdcaba4a38a7fd75b1dbe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/thttpd/thttpd.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 70a90fd..1a028c8 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -31,8 +31,6 @@ define THTTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd_wrapper $(TARGET_DIR)/usr/sbin/thttpd_wrapper
 	$(SED) 's:/usr/local/sbin:/usr/sbin:g' -e \
 		's:/usr/local/www:/var/www:g' $(TARGET_DIR)/usr/sbin/thttpd_wrapper
-	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd.sh $(TARGET_DIR)/etc/init.d/S90thttpd
-	$(SED) 's:/usr/local/sbin:/usr/sbin:g' $(TARGET_DIR)/etc/init.d/S90thttpd
 	$(INSTALL) -d $(TARGET_DIR)/var/www/data
 	$(INSTALL) -d $(TARGET_DIR)/var/www/logs
 	echo "dir=/var/www/data" > $(TARGET_DIR)/var/www/thttpd_config
@@ -41,4 +39,9 @@ define THTTPD_INSTALL_TARGET_CMDS
 	echo "pidfile=/var/run/thttpd.pid" >> $(TARGET_DIR)/var/www/thttpd_config
 endef
 
+define THTTPD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd.sh $(TARGET_DIR)/etc/init.d/S90thttpd
+	$(SED) 's:/usr/local/sbin:/usr/sbin:g' $(TARGET_DIR)/etc/init.d/S90thttpd
+endef
+
 $(eval $(autotools-package))
