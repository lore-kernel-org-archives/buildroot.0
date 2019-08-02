From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 23:48:14 +0200
Subject: [Buildroot] [git commit] package/qemu: enable nios2 support in
 host-qemu
Message-ID: <20190802214910.32EAB828E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5755e6d7c3f2e84a5f6739b181fd3490809b1920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change enables host qemu support for nios2 which among other
things allows to test this architecture in gitlab.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in.host | 1 +
 package/qemu/qemu.mk        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index effe58b211..b1c3ab685e 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -10,6 +10,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_microblazebe
 	default y if BR2_mips
 	default y if BR2_mipsel
+	default y if BR2_nios2
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 2c11f64ad0..c5d33d7d3c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -177,6 +177,7 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
 #       mipsel          mipsel
 #       mips64          mips64
 #       mips64el        mips64el
+#       nios2           nios2
 #       powerpc         ppc
 #       powerpc64       ppc64
 #       powerpc64le     ppc64 (system) / ppc64le (usermode)
