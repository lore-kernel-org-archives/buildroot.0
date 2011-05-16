From: benoit.mauduit at gmail.com <benoit.mauduit@gmail.com>
Date: Mon, 16 May 2011 17:25:44 +0200
Subject: [Buildroot] [PATCH] busybox: Add busybox-xconfig and
	busybox-gconfig rules
Message-ID: <1305559544-4902-1-git-send-email-benoit.mauduit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Benoit Mauduit <benoit.mauduit@openwide.fr>

---
 package/busybox/busybox.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 711d11b..b806cdb 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -165,8 +165,9 @@ endef
 
 $(eval $(call GENTARGETS,package,busybox))
 
-busybox-menuconfig: busybox-patch
-	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) menuconfig
+busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
+	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) \
+		$(subst busybox-,,$@)
 	rm -f $(BUSYBOX_DIR)/.stamp_built
 	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
 
-- 
1.7.5.1
