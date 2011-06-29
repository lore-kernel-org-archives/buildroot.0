From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 29 Jun 2011 15:46:19 +0200
Subject: [Buildroot] [PATCH 4/6] Remove obsolete code in busybox.mk
Message-ID: <1309355181-21048-4-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove this quirk since the tested code is no longer present in busybox
since 1.10.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/busybox/busybox.mk |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 034801e..d2ba226 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -41,14 +41,6 @@ define BUSYBOX_SET_MDEV
 endef
 endif
 
-# If we have external syslogd, force busybox to use it
-ifeq ($(BR2_PACKAGE_SYSKLOGD),y)
-define BUSYBOX_SET_SYSKLOGD
-	@$(SED) "/#include.*busybox\.h/a#define CONFIG_SYSLOGD" \
-		$(BUSYBOX_DIR)/init/init.c
-endef
-endif
-
 ifeq ($(BR2_LARGEFILE),y)
 define BUSYBOX_SET_LARGEFILE
 	$(call KCONFIG_ENABLE_OPT,CONFIG_LFS,$(BUSYBOX_BUILD_CONFIG))
-- 
1.7.4.1
