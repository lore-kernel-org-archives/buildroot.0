From: heiko at zuerker.org <heiko@zuerker.org>
Date: Fri, 24 Dec 2010 08:17:50 -0600
Subject: [Buildroot] [PATCH v2] busybox: add option to disable automatic
	configuration changes depending on buildroot settings
Message-ID: <d401ea0a282113d521f495b069f8c684736b0a4e.1293200255.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/busybox/busybox.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 8bff1a6..17303d7 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -39,6 +39,9 @@ define BUSYBOX_SET_BB_PWD
 endef
 endif
 
+# automatically adjust the busybox configuration depending on the buildroot settings
+ifneq ($(BR2_PACKAGE_BUSYBOX_DONT_CHANGE_CONFIG),y)
+
 ifeq ($(BR2_LARGEFILE),y)
 define BUSYBOX_SET_LARGEFILE
 	$(call KCONFIG_ENABLE_OPT,CONFIG_LFS,$(BUSYBOX_BUILD_CONFIG))
@@ -100,6 +103,9 @@ define BUSYBOX_NETKITTELNET
 endef
 endif
 
+# end of busybox config adjustments
+endif
+
 define BUSYBOX_COPY_CONFIG
 	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
 endef
-- 
1.7.3.2
