From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 14:59:08 +0100
Subject: [Buildroot] [git commit] python-paho-mqtt: add new package
Message-ID: <20151230142705.4CD488274E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2f796885c6c157d26698d7ec271d111e233b016
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Davide Viti <zinosat@tiscali.it>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                              |  1 +
 package/python-paho-mqtt/Config.in             |  9 +++++++++
 package/python-paho-mqtt/python-paho-mqtt.hash |  3 +++
 package/python-paho-mqtt/python-paho-mqtt.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index cf994b8..ef03632 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -660,6 +660,7 @@ menu "External python modules"
 	source "package/python-networkmanager/Config.in"
 	source "package/python-nfc/Config.in"
 	source "package/python-numpy/Config.in"
+	source "package/python-paho-mqtt/Config.in"
 	source "package/python-pam/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
diff --git a/package/python-paho-mqtt/Config.in b/package/python-paho-mqtt/Config.in
new file mode 100644
index 0000000..79d8b33
--- /dev/null
+++ b/package/python-paho-mqtt/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PAHO_MQTT
+	bool "python-paho-mqtt"
+	help
+	  The Paho Python Client provides a client class with support
+	  for both MQTT v3.1 and v3.1.1 on Python 2.7 or 3.x. It also
+	  provides some helper functions to make publishing messages
+	  to an MQTT server very straightforward.
+
+	  https://pypi.python.org/pypi/paho-mqtt
diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
new file mode 100644
index 0000000..52729cc
--- /dev/null
+++ b/package/python-paho-mqtt/python-paho-mqtt.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=a6407b74eb5e5411e157be1de5c11366, sha256 locally computed
+md5     a6407b74eb5e5411e157be1de5c11366  paho-mqtt-1.1.tar.gz
+sha256  0f7a629efe6e3a2c61b59d3550aa9f2c4529b5689a65fde45e6f1ac36b9a261e  paho-mqtt-1.1.tar.gz
diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
new file mode 100644
index 0000000..01da2b3
--- /dev/null
+++ b/package/python-paho-mqtt/python-paho-mqtt.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-paho-mqtt
+#
+################################################################################
+
+PYTHON_PAHO_MQTT_VERSION = 1.1
+PYTHON_PAHO_MQTT_SOURCE = paho-mqtt-$(PYTHON_PAHO_MQTT_VERSION).tar.gz
+PYTHON_PAHO_MQTT_SITE = https://pypi.python.org/packages/source/p/paho-mqtt
+PYTHON_PAHO_MQTT_LICENSE = EPLv1.0 or EDLv1.0
+PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt edl-v10 epl-v10
+PYTHON_PAHO_MQTT_SETUP_TYPE = distutils
+
+$(eval $(python-package))
