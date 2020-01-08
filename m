From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jan 2020 09:37:02 +0100
Subject: [Buildroot] [git commit] package/python-semver: bump to version
 2.9.0
Message-ID: <20200108082730.7CF3483D8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8154f6f005c2edbf2e96cf73858632df3c598e6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license text is now included in the tarball, so add it to _LICENSE_FILES
and add a hash for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-semver/python-semver.hash | 6 ++++--
 package/python-semver/python-semver.mk   | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-semver/python-semver.hash b/package/python-semver/python-semver.hash
index e18cc1c672..60aaa6b8c4 100644
--- a/package/python-semver/python-semver.hash
+++ b/package/python-semver/python-semver.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/semver/json
-md5	dc579ba9d0bb2137bad5324d4bdb7e40  semver-2.8.1.tar.gz
-sha256	5b09010a66d9a3837211bb7ae5a20d10ba88f8cb49e92cb139a69ef90d5060d8  semver-2.8.1.tar.gz
+md5	a411b305a3f6714bca126a0b59dc4429  semver-2.9.0.tar.gz
+sha256	ed1edeaa0c27f68feb74f09f715077fd07b728446dc2bb7fc470fc0f737873a0  semver-2.9.0.tar.gz
+# Locally computed
+sha256	cda490c32e61d3884dc17791fc8078f2a3e564fba98dd18b4dc64eb2720b2b6f  LICENSE.txt
diff --git a/package/python-semver/python-semver.mk b/package/python-semver/python-semver.mk
index afdd34564e..6e1faef126 100644
--- a/package/python-semver/python-semver.mk
+++ b/package/python-semver/python-semver.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_SEMVER_VERSION = 2.8.1
+PYTHON_SEMVER_VERSION = 2.9.0
 PYTHON_SEMVER_SOURCE = semver-$(PYTHON_SEMVER_VERSION).tar.gz
-PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/47/13/8ae74584d6dd33a1d640ea27cd656a9f718132e75d759c09377d10d64595
+PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/be/c8/392e3c1c4080202b99e8b3b5d0ab6cbcfc4b25d50031c2c21d130871bf88
 PYTHON_SEMVER_SETUP_TYPE = setuptools
-# no license file in tarball, but available in git
 PYTHON_SEMVER_LICENSE = BSD-3-Clause
+PYTHON_SEMVER_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
