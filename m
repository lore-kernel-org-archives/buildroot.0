From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Mar 2015 18:07:27 -0300
Subject: [Buildroot] [PATCH v3 08/15] busybox: force lfs build
In-Reply-To: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427749654-30153-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop the buildroot toolchain non-largefile support option since it's
being removed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7412ce0..95fdfec 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -92,17 +92,10 @@ define BUSYBOX_SET_MMU
 endef
 endif
 
-ifeq ($(BR2_LARGEFILE),y)
 define BUSYBOX_SET_LARGEFILE
 	$(call KCONFIG_ENABLE_OPT,CONFIG_LFS,$(BUSYBOX_BUILD_CONFIG))
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FDISK_SUPPORT_LARGE_DISKS,$(BUSYBOX_BUILD_CONFIG))
 endef
-else
-define BUSYBOX_SET_LARGEFILE
-	$(call KCONFIG_DISABLE_OPT,CONFIG_LFS,$(BUSYBOX_BUILD_CONFIG))
-	$(call KCONFIG_DISABLE_OPT,CONFIG_FDISK_SUPPORT_LARGE_DISKS,$(BUSYBOX_BUILD_CONFIG))
-endef
-endif
 
 # If IPv6 is enabled then enable basic ifupdown support for it
 ifeq ($(BR2_INET_IPV6),y)
-- 
2.0.5
