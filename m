From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  7 Nov 2013 00:12:28 +0100
Subject: [Buildroot] rootfs: add U-Boot image support for cpio + lots of
	refactoring
Message-ID: <1383779555-9222-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 This patch series is based on Spenser Gilliland's patch that adds U-Boot
image support to the root filesystem images. It was decided at the BR
developer meeting that this is only ever going to be useful for cpio
images (to be used as an initramfs), so I rewrote the patch to that end.
But then I saw lots and lots of refactoring opportunities, which in the
end led to this 7-patch series.

 I have only compile-tested the cpio image, Spenser can you do a runtime
test on the Zedboard? Your defconfig should still work.

 Regards,
 Arnout

----------------------------------------------------------------
Arnout Vandecappelle (Essensium/Mind) (7):
      rootfs-ext2: make the symlink as a _POST_TARGET
      rootfs-common: remove the now unused ROOTFS_<PKG>_POST_GEN_HOOKS
      rootfs-cpio: whitespace cleanup in Config.in
      rootfs-common: refactor the common compression commands
      rootfs-ext2: symlink with the compressed rootfs
      rootfs-cpio: add U-Boot image support
      uboot-tools: factor out common mkimage infrastructure

 fs/common.mk                       | 46 +++++++++++++++++++++++++++-------------------
 fs/cpio/Config.in                  | 51 +++++++++++++++++++++++++++++++--------------------
 fs/cpio/cpio.mk                    |  8 ++++++++
 fs/ext2/ext2.mk                    |  8 ++++----
 fs/iso9660/iso9660.mk              |  6 +-----
 linux/linux.mk                     |  4 ++--
 package/uboot-tools/uboot-tools.mk | 18 ++++++++++++++++++
 7 files changed, 91 insertions(+), 50 deletions(-)
