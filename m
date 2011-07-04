From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Jul 2011 10:18:21 +0200
Subject: [Buildroot] [git commit] Remove obsolete code in busybox.mk
Message-ID: <20110704082354.751EA8A2EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7d814728ae38c5479ddb8b519eeb182f756f4291
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove this quirk since the tested code is no longer present in busybox
since 1.10.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
