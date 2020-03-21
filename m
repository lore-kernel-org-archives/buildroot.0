From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Mar 2020 15:22:45 +0100
Subject: [Buildroot] [git commit] package/python-cheetah: bump to version
 3.2.4
Message-ID: <20200321141316.AB5D182B41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d78c1869261d858dfeaa51ebb54f276fbfd9ce9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original python-cheetah project was abandoned and a new
fork was created as a drop-in replacement. Though the name of the
fork is Cheetah3, we do not rename the package name to avoid
dependency renaming.

The new fork supports both Python2 and Python3.

python-markdown is now an optional dependency.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cheetah/Config.in           |  5 ++---
 package/python-cheetah/python-cheetah.hash |  9 +++++----
 package/python-cheetah/python-cheetah.mk   | 13 ++++---------
 3 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/package/python-cheetah/Config.in b/package/python-cheetah/Config.in
index 12749a1681..7cbfc5c251 100644
--- a/package/python-cheetah/Config.in
+++ b/package/python-cheetah/Config.in
@@ -1,13 +1,12 @@
 config BR2_PACKAGE_PYTHON_CHEETAH
 	bool "python-cheetah"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  Cheetah is an open source template engine and code
 	  generation tool.
 
 	  It can be used standalone or combined with other tools and
-	  frameworks.  Web development is its principle use, but
+	  frameworks. Web development is its principle use, but
 	  Cheetah is very flexible and is also being used to generate
 	  C++ game code, Java, sql, form emails and even Python code.
 
-	  https://pypi.python.org/pypi/Cheetah/
+	  https://pypi.org/project/Cheetah3/
diff --git a/package/python-cheetah/python-cheetah.hash b/package/python-cheetah/python-cheetah.hash
index 477ee5483a..286b41fd9e 100644
--- a/package/python-cheetah/python-cheetah.hash
+++ b/package/python-cheetah/python-cheetah.hash
@@ -1,4 +1,5 @@
-# From https://pypi.python.org/pypi/Cheetah/2.4.4
-md5	853917116e731afbc8c8a43c37e6ddba	Cheetah-2.4.4.tar.gz
-# Calculated based on the hash above
-sha256	be308229f0c1e5e5af4f27d7ee06d90bb19e6af3059794e5fd536a6f29a9b550	Cheetah-2.4.4.tar.gz
+# From https://pypi.org/pypi/Cheetah3/json
+md5  8c0ac643263ffc3454fb321342284d0a  Cheetah3-3.2.4.tar.gz
+sha256	caabb9c22961a3413ac85cd1e5525ec9ca80daeba6555f4f60802b6c256e252b  Cheetah3-3.2.4.tar.gz
+# Locally computed sha256 checksums
+sha256  635349ae512fafc2e60eb74a50d0a5276fa06c00b5ecb20da53546449ddc45ea  LICENSE
diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
index eee87fcee7..1ad49a43b7 100644
--- a/package/python-cheetah/python-cheetah.mk
+++ b/package/python-cheetah/python-cheetah.mk
@@ -4,17 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CHEETAH_VERSION = 2.4.4
-PYTHON_CHEETAH_SOURCE = Cheetah-$(PYTHON_CHEETAH_VERSION).tar.gz
-PYTHON_CHEETAH_SITE = https://pypi.python.org/packages/source/C/Cheetah
+PYTHON_CHEETAH_VERSION = 3.2.4
+PYTHON_CHEETAH_SOURCE = Cheetah3-$(PYTHON_CHEETAH_VERSION).tar.gz
+PYTHON_CHEETAH_SITE = https://files.pythonhosted.org/packages/4e/72/e6a7d92279e3551db1b68fd336fd7a6e3d2f2ec742bf486486e6150d77d2
 PYTHON_CHEETAH_LICENSE = MIT
+PYTHON_CHEETAH_LICENSE_FILES = LICENSE
 PYTHON_CHEETAH_SETUP_TYPE = setuptools
 
-HOST_PYTHON_CHEETAH_NEEDS_HOST_PYTHON = python2
-
-# The dependency on host-python-markdown is needed to prevent
-# setuptools from downloading markdown if it is not installed yet.
-HOST_PYTHON_CHEETAH_DEPENDENCIES = host-python-markdown
-
 $(eval $(python-package))
 $(eval $(host-python-package))
