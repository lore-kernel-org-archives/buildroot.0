From: Julien Olivain <juju@cotds.org>
Date: Wed, 27 Feb 2019 18:43:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/qemu: add riscv emulation on host
 variant
Message-ID: <20190227174309.8209-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

RISC-V support was added in qemu 2.12. This target emulation
in host qemu can now be enabled.

Signed-off-by: Julien Olivain <juju@cotds.org>
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
-- 
2.20.1
