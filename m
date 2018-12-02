From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:28 -0000
Subject: [Buildroot] [git commit] paho-mqtt-c: bump to version 1.3.0
Message-ID: <20181202071555.B87998A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c11b14d891fdd631b9a6244ec3cbefe45e8198c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

paho-mqtt-c 1.3.0 is the current stable version of paho-mqtt-c.

The patch 0001-Declare-mqtt-tests-as-a-C-only-project.patch is no longer
required, a similar fix was applied upstream with:
a87450ebcefed573ad4cdac77e2c893a3c314762.

Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  3 +++
 ...01-Declare-mqtt-tests-as-a-C-only-project.patch | 27 ----------------------
 package/paho-mqtt-c/paho-mqtt-c.hash               |  2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk                 |  2 +-
 4 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 87002a6894..d9c6755f17 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1170,6 +1170,9 @@ F:	package/qt5/
 N:	Julien Floret <julien.floret@6wind.com>
 F:	package/lldpd/
 
+N:	Julien Grossholtz <julien.grossholtz@openest.io>
+F:	package/paho-mqtt-c
+
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
 F:	package/easy-rsa/
diff --git a/package/paho-mqtt-c/0001-Declare-mqtt-tests-as-a-C-only-project.patch b/package/paho-mqtt-c/0001-Declare-mqtt-tests-as-a-C-only-project.patch
deleted file mode 100644
index 9edb2c4a8b..0000000000
--- a/package/paho-mqtt-c/0001-Declare-mqtt-tests-as-a-C-only-project.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 6556e62a07972eafccaefdcdf32bd0d386c64ca2 Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Wed, 13 Sep 2017 07:59:50 +0200
-Subject: [PATCH] Declare mqtt-tests as a C-only project
-
-This way CMake doesn't break the build on the systems without
-C++ compiler.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-Reported-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
----
- test/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
-index 5c88c44..3aca80f 100644
---- a/test/CMakeLists.txt
-+++ b/test/CMakeLists.txt
-@@ -1,4 +1,4 @@
--PROJECT(mqtt-tests)
-+PROJECT(mqtt-tests C)
- 
- IF (WIN32)
-   SET(MQTT_TEST_BROKER "tcp://mqtt.iotree.co.uk:1883" CACHE STRING "Hostname of a test MQTT broker to use")
--- 
-2.1.4
-
diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 3bee8914f9..d628d06611 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  0cb0396554ebe0e8ac6b0de1cbc16601ef169b6a63baf6f0f3ddeb405f5471a5  paho-mqtt-c-v1.2.0.tar.gz
+sha256  87cf846b02dde6328b84832287d8725d91f12f41366eecb4d59eeda1d6c7efdf  paho-mqtt-c-v1.3.0.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  44277b2bec6093e4ac313afec251a4de599d24c4e768f8574d95b13a9d2d97b5  epl-v10
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 5df7a55c62..9e8ae29999 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = v1.2.0
+PAHO_MQTT_C_VERSION = v1.3.0
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-1.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v10 edl-v10
