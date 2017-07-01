From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 12:53:39 +0200
Subject: [Buildroot] [git commit] python-pyparted: bump to version 3.11.0
Message-ID: <20170701105118.913708172C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05ce14894e6e43a8c88755032e0d428e8c2a4a3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove erroneously added CFFI dependency.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyparted/Config.in            | 1 -
 package/python-pyparted/python-pyparted.hash | 2 +-
 package/python-pyparted/python-pyparted.mk   | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparted/Config.in b/package/python-pyparted/Config.in
index 1501595..944796f 100644
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
index a2adc41..11995fb 100644
--- a/package/python-pyparted/python-pyparted.hash
+++ b/package/python-pyparted/python-pyparted.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  5914e3a60437fe3e3758a9e86ee4a539dfa46cfe18e3df386a5cf1f75a963431  python-pyparted-v3.10.7.tar.gz
+sha256  a9ec181bf3c7c0635862413fc86cb0950b5af957541535f530ea86a0f9d14e73  python-pyparted-v3.11.0.tar.gz
diff --git a/package/python-pyparted/python-pyparted.mk b/package/python-pyparted/python-pyparted.mk
index 4a691f2..0378830 100644
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
