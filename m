From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 23:43:13 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/qemu: do not
 support x86_steamroller or x86_core_avx2
Message-ID: <20200310223054.87621908F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8444bb68a6e0e8d73f8b7294dc1f6101fba6a810
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

These CPU's cause segfaults with qemu.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1f7efaf89f03e793252f9e97885a937cd6d67c56)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index f99f3e05cf..9c57bc7ab4 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -15,6 +15,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_sh
 	default y if BR2_sparc
 	default y if BR2_x86_64
+	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
 
 config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
