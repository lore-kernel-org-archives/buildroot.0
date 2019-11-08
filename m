From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  8 Nov 2019 18:17:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/sudo: replace rmdir
Message-ID: <20191108171717.3610-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace rmdir by $(RM) -rf to fix the following error:

rmdir /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/target/etc/sudoers.d
rmdir: failed to remove '/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-2/output/target/etc/sudoers.d': Directory not empty

Fixes:
 - http://autobuild.buildroot.org/results/0cfc61a98760c1d3a98aa0f1e126767881c49abd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sudo/sudo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 7d52eb0b57..ce45583a4e 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -66,7 +66,7 @@ endef
 
 define SUDO_REMOVE_DIST_EXAMPLES
 	$(RM) $(TARGET_DIR)/etc/sudoers.dist
-	rmdir $(TARGET_DIR)/etc/sudoers.d
+	$(RM) -rf $(TARGET_DIR)/etc/sudoers.d
 endef
 SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_REMOVE_DIST_EXAMPLES
 
-- 
2.23.0
