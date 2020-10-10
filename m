From: Dagg Stompler <daggs@gmx.com>
Date: Sat, 10 Oct 2020 15:56:48 +0300
Subject: [Buildroot] [PATCH] config/odroidc2: force host kernel version to
 5.7
Message-ID: <20201010125648.10614-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

as the current kernel version used for this board is 5.7,
make sure that the host kernel version is the same to prevent
build failure due to version miss match.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/779210973

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 configs/odroidc2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 3ed08710e9..6a54046adf 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -35,5 +35,6 @@ BR2_PACKAGE_ODROIDC2_FIRMWARE=y
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
 BR2_PACKAGE_HOST_MESON_TOOLS=y
 BR2_PACKAGE_HOST_MTOOLS=y
--
2.28.0
