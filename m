From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Oct 2017 13:50:34 +0200
Subject: [Buildroot] [git commit] python-paho-mqtt: bump version to 1.3.1
Message-ID: <20171027114556.21A0C7F8A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=597fc547ce2c5f72901bcc1ea7b01717d0b60fbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstreamed patch and add licence checksums.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-pytest-runner-a-conditional-requirement.patch | 30 ----------------------
 package/python-paho-mqtt/python-paho-mqtt.hash     |  7 +++--
 package/python-paho-mqtt/python-paho-mqtt.mk       |  4 +--
 3 files changed, 7 insertions(+), 34 deletions(-)

diff --git a/package/python-paho-mqtt/0001-Make-pytest-runner-a-conditional-requirement.patch b/package/python-paho-mqtt/0001-Make-pytest-runner-a-conditional-requirement.patch
deleted file mode 100644
index b2fbe24..0000000
--- a/package/python-paho-mqtt/0001-Make-pytest-runner-a-conditional-requirement.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 38373d36094b5a708c595f8c560d14e8ab61aac6 Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Fri, 8 Sep 2017 08:58:31 +0200
-Subject: [PATCH] Make pytest-runner a conditional requirement
-
-Check for pytest-runner only if setup.py was invoked with 'test'
-argument.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- setup.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 85d9c5f..10fb6df 100644
---- a/setup.py
-+++ b/setup.py
-@@ -12,7 +12,8 @@ with open('README.rst', 'rb') as readme_file:
- 
- requirements = []
- test_requirements = ['pytest', 'pylama']
--setup_requirements = ['pytest-runner']
-+needs_pytest = set(['pytest', 'test', 'ptr']).intersection(sys.argv)
-+setup_requirements = ['pytest-runner'] if needs_pytest else []
- 
- if sys.version_info < (3, 0):
-     test_requirements += ['mock']
--- 
-2.11.0
-
diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
index 9add16d..e791d36 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.hash
+++ b/package/python-paho-mqtt/python-paho-mqtt.hash
@@ -1,3 +1,6 @@
 # md5 from https://pypi.python.org/pypi/paho-mqtt/json, sha256 locally computed
-md5	b9338236e2836e8579ef140956189cc4  paho-mqtt-1.3.0.tar.gz
-sha256	2c9ef5494cfc1e41a9fff6544c5a2cd59ea5d401d9119a06ecf7fad6a2ffeb93  paho-mqtt-1.3.0.tar.gz
+md5	2cc27d8b369700b1fc99325add0dadd2  paho-mqtt-1.3.1.tar.gz
+sha256	31911f6031de306c27ed79dc77b690d7c55b0dcb0f0434ca34ec6361d0371122  paho-mqtt-1.3.1.tar.gz
+sha256	76f13729e84e9222e543303df00f87d1b2c0995b6a505cd859a285667e44babb  LICENSE.txt
+sha256	e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
+sha256	3b9be6b894d0769de796e653571ff6cef494913c0ce78c35a97db939e7d9087c  epl-v10
diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
index b87b37a..f335b35 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.mk
+++ b/package/python-paho-mqtt/python-paho-mqtt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PAHO_MQTT_VERSION = 1.3.0
+PYTHON_PAHO_MQTT_VERSION = 1.3.1
 PYTHON_PAHO_MQTT_SOURCE = paho-mqtt-$(PYTHON_PAHO_MQTT_VERSION).tar.gz
-PYTHON_PAHO_MQTT_SITE = https://pypi.python.org/packages/33/7f/3ce1ffebaa0343d509aac003800b305d821e89dac3c11666f92e12feca14
+PYTHON_PAHO_MQTT_SITE = https://pypi.python.org/packages/2a/5f/cf14b8f9f8ed1891cda893a2a7d1d6fa23de2a9fb4832f05cef02b79d01f
 PYTHON_PAHO_MQTT_LICENSE = EPL-1.0 or EDLv1.0
 PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt edl-v10 epl-v10
 PYTHON_PAHO_MQTT_SETUP_TYPE = setuptools
