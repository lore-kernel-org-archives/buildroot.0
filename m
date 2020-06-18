From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 23:01:03 +0200
Subject: [Buildroot] [git commit] package/python-yatl: new package
Message-ID: <20200618212926.EDEFD82655@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=709f9ebad5897f18cf576a4dc0f4ff11163e7b52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License is BSD-3-Clause as stated in upstream LICENSE.txt:
https://github.com/web2py/yatl/blob/master/LICENSE.txt

An issue was opened to add LICENSE.txt in pypi tarballs:
https://github.com/web2py/yatl/issues/21

Add host variant as it will be needed for python-web2py

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-yatl/Config.in        |  6 ++++++
 package/python-yatl/python-yatl.hash |  3 +++
 package/python-yatl/python-yatl.mk   | 14 ++++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 32a9ecc909..7cd67a5540 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -881,6 +881,7 @@ F:	package/pcmanfm/
 F:	package/python-backcall/
 F:	package/python-jedi/
 F:	package/python-parso/
+F:	package/python-yatl/
 F:	package/rocksdb/
 F:	package/rygel/
 F:	package/safeclib/
diff --git a/package/Config.in b/package/Config.in
index 8da95d846d..7e4476d337 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1216,6 +1216,7 @@ menu "External python modules"
 	source "package/python-xlwt/Config.in"
 	source "package/python-xmltodict/Config.in"
 	source "package/python-yarl/Config.in"
+	source "package/python-yatl/Config.in"
 	source "package/python-yieldfrom/Config.in"
 	source "package/python-zc-lockfile/Config.in"
 	source "package/python-zeroconf/Config.in"
diff --git a/package/python-yatl/Config.in b/package/python-yatl/Config.in
new file mode 100644
index 0000000000..88a79512f8
--- /dev/null
+++ b/package/python-yatl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_YATL
+	bool "python-yatl"
+	help
+	  Yet Another Template Language.
+
+	  https://github.com/web2py/yatl
diff --git a/package/python-yatl/python-yatl.hash b/package/python-yatl/python-yatl.hash
new file mode 100644
index 0000000000..9238e71b22
--- /dev/null
+++ b/package/python-yatl/python-yatl.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/yatl/json
+md5  930be78b3d6e33f3f920619d673c345a  yatl-20200430.1.tar.gz
+sha256  5220390b27f010046642c00aded9ffc694e383a3d7a47985c8809d8482c8478a  yatl-20200430.1.tar.gz
diff --git a/package/python-yatl/python-yatl.mk b/package/python-yatl/python-yatl.mk
new file mode 100644
index 0000000000..fca39bb5ef
--- /dev/null
+++ b/package/python-yatl/python-yatl.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-yatl
+#
+################################################################################
+
+PYTHON_YATL_VERSION = 20200430.1
+PYTHON_YATL_SOURCE = yatl-$(PYTHON_YATL_VERSION).tar.gz
+PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/7f/bd/aa36c1a1d876757e3fa365e6c455097ebd3f2e8e7ded23e75901ff9c9ecf
+PYTHON_YATL_SETUP_TYPE = setuptools
+PYTHON_YATL_LICENSE = BSD-3-Clause
+
+$(eval $(python-package))
+$(eval $(host-python-package))
