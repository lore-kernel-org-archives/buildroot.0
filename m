From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 10:26:52 +0200
Subject: [Buildroot] [git commit] rpi-firmware: allow to build for aarch64
	targets
Message-ID: <20170415082719.B829F80824@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7eac5601849d42e396b34033e74fcfababa0f3aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The RaspberryPi 3 is based on a AArch64 CPU and requires binaries from
this package.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index c2983aa..7b37a30 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_RPI_FIRMWARE
 	bool "rpi-firmware"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	help
 	  RaspberryPi Firmware
 	  Pre-compiled binaries of the current bootloader and GPU firmware
