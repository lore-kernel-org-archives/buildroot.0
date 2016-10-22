From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] omap-u-boot-utils: use $(HOST_MAKE_ENV)
	when calling $(MAKE)
Message-ID: <20161022132039.46A1B819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bddb0b1c449c45a07b20fe7e7bb91a03dd736e1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/omap-u-boot-utils/omap-u-boot-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
index 7cfed65..b8a342b 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -10,7 +10,7 @@ OMAP_U_BOOT_UTILS_LICENSE = GPLv2, GPLv2+
 OMAP_U_BOOT_UTILS_LICENSE_FILES = COPYING
 
 define HOST_OMAP_U_BOOT_UTILS_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define HOST_OMAP_U_BOOT_UTILS_INSTALL_CMDS
