From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Apr 2020 23:54:12 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/{bluez5_utils,
 bluez5_utils-headers}: security bump to version 5.54
Message-ID: <20200406215532.22DED81121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=caf8533849a575602681445d23e47614d9facd8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issue:

- CVE-2020-0556: Improper access control in subsystem for BlueZ before
  version 5.54 may allow an unauthenticated user to potentially enable
  escalation of privilege and denial of service via adjacent access

  https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00352.html

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

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3a678c952f4394b119d884ef22910f30860e1c2e)
[Peter: mention security issue]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
 package/bluez5_utils/bluez5_utils.hash               | 2 +-
 package/bluez5_utils/bluez5_utils.mk                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index c61f93a23c..871986c817 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.52
+BLUEZ5_UTILS_HEADERS_VERSION = 5.54
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
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
index 7c5202b717..c6c001f560 100644
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
