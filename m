From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] lighttpd: use correct step
	override method
Message-ID: <20100916113829.231128AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7d6e7bcc26d84846838a493d3c10e254ae824552
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
1.7.1
