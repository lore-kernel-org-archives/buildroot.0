From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 22:44:39 +0200
Subject: [Buildroot] [git commit] package/python-greenlet: new package
Message-ID: <20200413203033.DAAB28EB65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=826ef33bedc0f2f39a38622f066978cd9cc05226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Thomas: add PSF-2.0 to the licenses and LICENSE.PSF to the license files.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-greenlet/Config.in            |  6 ++++++
 package/python-greenlet/python-greenlet.hash |  6 ++++++
 package/python-greenlet/python-greenlet.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fa87dcb6cb..375ab07092 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1200,6 +1200,7 @@ F:	package/python-cbor2/
 F:	package/python-cchardet/
 F:	package/python-flatbuffers/
 F:	package/python-frozenlist/
+F:	package/python-greenlet/
 F:	package/python-janus/
 F:	package/python-logstash/
 F:	package/python-multidict/
diff --git a/package/Config.in b/package/Config.in
index e2868dd1b5..ccf54f2417 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -964,6 +964,7 @@ menu "External python modules"
 	source "package/python-futures/Config.in"
 	source "package/python-gitdb2/Config.in"
 	source "package/python-gobject/Config.in"
+	source "package/python-greenlet/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h2/Config.in"
 	source "package/python-hiredis/Config.in"
diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
new file mode 100644
index 0000000000..ef82375b0b
--- /dev/null
+++ b/package/python-greenlet/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_GREENLET
+	bool "python-greenlet"
+	help
+	  Lightweight in-process concurrent programming.
+
+	  https://github.com/python-greenlet/greenlet
diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
new file mode 100644
index 0000000000..4cbadaedb1
--- /dev/null
+++ b/package/python-greenlet/python-greenlet.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/greenlet/json
+md5	10fa304f673fc18b28fa6d8c6658cb80  greenlet-0.4.15.tar.gz
+sha256	9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc  greenlet-0.4.15.tar.gz
+# Locally computed sha256 checksums
+sha256	bbde55d5456a1e912633ed3f66d1dbd9504e3e3dce4f4c2015043cdcbc56e697  LICENSE
+sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
new file mode 100644
index 0000000000..01d578a183
--- /dev/null
+++ b/package/python-greenlet/python-greenlet.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-greenlet
+#
+################################################################################
+
+PYTHON_GREENLET_VERSION = 0.4.15
+PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/f8/e8/b30ae23b45f69aa3f024b46064c0ac8e5fcb4f22ace0dca8d6f9c8bbe5e7
+PYTHON_GREENLET_SETUP_TYPE = distutils
+PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
+PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
+
+$(eval $(python-package))
