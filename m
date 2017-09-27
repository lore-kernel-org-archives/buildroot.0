From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 27 Sep 2017 22:08:03 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3_qt5we: set gpu-mem to
	200
Message-ID: <20170927200048.94F077FD54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1738808fdb73d9eb0757ef5d3005994e5268136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt WebEngine requires more GPU memory than initial setup.

This fixes crashes such as this one.

	#0 0x0000742c63de <unknown>
	#1 0x0000742d0c38 <unknown>
	#2 0x0000749d7bde <unknown>
	#3 0x0000749e3c70 <unknown>
	#4 0x00007530227c <unknown>
	#5 0x000075302480 <unknown>
	#6 0x0000752fb1e4 <unknown>
	#7 0x00007430f878 <unknown>
	#8 0x0000742d5fee <unknown>
	#9 0x0000742d6f44 <unknown>
	#10 0x0000742d721e <unknown>
	#11 0x0000742d7ad6 <unknown>
	#12 0x0000742d57b2 <unknown>
	#13 0x0000742e74f6 <unknown>
	#14 0x0000742f6a74 <unknown>
	#15 0x0000742f41dc <unknown>

	Received signal 6
	#0 0x0000742c63de <unknown>
	#1 0x0000742c66a0 <unknown>
	#2 0x0000725b5d10 <unknown>
	[end of stack trace]
	qml: Render process exited with code 256 (abnormal exit)

Reported-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/raspberrypi3_qt5we_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 9df14c5..8724f25 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -47,4 +47,4 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="360M"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay --gpu_mem_1024=200"
