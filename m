From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 May 2010 00:11:46 +0200
Subject: [Buildroot] [git commit master] busybox: disable MTD utils in
	default configuration
Message-ID: <20100507223516.13E638F341@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b65e735291fe91ae97b976be211c3e04e9d05d23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The MTD utils require MTD headers in the toolchain, and in several
external toolchains, they are not present. In order to make the build
work by default, let's disable the MTD Busybox applets in our default
configuration.

Fixes bug #1669

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox-1.16.x.config |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox-1.16.x.config b/package/busybox/busybox-1.16.x.config
index 0b3dcc5..e5f5102 100644
--- a/package/busybox/busybox-1.16.x.config
+++ b/package/busybox/busybox-1.16.x.config
@@ -604,10 +604,10 @@ CONFIG_DEVMEM=y
 CONFIG_EJECT=y
 # CONFIG_FEATURE_EJECT_SCSI is not set
 # CONFIG_FBSPLASH is not set
-CONFIG_FLASHCP=y
-CONFIG_FLASH_LOCK=y
-CONFIG_FLASH_UNLOCK=y
-CONFIG_FLASH_ERASEALL=y
+# CONFIG_FLASHCP is not set
+# CONFIG_FLASH_LOCK is not set
+# CONFIG_FLASH_UNLOCK is not set
+# CONFIG_FLASH_ERASEALL is not set
 # CONFIG_IONICE is not set
 # CONFIG_INOTIFYD is not set
 CONFIG_LAST=y
-- 
1.6.3.3
