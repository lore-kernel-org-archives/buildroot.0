From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:46 +0200
Subject: [Buildroot] [PATCH 60/74] haserl: convert to new style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <23ad529cb5426435490a3eb68c4ef5840da8a613.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/haserl/haserl.mk |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 257a257..53b5548 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -22,9 +22,10 @@ ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
 	HASERL_DEPENDENCIES += lua
 endif
 
-$(eval $(call AUTOTARGETS,package,haserl))
-
-# haserl 0.8.0 installs unneeded examples to /usr/share/haserl - remove them
-$(HASERL_HOOK_POST_INSTALL): $(HASERL_TARGET_INSTALL_TARGET)
+define HASERL_REMOVE_EXAMPLES
 	rm -rf $(TARGET_DIR)/usr/share/haserl
-	touch $@
+endef
+
+HASERL_POST_INSTALL_TARGET_HOOKS += HASERL_REMOVE_EXAMPLES
+
+$(eval $(call AUTOTARGETS,package,haserl))
-- 
1.7.0.4
