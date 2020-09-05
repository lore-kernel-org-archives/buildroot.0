From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Sep 2020 23:17:53 +0200
Subject: [Buildroot] [git commit] package/python-piexif: new package
Message-ID: <20200905210944.C292F875A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d0c31633d170406ffd1678d56b7ca34aac0ee68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-piexif/Config.in          | 10 ++++++++++
 package/python-piexif/python-piexif.hash |  3 +++
 package/python-piexif/python-piexif.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4806c14fd6..1ca76b1be0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1425,6 +1425,7 @@ N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
 F:	package/python-crayons/
 F:	package/python-cycler/
 F:	package/python-matplotlib/
+F:	package/python-piexif/
 
 N:	Juha Rantanen <juha@codercoded.com>
 F:	package/acsccid/
diff --git a/package/Config.in b/package/Config.in
index 7a23c92f0f..164248e608 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1061,6 +1061,7 @@ menu "External python modules"
 	source "package/python-periphery/Config.in"
 	source "package/python-pexpect/Config.in"
 	source "package/python-pickleshare/Config.in"
+	source "package/python-piexif/Config.in"
 	source "package/python-pigpio/Config.in"
 	source "package/python-pillow/Config.in"
 	source "package/python-pip/Config.in"
diff --git a/package/python-piexif/Config.in b/package/python-piexif/Config.in
new file mode 100644
index 0000000000..2f7eff80b5
--- /dev/null
+++ b/package/python-piexif/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_PIEXIF
+	bool "python-piexif"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Piexif simplifies interacting with EXIF data in Python. It
+	  includes the tools necessary for extracting, creating,
+	  manipulating, converting and writing EXIF data to JPEG, WebP
+	  and TIFF files.
+
+	  https://github.com/hMatoba/Piexif
diff --git a/package/python-piexif/python-piexif.hash b/package/python-piexif/python-piexif.hash
new file mode 100644
index 0000000000..9663ed722d
--- /dev/null
+++ b/package/python-piexif/python-piexif.hash
@@ -0,0 +1,3 @@
+# Locally computed sha256 checksums
+sha256	abfd9a67795e23d7a76f9407d60841efa68c5d6e43376b295bb821a30602c569  python-piexif-1.1.3.tar.gz
+sha256	d517a0940b8eb92ace7fc88f75892d84d260d85b3062d36d9e6445bc5091f697  LICENSE.txt
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
