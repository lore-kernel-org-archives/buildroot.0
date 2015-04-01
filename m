From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:43:32 +0200
Subject: [Buildroot] [git commit] busybox: force lfs build
Message-ID: <20150401205855.F132D7F911@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=553618d9b225986cf0624a144587884a07e44f57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the buildroot toolchain non-largefile support option since it's
being removed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

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
