From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Dec 2020 14:49:13 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5mqtt: bump version to
 5.15.2 (and fix download)
Message-ID: <20201213133307.73DAB8130D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e8b5f9bee9cc127c07316ab043040adeada91a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- bump version to 5.15.2
- change download url to original site

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5mqtt/qt5mqtt.hash | 2 +-
 package/qt5/qt5mqtt/qt5mqtt.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5mqtt/qt5mqtt.hash b/package/qt5/qt5mqtt/qt5mqtt.hash
index ddf2aa4fc0..3ac10f78a8 100644
--- a/package/qt5/qt5mqtt/qt5mqtt.hash
+++ b/package/qt5/qt5mqtt/qt5mqtt.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  603f81095ec837cb28b93189fd26dbbae32ecaedd80f6dd88c85050b51e18008  qt5mqtt-5.15.1.tar.gz
+sha256  bd00180ed88ae890952fe7a8ad29645d4b890c7774e9a9bdcb8e83be3c5cf69d  qt5mqtt-5.15.2.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5mqtt/qt5mqtt.mk b/package/qt5/qt5mqtt/qt5mqtt.mk
index 40ad6161b7..54cc1de632 100644
--- a/package/qt5/qt5mqtt/qt5mqtt.mk
+++ b/package/qt5/qt5mqtt/qt5mqtt.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 QT5MQTT_VERSION = $(QT5_VERSION)
-QT5MQTT_SITE = $(call github,qt,qtmqtt,v$(QT5_VERSION))
+QT5MQTT_SITE = https://code.qt.io/cgit/qt/qtmqtt.git
+QT5MQTT_SITE_METHOD = git
 QT5MQTT_INSTALL_STAGING = YES
 QT5MQTT_LICENSE = GPL-3.0 with exception
 QT5MQTT_LICENSE_FILES = LICENSE.GPL3 LICENSE.GPL3-EXCEPT
