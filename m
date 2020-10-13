From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 14:28:34 +0200
Subject: [Buildroot] [git commit] config/odroidc2: force host kernel version
 to 5.7
Message-ID: <20201013121733.6F0AB8AA9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30b0218b08d0b9b9d6545edadc8659d5d2514f65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

as the current kernel version used for this board is 5.7,
make sure that the host kernel version is the same to prevent
build failure due to version miss match.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/779210973

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/odroidc2_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 3ed08710e9..5f97fc3dd8 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -1,6 +1,9 @@
 # Architecture
 BR2_aarch64=y
 
+# Linux headers same as kernel, a 5.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
+
 # System
 BR2_TARGET_GENERIC_HOSTNAME="odroidc2"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAML0"
