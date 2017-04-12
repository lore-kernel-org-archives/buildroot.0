From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:02:53 +0200
Subject: [Buildroot] [git commit] minnowboard_max-graphical: increase ext4
	filesystem size
Message-ID: <20170412190257.BCD498270C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b05ec5d4d771bbf2a753da598a213c4b037c6c5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now we have changed the default ext2/3/4 filesystem size from automatic
to 60MB, the minnowboard_max graphical demo config doesn't fit anymore.
So increase it to double.

The exact number doesn't matter much, it has to be somewhat smaller
than 128MiB, so let's take a round number of 120000K.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/minnowboard_max-graphical_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index ac36336..e8eb133 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -69,5 +69,6 @@ BR2_PACKAGE_STARTUP_NOTIFICATION=y
 # Filesystem image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=120000
 # BR2_TARGET_ROOTFS_TAR is not set
 
