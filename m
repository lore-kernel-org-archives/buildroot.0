From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 21:43:33 +0100
Subject: [Buildroot] [git commit] Revert "package/nano: fix tiny build"
Message-ID: <20210124211901.72E1682932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c08aed801b2bf69a4305861a011e5e3bb5e88d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit a0202ffa4a1e89225d22433d162d1726e43cd629 as it will
raise a build failure to enable color without MMU.

Fixes:
 - http://autobuild.buildroot.org/results/cd5583b493df6e30a033cc6bc29c637eb0e46f64

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nano/nano.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 097afadc31..c688ff216c 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -28,9 +28,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_NANO_TINY),y)
 NANO_CONF_OPTS += --enable-tiny
-ifeq ($(BR2_PACKAGE_FILE),y)
-NANO_CONF_OPTS += --enable-color --enable-nanorc
-endif
 define NANO_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/nano $(TARGET_DIR)/usr/bin/nano
 endef
