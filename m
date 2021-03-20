From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 17:49:55 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] boot/uboot: fix kconfig
 with per-package directories and host-make
Message-ID: <20210320162651.127DE87955@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1ee5b487f8d69d212d3b60424400b97827b52b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

If PER_PACKAGE_DIRECTORIES=Y and using host-make package (because
BR2_FORCE_HOST_BUILD=Y or local make is too old) .stamp_dotconfig
target needs per-package/uboot/host/bin/host-make that doesn't
exist yet.

Add host-make into UBOOT_KCONFIG_DEPENDENCIES.

Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3cf8173e5c3d23c3b147a3a083082409f09869ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d2b4e8dc60..9fa90fb320 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -491,6 +491,7 @@ $(eval $(generic-package))
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
 UBOOT_MAKE_ENV = $(TARGET_MAKE_ENV)
 UBOOT_KCONFIG_DEPENDENCIES = \
+	$(BR2_MAKE_HOST_DEPENDENCY) \
 	$(BR2_BISON_HOST_DEPENDENCY) \
 	$(BR2_FLEX_HOST_DEPENDENCY)
 $(eval $(kconfig-package))
