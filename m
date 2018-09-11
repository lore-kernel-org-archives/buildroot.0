From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 11 Sep 2018 17:58:22 +0300
Subject: [Buildroot] [PATCH 1/1] python-pytz: bump to version 2018.5
In-Reply-To: <20180911145823.15032-1-asafka7@gmail.com>
References: <20180911145823.15032-1-asafka7@gmail.com>
Message-ID: <20180911145823.15032-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update license hash: change was a year bump.
Remove zip extraction logic since now the package is provided as tar.gz.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pytz/python-pytz.hash |  9 +++++----
 package/python-pytz/python-pytz.mk   | 12 +++---------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index dd3ff2c2ad..0b1a0b5501 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pytz/json, sha256 locally computed
-md5	7006b56c0d68a162d9fe57d4249c3171  pytz-2017.3.zip
-sha256  fae4cffc040921b8a2d60c6cf0b5d662c1190fe54d718271db4eb17d44a185b7  pytz-2017.3.zip
-sha256  a1c7102a51ef9ed37766f7388c71fd41bae2a7a95c30673c419ab84e1acc5f02  LICENSE.txt
+# md5, sha256 from https://pypi.org/pypi/pytz/json
+md5	45409cbfa3927bdd2f3ee914dd5b1060  pytz-2018.5.tar.gz
+sha256	ffb9ef1de172603304d9d2819af6f5ece76f2e85ec10692a524dd876e72bf277  pytz-2018.5.tar.gz
+# Locally computed sha256 checksums
+sha256	39f07c72a1bfda349cbd27bac9bcb1e6f8c5b4e5cc3fadf56900406e8cc0b792  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 1d3603389b..4ddc3f9df0 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,17 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2017.3
-PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).zip
-PYTHON_PYTZ_SITE = https://pypi.python.org/packages/60/88/d3152c234da4b2a1f7a989f89609ea488225eaea015bc16fbde2b3fdfefa
+PYTHON_PYTZ_VERSION = 2018.5
+PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/ca/a9/62f96decb1e309d6300ebe7eee9acfd7bccaeedd693794437005b9067b44
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
 
-define PYTHON_PYTZ_EXTRACT_CMDS
-	unzip $(PYTHON_PYTZ_DL_DIR)/$(PYTHON_PYTZ_SOURCE) -d $(@D)
-	mv $(@D)/pytz-$(PYTHON_PYTZ_VERSION)/* $(@D)
-	rmdir $(@D)/pytz-$(PYTHON_PYTZ_VERSION)
-endef
-
 $(eval $(python-package))
-- 
2.17.1
