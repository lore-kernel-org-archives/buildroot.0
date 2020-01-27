From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jan 2020 17:48:12 +0100
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version to
 01ecfd2
Message-ID: <20200127163929.9CA4583C75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bf05ca75fbce1a91e03d8e0034bd00f902bd85a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Keep rpi-firmware up-to-date with the kernel
vesion bump (4.19.97).

Go back to sha1 version scheme instead of official tag (after
only two tag versions) to keep up with the up-to-date kernel
version (as the offical last tag is for 4.19.94).

Update boot/LICENCE.broadcom hash according to the
'Update to support customisation program ' change ([1]).

[1] https://github.com/raspberrypi/firmware/commit/dd9e9ebb5d5306e91acb135db890cf18f3a5eea2#diff-b7cccbd9821a372750de822dfd97a843

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.hash | 4 ++--
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 63d8ac50a0..59ab1da0c6 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b3c5c9d3cda1f77caf317b8d1f0496cd7ca791ddaeec8207a5a1940111483509 rpi-firmware-1.20190925.tar.gz
-sha256 ba76edfc10a248166d965b8eaf320771c44f4f432d4fce2fd31fd272e7038add boot/LICENCE.broadcom
+sha256 31a84340be08be319570a9d1439f25c0e3513fed73065a56aa5dd61dd605d5d9 rpi-firmware-01ecfd2ba2b7cf3a2f4aa75ada895ee4a3e729f5.tar.gz
+sha256 c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index ee59ee2f26..6fee60b08c 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 1.20190925
+RPI_FIRMWARE_VERSION = 01ecfd2ba2b7cf3a2f4aa75ada895ee4a3e729f5
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
