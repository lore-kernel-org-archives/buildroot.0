From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  4 Sep 2013 23:35:54 +0200
Subject: [Buildroot] [PATCH 2/4] configs: bump kernel use for RPi,
	use simpler defconfig
In-Reply-To: <cover.1378330371.git.yann.morin.1998@free.fr>
References: <cover.1378330371.git.yann.morin.1998@free.fr>
Message-ID: <92b005253312c4d36732e01a60a9fdf6ec6660cc.1378330371.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Bump for a slew of USB-related and other fixes.

The bcmrpi defconfig is a huge beast with lots of superfluous drivers.
The brcmrpi_quick defconfig is a stripped down minimalist defconfig with
all that is needed to bring up a RPi with complete HW support, and
nothing superfluous, which is what we need for a board's defconfig in
buildroot.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/rpi_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.8.1.2
