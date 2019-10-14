From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 14 Oct 2019 22:12:18 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-ibmiotf: bump to version
 0.4.0
In-Reply-To: <20191014191228.13432-1-asafka7@gmail.com>
References: <20191014191228.13432-1-asafka7@gmail.com>
Message-ID: <20191014191228.13432-3-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Update dependency list.
* Take tarball from PyPI.
* Update license hash: same content, changed to UNIX line endings.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-ibmiotf/Config.in           | 2 --
 package/python-ibmiotf/python-ibmiotf.hash | 8 +++++---
 package/python-ibmiotf/python-ibmiotf.mk   | 5 +++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-ibmiotf/Config.in b/package/python-ibmiotf/Config.in
index 66d58687c4..0f5f75be5e 100644
--- a/package/python-ibmiotf/Config.in
+++ b/package/python-ibmiotf/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_IBMIOTF
 	bool "python-ibmiotf"
-	select BR2_PACKAGE_PYTHON_DICTTOXML # runtime
 	select BR2_PACKAGE_PYTHON_ISO8601 # runtime
 	select BR2_PACKAGE_PYTHON_PAHO_MQTT # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
@@ -8,7 +7,6 @@ config BR2_PACKAGE_PYTHON_IBMIOTF
 	select BR2_PACKAGE_PYTHON_REQUESTS_TOOLBELT # runtime
 	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
-	select BR2_PACKAGE_PYTHON_XMLTODICT # runtime
 	help
 	  Python Client for IBM Watson IoT Platform.
 
diff --git a/package/python-ibmiotf/python-ibmiotf.hash b/package/python-ibmiotf/python-ibmiotf.hash
index 9649876f63..6b60aa5279 100644
--- a/package/python-ibmiotf/python-ibmiotf.hash
+++ b/package/python-ibmiotf/python-ibmiotf.hash
@@ -1,3 +1,5 @@
-# Locally computed
-sha256  ab230bc4c90af4237abe790ebc6b171706a35971b886f1724d879c2f328a616b  python-ibmiotf-0.2.8.tar.gz
-sha256  d8288e11fc42988629f7c0b649fa007332dd0187b010d025feaf7b1925376e8d  LICENSE
+# md5, sha256 from https://pypi.org/pypi/ibmiotf/json
+md5	a103427c15b2bc96d72de5e58975638c  ibmiotf-0.4.0.tar.gz
+sha256	753a29858d48ebd89aff8b73c207028814714d8a004a3c19b436c9bbeaa65ce6  ibmiotf-0.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256	2c153c48f67e56031036fc28d12f76238a5151494bdfc24b6b81ec734c387a2d  LICENSE
diff --git a/package/python-ibmiotf/python-ibmiotf.mk b/package/python-ibmiotf/python-ibmiotf.mk
index 9853389c38..62ffba5b0f 100644
--- a/package/python-ibmiotf/python-ibmiotf.mk
+++ b/package/python-ibmiotf/python-ibmiotf.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IBMIOTF_VERSION = 0.2.8
-PYTHON_IBMIOTF_SITE = $(call github,ibm-watson-iot,iot-python,$(PYTHON_IBMIOTF_VERSION))
+PYTHON_IBMIOTF_VERSION = 0.4.0
+PYTHON_IBMIOTF_SOURCE = ibmiotf-$(PYTHON_IBMIOTF_VERSION).tar.gz
+PYTHON_IBMIOTF_SITE = https://files.pythonhosted.org/packages/78/05/029ca6f78b788a3c55157fd11bb63922d002d75df982ffb8243f450a750e
 PYTHON_IBMIOTF_SETUP_TYPE = setuptools
 PYTHON_IBMIOTF_LICENSE = EPL-1.0
 PYTHON_IBMIOTF_LICENSE_FILES = LICENSE
-- 
2.20.1
