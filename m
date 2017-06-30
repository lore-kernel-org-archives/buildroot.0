From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 30 Jun 2017 14:45:24 +0200
Subject: [Buildroot] [PATCH 2/2] python-pyparted: bump to version 3.11.0
In-Reply-To: <20170630124524.5831-1-yegorslists@googlemail.com>
References: <20170630124524.5831-1-yegorslists@googlemail.com>
Message-ID: <20170630124524.5831-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Remove erroneously added CFFI dependency.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pyparted/Config.in            | 1 -
 package/python-pyparted/python-pyparted.hash | 2 +-
 package/python-pyparted/python-pyparted.mk   | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparted/Config.in b/package/python-pyparted/Config.in
index 150159559..944796ff3 100644
--- a/package/python-pyparted/Config.in
+++ b/package/python-pyparted/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYPARTED
 	bool "python-pyparted"
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PARTED
 	help
 	  Python bindings for GNU parted (libparted).
diff --git a/package/python-pyparted/python-pyparted.hash b/package/python-pyparted/python-pyparted.hash
index a2adc4108..11995fb8f 100644
--- a/package/python-pyparted/python-pyparted.hash
+++ b/package/python-pyparted/python-pyparted.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  5914e3a60437fe3e3758a9e86ee4a539dfa46cfe18e3df386a5cf1f75a963431  python-pyparted-v3.10.7.tar.gz
+sha256  a9ec181bf3c7c0635862413fc86cb0950b5af957541535f530ea86a0f9d14e73  python-pyparted-v3.11.0.tar.gz
diff --git a/package/python-pyparted/python-pyparted.mk b/package/python-pyparted/python-pyparted.mk
index 4a691f28e..037883080 100644
--- a/package/python-pyparted/python-pyparted.mk
+++ b/package/python-pyparted/python-pyparted.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYPARTED_VERSION = v3.10.7
+PYTHON_PYPARTED_VERSION = v3.11.0
 PYTHON_PYPARTED_SITE = $(call github,rhinstaller,pyparted,$(PYTHON_PYPARTED_VERSION))
 PYTHON_PYPARTED_SETUP_TYPE = distutils
 PYTHON_PYPARTED_LICENSE = GPL-2.0+
 PYTHON_PYPARTED_LICENSE_FILES = COPYING
-PYTHON_PYPARTED_DEPENDENCIES = host-python-cffi parted
+PYTHON_PYPARTED_DEPENDENCIES = parted
 
 $(eval $(python-package))
-- 
2.11.0
