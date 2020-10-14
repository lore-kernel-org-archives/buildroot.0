From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 14 Oct 2020 15:29:37 +0300
Subject: [Buildroot] [PATCH] package/18xx-ti-utils: use short version string
Message-ID: <450c6a5e75a1f9769671e4b32c9e041120867db3.1602678577.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is compatible with release-monitoring.org, so it allows easier
tracking of update status.

There appears to be no easy way to use anything other than tag/commit
for _VERSION with the git download method. git.ti.com offers snapshot
download over https, so use use that instead. As added bonus, the https
download method is more firewall friendly.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/18xx-ti-utils/18xx-ti-utils.hash | 2 +-
 package/18xx-ti-utils/18xx-ti-utils.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/18xx-ti-utils/18xx-ti-utils.hash b/package/18xx-ti-utils/18xx-ti-utils.hash
index a7d4068fa75f..7ecca54b9b22 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.hash
+++ b/package/18xx-ti-utils/18xx-ti-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  32ca7f1ca72b82ffb2acbee4bbe4de049af1da681421be0f2f595952761f29ee  18xx-ti-utils-R8.8.tar.gz
+sha256  ce0185ba8a9bf456cc94a798bf66903775065e337e53ff812f18a6d88f5bac13  18xx-ti-utils-R8.8.tar.xz
 sha256  363cef40b276a7a91ebcff3f78626d9cfe5e5a51927c725236007259403d5fc4  COPYING
diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
index 0985c9735b3d..5d45191cdeca 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.mk
+++ b/package/18xx-ti-utils/18xx-ti-utils.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-18XX_TI_UTILS_VERSION = R8.8
-18XX_TI_UTILS_SITE = git://git.ti.com/wilink8-wlan/18xx-ti-utils
+18XX_TI_UTILS_VERSION = 8.8
+18XX_TI_UTILS_SITE = https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils/snapshot
+18XX_TI_UTILS_SOURCE = 18xx-ti-utils-R$(18XX_TI_UTILS_VERSION).tar.xz
 18XX_TI_UTILS_DEPENDENCIES = libnl
 18XX_TI_UTILS_LICENSE = BSD-3-Clause
 18XX_TI_UTILS_LICENSE_FILES = COPYING
-- 
2.28.0
