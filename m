From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:54:38 +0200
Subject: [Buildroot] [git commit] package/qemu: enable or1k support in
 host-qemu
Message-ID: <20200417204103.F00A98F035@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a41fae16d64c34329b17fa1a21af71d62c3edf8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change enables host qemu support for or1k which among other
things allows to test this architecture in gitlab.

The or1k support was named or32 until Qemu 2.9.0 and then renamed or1k
in upstream commit [1]. Since we're already using Qemu 4.2.0, we use
the or1k name.

Tested using qemu_or1k_defconfig.

[1] https://git.qemu.org/?p=qemu.git;a=commit;h=4a09d0bb34ab030e09e87173b2e3ec0fd7616cff

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in.host | 1 +
 package/qemu/qemu.mk        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index ea9281c5fb..5ed160159a 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -11,6 +11,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_mips
 	default y if BR2_mipsel
 	default y if BR2_nios2
+	default y if BR2_or1k
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 712491a208..e8b43d3b36 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -199,6 +199,7 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman host-p
 #       mips64          mips64
 #       mips64el        mips64el
 #       nios2           nios2
+#       or1k            or1k
 #       powerpc         ppc
 #       powerpc64       ppc64
 #       powerpc64le     ppc64 (system) / ppc64le (usermode)
