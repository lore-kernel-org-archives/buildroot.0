From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  7 Dec 2017 09:20:17 +0100
Subject: [Buildroot] [PATCH 1/5] python-pytz: bump to version 2017.3
Message-ID: <20171207082021.4605-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add licence checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pytz/python-pytz.hash |  5 +++--
 package/python-pytz/python-pytz.mk   | 12 +++++++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index fbccc52bce..dd3ff2c2ad 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/pytz/json, sha256 locally computed
-md5	88b1d6c50c764579292edce3493c8a3a  pytz-2016.10.tar.bz2
-sha256  7016b2c4fa075c564b81c37a252a5fccf60d8964aa31b7f5eae59aeb594ae02b  pytz-2016.10.tar.bz2
+md5	7006b56c0d68a162d9fe57d4249c3171  pytz-2017.3.zip
+sha256  fae4cffc040921b8a2d60c6cf0b5d662c1190fe54d718271db4eb17d44a185b7  pytz-2017.3.zip
+sha256  a1c7102a51ef9ed37766f7388c71fd41bae2a7a95c30673c419ab84e1acc5f02  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 9a8bd07e0f..6e130a6b2f 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,11 +4,17 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2016.10
-PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.bz2
-PYTHON_PYTZ_SITE = https://pypi.python.org/packages/d0/e1/aca6ef73a7bd322a7fc73fd99631ee3454d4fc67dc2bee463e2adf6bb3d3
+PYTHON_PYTZ_VERSION = 2017.3
+PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).zip
+PYTHON_PYTZ_SITE = https://pypi.python.org/packages/60/88/d3152c234da4b2a1f7a989f89609ea488225eaea015bc16fbde2b3fdfefa
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
 
+define PYTHON_PYTZ_EXTRACT_CMDS
+	unzip $(DL_DIR)/$(PYTHON_PYTZ_SOURCE) -d $(@D)
+	mv $(@D)/pytz-$(PYTHON_PYTZ_VERSION)/* $(@D)
+	rmdir $(@D)/pytz-$(PYTHON_PYTZ_VERSION)
+endef
+
 $(eval $(python-package))
-- 
2.11.0
