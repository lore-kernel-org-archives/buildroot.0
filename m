From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Sep 2012 22:03:30 +0200
Subject: [Buildroot] [git commit] sheevaplug_defconfig: use 3.5.4 kernel
Message-ID: <20120930214032.976A799754@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=220ce9f4002284d1cd983156a3a5439cf9e1877d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Notice that you need u-boot >= 2012.04 to be able to boot kernel >= 3.2,
because older u-boots keep the l2 cache enabled, see u-boot commit
679530278 (arm, arm-kirkwood: disable l2c before linux boot) for details.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/sheevaplug_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 86389dd..ead1831 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -19,6 +19,6 @@ BR2_TARGET_UBOOT_FORMAT_KWB=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.39.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5.4"
 BR2_LINUX_KERNEL_DEFCONFIG="kirkwood"
 BR2_LINUX_KERNEL_UIMAGE=y
