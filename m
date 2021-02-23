From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2021 14:05:10 +0100
Subject: [Buildroot] [git commit] package/python-pyusb: bump to version 1.1.1
Message-ID: <20210308072135.ACB6B88918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af3a264b3bc2584039e58afb9a6bf3b4f06f836e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Along with the version bump the following changes were
needed to get the package built:

- since 1.1.1 PyUSB supports only Python3
- change download file name to lowercase
- the package now requires setuptools and setuptools_scm
- change LICENSE checksum as the copyright year changed to 2021

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyusb/Config.in         |  1 +
 package/python-pyusb/python-pyusb.hash |  6 +++---
 package/python-pyusb/python-pyusb.mk   | 10 +++++-----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/python-pyusb/Config.in b/package/python-pyusb/Config.in
index bba3480a1b..13080a9fde 100644
--- a/package/python-pyusb/Config.in
+++ b/package/python-pyusb/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYUSB
 	bool "python-pyusb"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
diff --git a/package/python-pyusb/python-pyusb.hash b/package/python-pyusb/python-pyusb.hash
index c5006c8184..9c634ef722 100644
--- a/package/python-pyusb/python-pyusb.hash
+++ b/package/python-pyusb/python-pyusb.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/pyusb/json
-md5     c8a571bfdba778555156af3facaea6fc PyUSB-1.0.0.tar.gz
+md5     a9db479f1fb914e91d3106e67a13ae09 pyusb-1.1.1.tar.gz
 # Locally computed
-sha256  5b34ffa74ac34f330bff949c94ee00ec4a9d147234db17ee2eed2a67c0275368  PyUSB-1.0.0.tar.gz
-sha256  de177fb928a0eed8d209fddbfa3861379e08b3b41f34ad17a329c2f78199371d  LICENSE
+sha256  7d449ad916ce58aff60b89aae0b65ac130f289c24d6a5b7b317742eccffafc38  pyusb-1.1.1.tar.gz
+sha256  03e39fdcee9c18f2f9d0c3500a993ddeac050695eb81070ea41347587c76a7fe  LICENSE
diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
index 0afcbe8b8f..dc81efde9e 100644
--- a/package/python-pyusb/python-pyusb.mk
+++ b/package/python-pyusb/python-pyusb.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYUSB_VERSION = 1.0.0
-PYTHON_PYUSB_SOURCE = PyUSB-$(PYTHON_PYUSB_VERSION).tar.gz
-PYTHON_PYUSB_SITE = https://pypi.python.org/packages/8a/19/66fb48a4905e472f5dfeda3a1bafac369fbf6d6fc5cf55b780864962652d
+PYTHON_PYUSB_VERSION = 1.1.1
+PYTHON_PYUSB_SOURCE = pyusb-$(PYTHON_PYUSB_VERSION).tar.gz
+PYTHON_PYUSB_SITE = https://files.pythonhosted.org/packages/b9/8d/25c4e446a07e918eb39b5af25c4a83a89db95ae44e4ed5a46c3c53b0a4d6
 PYTHON_PYUSB_LICENSE = BSD-3-Clause
 PYTHON_PYUSB_LICENSE_FILES = LICENSE
-PYTHON_PYUSB_SETUP_TYPE = distutils
-PYTHON_PYUSB_DEPENDENCIES = libusb
+PYTHON_PYUSB_SETUP_TYPE = setuptools
+PYTHON_PYUSB_DEPENDENCIES = host-python-setuptools-scm libusb
 
 $(eval $(python-package))
