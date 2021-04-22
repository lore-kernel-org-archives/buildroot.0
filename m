From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Apr 2021 21:34:02 +0200
Subject: [Buildroot] [git commit] package/python-colorzero: bump version to
 2.0
Message-ID: <20210422190820.4422280277@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73bf3292e16b9419c5c88d10e9755d7208ca3623
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change to python3 only

- update license file hash:
  @@ -1,4 +1,4 @@
  -Copyright 2016-2018 Dave Jones <dave@waveform.org.uk>
  +SPDX-License-Identifier: BSD-3-Clause

Changelog ([1]):

  - Dropped Python 2.x support. Current Python support level is 3.5 and above.

  - Added html and css format specifications to the :class:`Color` class'
    string-formatting capabilities.

[1] https://github.com/waveform80/colorzero/blob/master/docs/changelog.rst

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-colorzero/Config.in             | 1 +
 package/python-colorzero/python-colorzero.hash | 4 ++--
 package/python-colorzero/python-colorzero.mk   | 2 +-
 package/python-gpiozero/Config.in              | 1 +
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/python-colorzero/Config.in b/package/python-colorzero/Config.in
index b2ef711fbe..a1deada5fc 100644
--- a/package/python-colorzero/Config.in
+++ b/package/python-colorzero/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_COLORZERO
 	bool "python-colorzero"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A color manipulation library for Python.
 
diff --git a/package/python-colorzero/python-colorzero.hash b/package/python-colorzero/python-colorzero.hash
index 118ccea7d7..fc2455c836 100644
--- a/package/python-colorzero/python-colorzero.hash
+++ b/package/python-colorzero/python-colorzero.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  24d30b55793150f9ae7478f8aa2126fe5598a31f928907eadbf9d5a19aa9964c  python-colorzero-1.1.tar.gz
+sha256  86c9933b004aec8ce1c476d1d1129e00325c7724df3c09aa353d5f8e883ed08d  python-colorzero-2.0.tar.gz
 # Locally computed
-sha256  47778d78e05bb6c39c022814e3712a0327c6418c7251757e72167ab8ff12bb4d  LICENSE.txt
+sha256  ee1c76f465410c34802ddf81d70e1ea7a4542cf58459425038498d8f4e36bb45  LICENSE.txt
diff --git a/package/python-colorzero/python-colorzero.mk b/package/python-colorzero/python-colorzero.mk
index 6ddbcbe1c5..f38c98a093 100644
--- a/package/python-colorzero/python-colorzero.mk
+++ b/package/python-colorzero/python-colorzero.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_COLORZERO_VERSION = 1.1
+PYTHON_COLORZERO_VERSION = 2.0
 PYTHON_COLORZERO_SITE = $(call github,waveform80,colorzero,release-$(PYTHON_COLORZERO_VERSION))
 PYTHON_COLORZERO_LICENSE = BSD-3-Clause
 PYTHON_COLORZERO_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-gpiozero/Config.in b/package/python-gpiozero/Config.in
index 1e2735be45..4d60855bfe 100644
--- a/package/python-gpiozero/Config.in
+++ b/package/python-gpiozero/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_GPIOZERO
 	bool "python-gpiozero"
 	depends on BR2_arm
+	depends on BR2_PACKAGE_PYTHON3 # python-colorzero
 	select BR2_PACKAGE_PYTHON_COLORZERO # runtime
 	select BR2_PACKAGE_PYTHON_RPI_GPIO # runtime
 	help
