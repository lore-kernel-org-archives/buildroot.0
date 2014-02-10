From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Feb 2014 21:53:25 +0100
Subject: [Buildroot] [PATCH 2/2] configs/raspberrypi: remove packages not
	strictly required
In-Reply-To: <cover.1392065547.git.yann.morin.1998@free.fr>
References: <cover.1392065547.git.yann.morin.1998@free.fr>
Message-ID: <17d14348bf0bd137368f8405fb7fc1b1dd12aad9.1392065547.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

rpi-userland and libcoffi are not strictly required to boot up the
Raspberry Pi, so remove them from the defconfig.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/raspberrypi_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index b334b0a..2d1cc34 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -7,8 +7,6 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
-BR2_PACKAGE_RPI_USERLAND=y
-BR2_PACKAGE_LIBCOFI=y
 
 # Lock to 3.10 headers as the RPi kernel is based off the 3.10 branch
 BR2_KERNEL_HEADERS_VERSION=y
-- 
1.8.1.2
