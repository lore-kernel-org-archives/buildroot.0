From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri,  9 Dec 2016 21:23:00 -0500
Subject: [Buildroot] [PATCH 1/1] swupdate: replace BR2_PREFER_STATIC_LIB
	with BR2_STATIC_LIBS
Message-ID: <1481336580-8387-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/swupdate/swupdate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index c905c1d..688f4ee 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -83,7 +83,7 @@ SWUPDATE_BUILD_CONFIG = $(@D)/.config
 SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
 SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
+ifeq ($(BR2_STATIC_LIBS),y)
 define SWUPDATE_PREFER_STATIC
 	$(call KCONFIG_ENABLE_OPT,CONFIG_STATIC,$(SWUPDATE_BUILD_CONFIG))
 endef
-- 
1.9.1
