From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 10:43:24 +0100
Subject: [Buildroot] [git commit] board/pc: use frame pointer unwinder in
 linux.config
Message-ID: <20181123094044.523607FB0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c79f5a8876d8bd4216d0270cca01486baebb2337
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default ORC unwinder requires libelf to be built. While we could
build libelf using BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF, we probably
don't really need the ORC unwinder in the PC defconfigs, so let's use
the frame pointer unwinder instead.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/123771107

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/pc/linux.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/pc/linux.config b/board/pc/linux.config
index 0fff117080..f86352e1ea 100644
--- a/board/pc/linux.config
+++ b/board/pc/linux.config
@@ -82,3 +82,4 @@ CONFIG_EXT4_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_SQUASHFS=y
+CONFIG_UNWINDER_FRAME_POINTER=y
