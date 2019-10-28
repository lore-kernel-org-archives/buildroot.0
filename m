From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Oct 2019 00:11:14 +0100
Subject: [Buildroot] [git commit] package/qemu: enable xtensa support for
 host-qemu
Message-ID: <20191028230754.3636B8C586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19fbfc6fbca124ef8c9b15742f5c8fd8382cbc54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qemu/Config.in.host | 1 +
 package/qemu/qemu.mk        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 43d55c88ce..d6b4bf6dd4 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -18,6 +18,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_sh
 	default y if BR2_sparc
 	default y if BR2_sparc64
+	default y if BR2_xtensa
 	default y if BR2_x86_64
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 4e39fce8a6..a91f9d3eeb 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -209,6 +209,7 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
 #       sh4aeb          sh4eb
 #       sparc           sparc
 #       sparc64         sparc64
+#       xtensa          xtensa
 
 HOST_QEMU_ARCH = $(ARCH)
 ifeq ($(HOST_QEMU_ARCH),i486)
