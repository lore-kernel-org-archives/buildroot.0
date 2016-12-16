From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 16 Dec 2016 16:02:50 +0100
Subject: [Buildroot] [PATCH 4/6] python-dataproperty: bump to version 0.13.5
In-Reply-To: <1481900572-7854-1-git-send-email-yegorslists@googlemail.com>
References: <1481900572-7854-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1481900572-7854-4-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add new dependency: python-mbstrdecoder.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-dataproperty/Config.in                | 1 +
 package/python-dataproperty/python-dataproperty.hash | 4 ++--
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-dataproperty/Config.in b/package/python-dataproperty/Config.in
index a490b98..7ef7f08 100644
--- a/package/python-dataproperty/Config.in
+++ b/package/python-dataproperty/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_DATAPROPERTY
 	bool "python-dataproperty"
+	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index dc075b9..3015042 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/dataproperty/json, sha256 locally computed
-md5	9d910f0994b892df260977146f9a2bd1  DataProperty-0.9.0.tar.gz
-sha256	02ab30a4873eeb1c538cc54552c9f9ef226b3243b7546e8317c583550960319d  DataProperty-0.9.0.tar.gz
+md5	65be4db859ad25bf2c1af25486710f00  DataProperty-0.13.5.tar.gz
+sha256	470e510d9636af446401d9f0bd79172b1f03c5b903819f2ccd4a06ac32ed64d9  DataProperty-0.13.5.tar.gz
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 727b8c7..13ddf5f 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.9.0
+PYTHON_DATAPROPERTY_VERSION = 0.13.5
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/d4/7a/8a214fc3c6eb2aeb42282a25355296f391cdcfd6c6b51c80bd644ce6b229
+PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/e0/30/71065e642a985366fc3900316592ff6b88891f96e42107936613cd7a020b
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.1.4
