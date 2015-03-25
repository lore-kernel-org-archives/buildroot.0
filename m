From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 20:01:55 +0100
Subject: [Buildroot] [git commit] toolchain: enable musl for sh
Message-ID: <20150325190204.C0DD3801CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab98c9625c1fff2d6e30acbfa1987e6da498b546
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The SuperH architecture is supported by the musl libc since some time
now, so let's enable it.
Tested via qemu_sh4_r2d_defconfig.

Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index fcbce66..1b4bb9d 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -85,7 +85,7 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl (experimental)"
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
 		BR2_microblaze || BR2_mips || BR2_mipsel || BR2_powerpc || \
-		BR2_x86_64
+		BR2_sh || BR2_x86_64
 	depends on !BR2_powerpc_SPE # not supported, build breaks
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
