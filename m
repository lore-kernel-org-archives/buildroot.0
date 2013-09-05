From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Sep 2013 15:45:24 +0200
Subject: [Buildroot] [git commit] configs: bump kernel use for RPi,
	use simpler defconfig
Message-ID: <20130905134646.BD7478B4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a10d2c5c40f361eef777a1a7fa0fd88b67efa825
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump for a slew of USB-related and other fixes.

The bcmrpi defconfig is a huge beast with lots of superfluous drivers.
The brcmrpi_quick defconfig is a stripped down minimalist defconfig with
all that is needed to bring up a RPi with complete HW support, and
nothing superfluous, which is what we need for a board's defconfig in
buildroot.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/rpi_defconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
index 9d608f1..2b19673 100644
--- a/configs/rpi_defconfig
+++ b/configs/rpi_defconfig
@@ -17,7 +17,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.6.11"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="0006326"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="1587f77"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
-BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
+BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
