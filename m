From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 20 Jan 2020 11:39:40 +0100
Subject: [Buildroot] [PATCH v3 2/3] package/rpi-firmware: bump version to
 be2713b
In-Reply-To: <20200120103941.12052-1-ps.report@gmx.net>
References: <20200120103941.12052-1-ps.report@gmx.net>
Message-ID: <20200120103941.12052-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Go back to sha1 version scheme instead of official tag (after
only two tag versions) to keep up with the up-to-date kernel
version (as the offical last tag is from september 2019).

Update boot/LICENCE.broadcom hash according to the
'Update to support customisation program ' change ([1]).

[1] https://github.com/raspberrypi/firmware/commit/dd9e9ebb5d5306e91acb135db890cf18f3a5eea2#diff-b7cccbd9821a372750de822dfd97a843

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - no changes

Changes v2 -> v3:
  - bump version to be2713b/4.19.95
  - add sha1 explanation
  - update boot/LICENCE.broadcom hash
---
 package/rpi-firmware/rpi-firmware.hash | 4 ++--
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 63d8ac50a0..b6938b1019 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b3c5c9d3cda1f77caf317b8d1f0496cd7ca791ddaeec8207a5a1940111483509 rpi-firmware-1.20190925.tar.gz
-sha256 ba76edfc10a248166d965b8eaf320771c44f4f432d4fce2fd31fd272e7038add boot/LICENCE.broadcom
+sha256 eea38f16585e7f471cf9d05b19a6a942536e5ad25d845a6905940446f951fb55 rpi-firmware-be2713bed42381f36c38670d26e9b85780b6233c.tar.gz
+sha256 c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index ee59ee2f26..beea183edc 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 1.20190925
+RPI_FIRMWARE_VERSION = be2713bed42381f36c38670d26e9b85780b6233c
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.24.1
