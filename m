From: heiko at zuerker.org <heiko@zuerker.org>
Date: Fri,  3 Dec 2010 12:41:30 -0600
Subject: [Buildroot] [PATCH] Don't change the busybox static build option if
	build for shared lib system
Message-ID: <c32299a7b6a740dc82bb2a5642ccbb5d3a7eab5c.1291401661.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>

There are cases when a static built busybox is desired on a shared lib system,
so leave this up to the person configuring busybox. Cases where you need this
are e.g. minimal initramfs or a initrd for initialization of the system

Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/busybox/busybox.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index b7f4740..2ae38ed 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -80,10 +80,6 @@ ifeq ($(BR2_PREFER_STATIC_LIB),y)
 define BUSYBOX_PREFER_STATIC
 	$(call KCONFIG_ENABLE_OPT,CONFIG_STATIC,$(BUSYBOX_BUILD_CONFIG))
 endef
-else
-define BUSYBOX_PREFER_STATIC
-	$(call KCONFIG_DISABLE_OPT,CONFIG_STATIC,$(BUSYBOX_BUILD_CONFIG))
-endef
 endif
 
 # Disable usage of inetd if netkit-base package is selected
-- 
1.7.3.2
