From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Feb 2020 23:01:39 +0100
Subject: [Buildroot] [git commit] package/qemu: do not support
 x86_steamroller or x86_core_avx2
Message-ID: <20200208215113.1B1998D66B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f7efaf89f03e793252f9e97885a937cd6d67c56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These CPU's cause segfaults with qemu.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qemu/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index d6b4bf6dd4..ea9281c5fb 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -20,6 +20,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	default y if BR2_xtensa
 	default y if BR2_x86_64
+	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
 
 config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
