From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 16 Mar 2020 17:40:21 +0100
Subject: [Buildroot] [PATCH 1/4] package/bluez5_utils: bump to version 5.54
Message-ID: <20200316164024.540598-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since version 5.52:

5.54:
  Fix issue with HOGP to accept data only from bonded devices.
  Fix issue with A2DP sessions being connected at the same time.
  Fix issue with class UUID matches before connecting profile.
  Add support for handling MTU auto-tuning option for AVDTP.
  Add support for new policy for Just-Works repairing.
  Add support for Enhanced ATT bearer (EATT).

5.53:
  Fix issue with handling unregistration for advertisment.
  Fix issue with A2DP and handling recovering process.
  Fix issue with udpating input device information.
  Add support for loading blocked keys.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/bluez5_utils/bluez5_utils.hash | 2 +-
 package/bluez5_utils/bluez5_utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 00112bc0b6..3eb6912fb3 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  f7144ce2039202cfac18ccb52426efea11c98e4f6e1bb8041bcb994b8378560a  bluez-5.52.tar.xz
+sha256  68cdab9e63e8832b130d5979dc8c96fdb087b31278f342874d992af3e56656dc  bluez-5.54.tar.xz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 8f9249454d..e328f52eaf 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.52
+BLUEZ5_UTILS_VERSION = 5.54
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-- 
2.25.1
