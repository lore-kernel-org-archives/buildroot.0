From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 18:55:18 +0200
Subject: [Buildroot] [git commit] package/python-spidev: bump to version 3.4
Message-ID: <20191025165742.AC7E587FEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abbe6c68e0af87b0d24e9a744b7f9dee386377e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package has been relicensed under the MIT license, and LICENSE.md has been
removed.  The git repo has a LICENSE file, but it isn't available in the
tarball, so use the readme file instead.

https://github.com/doceme/py-spidev/commit/611b74341f44d444670fd373b1fb755ea2589718

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                               | 1 +
 package/python-spidev/python-spidev.hash | 8 +++++---
 package/python-spidev/python-spidev.mk   | 8 ++++----
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ad73370f02..ec4f50a79e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -183,6 +183,7 @@ F:	package/monolite/
 F:	package/python-can/
 F:	package/python-pillow/
 F:	package/python-pydal/
+F:	package/python-spidev/
 F:	package/python-web2py/
 F:	package/sshguard/
 F:	package/sunwait/
diff --git a/package/python-spidev/python-spidev.hash b/package/python-spidev/python-spidev.hash
index dc08925d30..d3d2b685ed 100644
--- a/package/python-spidev/python-spidev.hash
+++ b/package/python-spidev/python-spidev.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/spidev/json, sha256 locally computed
-md5	f601676f1bb48b9aa3b3897f95216365  spidev-3.2.tar.gz
-sha256	09d2b5122f0dd79910713a11f9a0020f71537224bf829916def4fffc0ea59456  spidev-3.2.tar.gz
+# sha256 from https://pypi.org/project/spidev
+sha256	4314e52f573d95233c907f307558893313a8a606e197e77bb711526b0e179e80  spidev-3.4.tar.gz
+
+# locally computed
+sha256	153a6f02f41aebe292cf3307f973a80b4fb0c988d8d3e7d126c7a66c20b1cc27  README.md
diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
index 17fb049caa..7f9bec7c93 100644
--- a/package/python-spidev/python-spidev.mk
+++ b/package/python-spidev/python-spidev.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_SPIDEV_VERSION = 3.2
+PYTHON_SPIDEV_VERSION = 3.4
 PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
-PYTHON_SPIDEV_SITE = https://pypi.python.org/packages/36/83/73748b6e1819b57d8e1df8090200195cdae33aaa22a49a91ded16785eedd
+PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/fb/14/4c2e1640f0cb04862c76d9d76ed7c945b0f67876e503ac02f7f675fe86a0
 PYTHON_SPIDEV_SETUP_TYPE = distutils
-PYTHON_SPIDEV_LICENSE = GPL-2.0
-PYTHON_SPIDEV_LICENSE_FILES = LICENSE.md
+PYTHON_SPIDEV_LICENSE = MIT
+PYTHON_SPIDEV_LICENSE_FILES = README.md
 
 $(eval $(python-package))
