From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Tue,  1 Sep 2020 16:37:30 +0200
Subject: [Buildroot] [PATCH 2/3] package/python-piexif : new package
In-Reply-To: <20200901143731.2916-1-jugurtha.belkalem@smile.fr>
References: <20200901143731.2916-1-jugurtha.belkalem@smile.fr>
Message-ID: <20200901143731.2916-3-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To simplify exif manipulations with Python. Writing,
reading, and more.
Piexif is pure Python. To everywhere with Python.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 Notes :
 - This package is mandatory at runtime for python-stegano.
 - This module has been tested with Python3.
 - It has been checked with check-package :
   $ ./utils/check-package package/python-piexif/*
   26 lines processed
   0 warnings generated

 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-piexif/Config.in          | 10 ++++++++++
 package/python-piexif/python-piexif.hash |  3 +++
 package/python-piexif/python-piexif.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-piexif/Config.in
 create mode 100644 package/python-piexif/python-piexif.hash
 create mode 100644 package/python-piexif/python-piexif.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6357eba0bc..18411d638b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1401,6 +1401,7 @@ N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
 F:	package/python-crayons/
 F:	package/python-cycler/
 F:	package/python-matplotlib/
+F:	package/python-piexif/
 
 N:	Juha Rantanen <juha@codercoded.com>
 F:	package/acsccid/
diff --git a/package/Config.in b/package/Config.in
index fee0a964d0..7dac15254a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1057,6 +1057,7 @@ menu "External python modules"
 	source "package/python-periphery/Config.in"
 	source "package/python-pexpect/Config.in"
 	source "package/python-pickleshare/Config.in"
+	source "package/python-piexif/Config.in"
 	source "package/python-pigpio/Config.in"
 	source "package/python-pillow/Config.in"
 	source "package/python-pip/Config.in"
diff --git a/package/python-piexif/Config.in b/package/python-piexif/Config.in
new file mode 100644
index 0000000000..aad42cbaeb
--- /dev/null
+++ b/package/python-piexif/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_PIEXIF
+	bool "python-piexif"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PILLOW
+	help
+	  To simplify exif manipulations with Python.
+	  Writing, reading, and more? Piexif is pure Python.
+	  To everywhere with Python.
+
+	  https://github.com/hMatoba/Piexif
diff --git a/package/python-piexif/python-piexif.hash b/package/python-piexif/python-piexif.hash
new file mode 100644
index 0000000000..1d83511516
--- /dev/null
+++ b/package/python-piexif/python-piexif.hash
@@ -0,0 +1,3 @@
+# Locally computed sha256 checksums
+sha256	abfd9a67795e23d7a76f9407d60841efa68c5d6e43376b295bb821a30602c569  python-piexif-1.1.3.tar.gz
+sha256	c9d2e27b56e1c47bb99ffac43d61077019dc54015d5e34d0e84411cce3d1bbde  LICENSE.txt
diff --git a/package/python-piexif/python-piexif.mk b/package/python-piexif/python-piexif.mk
new file mode 100644
index 0000000000..2ab15cd30c
--- /dev/null
+++ b/package/python-piexif/python-piexif.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-piexif
+#
+################################################################################
+
+PYTHON_PIEXIF_VERSION = 1.1.3
+PYTHON_PIEXIF_SITE = $(call github,hMatoba,Piexif,$(PYTHON_PIEXIF_VERSION))
+PYTHON_PIEXIF_LICENSE = MIT
+PYTHON_PIEXIF_LICENSE_FILES = LICENSE.txt
+PYTHON_PIEXIF_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.11.0
