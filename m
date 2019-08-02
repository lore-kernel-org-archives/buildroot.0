From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 23:48:49 +0200
Subject: [Buildroot] [git commit] package/qemu: enable sparc64 support in
 host-qemu
Message-ID: <20190802214910.3BE6F8142D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a2d60fe7edd4eafcd8721e2a1c5f5bd81a87d65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change enables host qemu support for sparc64 which among other
things allows to test this architecture in gitlab.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in.host | 1 +
 package/qemu/qemu.mk        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index b1c3ab685e..0287f20514 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -17,6 +17,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_riscv
 	default y if BR2_sh
 	default y if BR2_sparc
+	default y if BR2_sparc64
 	default y if BR2_x86_64
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index c5d33d7d3c..f4fa20abab 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -188,6 +188,7 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
 #       sh4aeb          sh4eb
 #       sh64            not supported
 #       sparc           sparc
+#       sparc64         sparc64
 
 HOST_QEMU_ARCH = $(ARCH)
 ifeq ($(HOST_QEMU_ARCH),i486)
