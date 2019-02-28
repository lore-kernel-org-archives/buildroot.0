From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Feb 2019 23:45:40 +0100
Subject: [Buildroot] [git commit] package/qemu: add riscv emulation on host
 variant
Message-ID: <20190305095737.1242C8E504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48b38a2cda7b33e746a5d1c8d6c7b5a5b795ff85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

RISC-V support was added in qemu 2.12. This target emulation
in host qemu can now be enabled.

Signed-off-by: Julien Olivain <juju@cotds.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index f99f3e05cf..8a0df38fb8 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -12,6 +12,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
+	default y if BR2_riscv
 	default y if BR2_sh
 	default y if BR2_sparc
 	default y if BR2_x86_64
