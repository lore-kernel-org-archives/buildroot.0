From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:07:23 +0200
Subject: [Buildroot] [git commit] package/python-pip: bump to version 19.2.3
Message-ID: <20190917200244.CC1E68E94C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a27edfcc589e17bb80e31466a94976fde9a0fc08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also:
  Select PYTHON_SSL or PYTHON3_SSL as pip connects to https://pypi.org
  making SSL mandatory for runtime.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pip/Config.in       | 2 ++
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/Config.in b/package/python-pip/Config.in
index ac741da872..d1b7e7f74b 100644
--- a/package/python-pip/Config.in
+++ b/package/python-pip/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_PIP
 	bool "python-pip"
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  The PyPA recommended tool for installing Python packages.
 
diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index eee423a206..48666c358d 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5	22e3726252b492ce24312c2b43d0127f  pip-19.1.tar.gz
-sha256	d9137cb543d8a4d73140a3282f6d777b2e786bb6abb8add3ac5b6539c82cd624  pip-19.1.tar.gz
+md5	f417444c66a0db1a82c8d9d2283a2f95  pip-19.2.3.tar.gz
+sha256	e7a31f147974362e6c82d84b91c7f2bdf57e4d3163d3d454e6c3e71944d67135  pip-19.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256 5ba21fbb0964f936ad7d15362d1ed6d4931cc8c8f9ff2d4d91190e109be74431  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 20486fbd71..b1d4aa7bfd 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 19.1
+PYTHON_PIP_VERSION = 19.2.3
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/51/5f/802a04274843f634469ef299fcd273de4438386deb7b8681dd059f0ee3b7
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/00/9e/4c83a0950d8bdec0b4ca72afd2f9cea92d08eb7c1a768363f2ea458d08b4
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
