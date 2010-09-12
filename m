From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:30 +0200
Subject: [Buildroot] [PATCH 44/74] lighttpd: use correct step override method
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7d6e7bcc26d84846838a493d3c10e254ae824552.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lighttpd/lighttpd.mk |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 3ac1f07..e6f913c 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -44,11 +44,10 @@ else
 LIGHTTPD_CONF_OPT += --without-pcre
 endif
 
-$(eval $(call AUTOTARGETS,package,lighttpd))
-
-$(LIGHTTPD_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define LIGHTTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/lighttpd
 	rm -f $(TARGET_DIR)/usr/sbin/lighttpd-angel
 	rm -rf $(TARGET_DIR)/usr/lib/lighttpd
-	rm -f $(LIGHTTPD_TARGET_INSTALL_TARGET) $(LIGHTTPD_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,lighttpd))
-- 
1.7.0.4
