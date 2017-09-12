From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 12 Sep 2017 11:50:56 +0200
Subject: [Buildroot] [PATCH 3/3] python-ibmiotf: new package
In-Reply-To: <20170912095056.13692-1-yegorslists@googlemail.com>
References: <20170912095056.13692-1-yegorslists@googlemail.com>
Message-ID: <20170912095056.13692-3-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                          |  1 +
 package/python-ibmiotf/Config.in           | 15 +++++++++++++++
 package/python-ibmiotf/python-ibmiotf.hash |  3 +++
 package/python-ibmiotf/python-ibmiotf.mk   | 13 +++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/python-ibmiotf/Config.in
 create mode 100644 package/python-ibmiotf/python-ibmiotf.hash
 create mode 100644 package/python-ibmiotf/python-ibmiotf.mk

diff --git a/package/Config.in b/package/Config.in
index 2a47775269..4f7439ac38 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -756,6 +756,7 @@ menu "External python modules"
 	source "package/python-humanize/Config.in"
 	source "package/python-hyperframe/Config.in"
 	source "package/python-hyperlink/Config.in"
+	source "package/python-ibmiotf/Config.in"
 	source "package/python-id3/Config.in"
 	source "package/python-idna/Config.in"
 	source "package/python-incremental/Config.in"
diff --git a/package/python-ibmiotf/Config.in b/package/python-ibmiotf/Config.in
new file mode 100644
index 0000000000..66d58687c4
--- /dev/null
+++ b/package/python-ibmiotf/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_IBMIOTF
+	bool "python-ibmiotf"
+	select BR2_PACKAGE_PYTHON_DICTTOXML # runtime
+	select BR2_PACKAGE_PYTHON_ISO8601 # runtime
+	select BR2_PACKAGE_PYTHON_PAHO_MQTT # runtime
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	select BR2_PACKAGE_PYTHON_REQUESTS_TOOLBELT # runtime
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_XMLTODICT # runtime
+	help
+	  Python Client for IBM Watson IoT Platform.
+
+	  https://github.com/ibm-watson-iot/iot-python
diff --git a/package/python-ibmiotf/python-ibmiotf.hash b/package/python-ibmiotf/python-ibmiotf.hash
new file mode 100644
index 0000000000..9649876f63
--- /dev/null
+++ b/package/python-ibmiotf/python-ibmiotf.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  ab230bc4c90af4237abe790ebc6b171706a35971b886f1724d879c2f328a616b  python-ibmiotf-0.2.8.tar.gz
+sha256  d8288e11fc42988629f7c0b649fa007332dd0187b010d025feaf7b1925376e8d  LICENSE
diff --git a/package/python-ibmiotf/python-ibmiotf.mk b/package/python-ibmiotf/python-ibmiotf.mk
new file mode 100644
index 0000000000..9853389c38
--- /dev/null
+++ b/package/python-ibmiotf/python-ibmiotf.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-ibmiotf
+#
+################################################################################
+
+PYTHON_IBMIOTF_VERSION = 0.2.8
+PYTHON_IBMIOTF_SITE = $(call github,ibm-watson-iot,iot-python,$(PYTHON_IBMIOTF_VERSION))
+PYTHON_IBMIOTF_SETUP_TYPE = setuptools
+PYTHON_IBMIOTF_LICENSE = EPL-1.0
+PYTHON_IBMIOTF_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
