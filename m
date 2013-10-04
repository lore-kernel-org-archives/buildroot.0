From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 22:06:52 +0200
Subject: [Buildroot] [git commit] atngw100_defconfig: use
	BR2_KERNEL_HEADERS_VERSION to specify kernel headers
Message-ID: <20131004200844.1676B99B18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ba4d1ad37810b19a7bbf9b1d4fb3e9c94f7f528
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change, but the HEADERS_3_9 option will go away by the
time 3.9 is no longer supported, possibly leading to breakage.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/atngw100_defconfig |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 4928915..5490241 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -3,7 +3,8 @@ BR2_avr32=y
 
 # Lock down kernel headers version, to match the kernel version used
 # below.
-BR2_KERNEL_HEADERS_3_9=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.9.11"
 
 # Filesystems
 BR2_TARGET_ROOTFS_JFFS2=y
