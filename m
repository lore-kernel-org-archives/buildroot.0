From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] mdadm: use correct step
	override method
Message-ID: <20100916113830.588BF8AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=edf47fc62c129b5c45c443ae058f290d7cb7a013
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mdadm/mdadm.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 1368a1e..3b71724 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -22,8 +22,8 @@ MDADM_INSTALL_TARGET_OPT = \
 MDADM_UNINSTALL_TARGET_OPT = \
 	DESTDIR=$(TARGET_DIR)/usr -C $(MDADM_DIR) uninstall
 
-$(eval $(call AUTOTARGETS,package,mdadm))
+define MDADM_CONFIGURE_CMDS
+	# Do nothing
+endef
 
-$(MDADM_TARGET_CONFIGURE):
-	$(call MESSAGE,"Configuring")
-	$(Q)touch $@
+$(eval $(call AUTOTARGETS,package,mdadm))
-- 
1.7.1
