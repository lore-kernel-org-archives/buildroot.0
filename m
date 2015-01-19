From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 20 Jan 2015 00:29:58 +0100
Subject: [Buildroot] [PATCH 4/4] boot/syslinux: add host-perl dependency
In-Reply-To: <1421710198-20898-1-git-send-email-romain.naour@openwide.fr>
References: <1421710198-20898-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1421710198-20898-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Syslinux use a perl interpreter in it's build system,
so add host-perl as dependency.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 boot/syslinux/syslinux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 7ec840e..c8107f1 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -13,7 +13,7 @@ SYSLINUX_LICENSE_FILES = COPYING
 
 SYSLINUX_INSTALL_IMAGES = YES
 
-SYSLINUX_DEPENDENCIES = host-nasm host-util-linux host-upx
+SYSLINUX_DEPENDENCIES = host-nasm host-perl host-util-linux host-upx
 
 ifeq ($(BR2_TARGET_SYSLINUX_LEGACY_BIOS),y)
 SYSLINUX_TARGET = bios
-- 
1.9.3
