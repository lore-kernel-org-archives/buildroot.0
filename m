From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:59:49 +0200
Subject: [Buildroot] [git commit] busybox: force ipv6 build
Message-ID: <20150422210724.F1FD181D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc8de24c3f1d67b26c628f44e8cc3ff79589c9dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since it isn't optional any more just force IPv6 on in busybox to avoid
problems.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

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
