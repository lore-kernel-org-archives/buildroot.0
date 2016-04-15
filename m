From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Apr 2016 10:17:18 +0200
Subject: [Buildroot] [git commit] configs/minnowboard_max: configure eth0
	through dhcp
Message-ID: <20160415081911.5BA4A80338@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba40ce77ea7babb36a74adeb4772b54142f86975
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The minnowboard max board has an ethernet port, so configure it at startup.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/minnowboard_max_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 05df987..dfa1b6c 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -4,6 +4,7 @@ BR2_x86_atom=y
 
 # Misc
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard-max/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard-max/post-image.sh"
 
