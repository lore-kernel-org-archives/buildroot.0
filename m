From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 29 Jun 2011 15:46:18 +0200
Subject: [Buildroot] [PATCH 3/6] Remove quirk for older busybox not
	supported any more
Message-ID: <1309355181-21048-3-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This code is no longer useful, since the older version supported by
Builroot is 1.16.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/busybox/busybox.mk |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index b77880c..034801e 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -49,17 +49,6 @@ define BUSYBOX_SET_SYSKLOGD
 endef
 endif
 
-# id applet breaks on >=1.13.0 with old uclibc unless the bb pwd routines are used
-ifeq ($(BR2_BUSYBOX_VERSION_1_13_X)$(BR2_BUSYBOX_VERSION_1_14_X)$(BR2_UCLIBC_VERSION_0_9_29),yy)
-define BUSYBOX_SET_BB_PWD
-	if grep -q 'CONFIG_ID=y' $(BUSYBOX_BUILD_CONFIG); \
-	then \
-		echo 'warning: CONFIG_ID needs BB_PWD_GRP with old uclibc, enabling' >&2;\
-		$(SED) "s/^.*CONFIG_USE_BB_PWD_GRP.*/CONFIG_USE_BB_PWD_GRP=y/;" $(BUSYBOX_BUILD_CONFIG); \
-	fi
-endef
-endif
-
 ifeq ($(BR2_LARGEFILE),y)
 define BUSYBOX_SET_LARGEFILE
 	$(call KCONFIG_ENABLE_OPT,CONFIG_LFS,$(BUSYBOX_BUILD_CONFIG))
-- 
1.7.4.1
