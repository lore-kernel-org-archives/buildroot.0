From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 09:39:56 -0300
Subject: [Buildroot] [PATCH v2 05/11] busybox: force ipv6 build
In-Reply-To: <1429447202-13722-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429447202-13722-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429447202-13722-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since it isn't optional any more just force IPv6 on in busybox to avoid
problems.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 95fdfec..1ce508a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -97,18 +97,10 @@ define BUSYBOX_SET_LARGEFILE
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FDISK_SUPPORT_LARGE_DISKS,$(BUSYBOX_BUILD_CONFIG))
 endef
 
-# If IPv6 is enabled then enable basic ifupdown support for it
-ifeq ($(BR2_INET_IPV6),y)
 define BUSYBOX_SET_IPV6
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_IPV6,$(BUSYBOX_BUILD_CONFIG))
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_IFUPDOWN_IPV6,$(BUSYBOX_BUILD_CONFIG))
 endef
-else
-define BUSYBOX_SET_IPV6
-	$(call KCONFIG_DISABLE_OPT,CONFIG_FEATURE_IPV6,$(BUSYBOX_BUILD_CONFIG))
-	$(call KCONFIG_DISABLE_OPT,CONFIG_FEATURE_IFUPDOWN_IPV6,$(BUSYBOX_BUILD_CONFIG))
-endef
-endif
 
 # If we're using static libs do the same for busybox
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.0.5
