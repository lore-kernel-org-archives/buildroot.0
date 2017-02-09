From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  9 Feb 2017 06:36:32 +0200
Subject: [Buildroot] [PATCH] lm-sensors: download from debian snapshot
	archive
Message-ID: <99da53828ab38a20d970d06066e692dcbc49ec7d.1486614992.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ftp.netroedge.com is (also) down. Download the package from the Debian
snapshot archive.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lm-sensors/lm-sensors.hash | 2 +-
 package/lm-sensors/lm-sensors.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lm-sensors/lm-sensors.hash b/package/lm-sensors/lm-sensors.hash
index 8cbd3d1f7573..eeaa633f461f 100644
--- a/package/lm-sensors/lm-sensors.hash
+++ b/package/lm-sensors/lm-sensors.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e0579016081a262dd23eafe1d22b41ebde78921e73a1dcef71e05e424340061f	lm_sensors-3.4.0.tar.bz2
+sha256	e0579016081a262dd23eafe1d22b41ebde78921e73a1dcef71e05e424340061f	lm-sensors_3.4.0.orig.tar.bz2
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 314d107dc356..a72bba26e63c 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LM_SENSORS_VERSION = 3.4.0
-LM_SENSORS_SOURCE = lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
-LM_SENSORS_SITE = ftp://ftp.netroedge.com/pub/lm-sensors
+LM_SENSORS_SOURCE = lm-sensors_$(LM_SENSORS_VERSION).orig.tar.bz2
+LM_SENSORS_SITE = http://snapshot.debian.org/archive/debian/20170208T211941Z/pool/main/l/lm-sensors
 LM_SENSORS_INSTALL_STAGING = YES
 LM_SENSORS_DEPENDENCIES = host-bison host-flex
 LM_SENSORS_LICENSE = libsensors LGPLv2.1+, programs GPLv2+
-- 
2.11.0
