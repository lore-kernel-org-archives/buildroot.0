From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:02:37 +0200
Subject: [Buildroot] [git commit] boot/uboot: needs host-{flex,bison}
Message-ID: <20180820140105.730D98DEF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=551454efff01c17aa2f0df1e0688276ec21e0035
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recent U-Boot no longer ship the flex/bison generated kconfig parser, as
of commit e91610da7c8a9fe42f3e5a75f06c3d1a0cb5f815 (kconfig: re-sync
with Linux 4.17-rc4).

So, add the conditional kconfig dependencies, as we just did for the
kernel.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/uboot.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 04c759be34..bddafe234d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -449,5 +449,8 @@ endif # BR2_TARGET_UBOOT && BR_BUILDING
 ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 $(eval $(generic-package))
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
+UBOOT_KCONFIG_DEPENDENCIES = \
+	$(BR2_BISON_HOST_DEPENDENCY) \
+	$(BR2_FLEX_HOST_DEPENDENCY)
 $(eval $(kconfig-package))
 endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
