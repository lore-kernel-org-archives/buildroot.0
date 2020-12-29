From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 21:08:02 +0100
Subject: [Buildroot] [git commit] package/python-bleak: new package
Message-ID: <20201229195131.336E482671@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8eed9ce8983c70f20b50f09451e4f415534e8fd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-bleak/Config.in         |  7 +++++++
 package/python-bleak/python-bleak.hash |  5 +++++
 package/python-bleak/python-bleak.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a1c3a7af23..bf0716aadb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1595,6 +1595,7 @@ F:	package/luaossl/
 F:	package/murata-cyw-fw/
 F:	package/netdata/
 F:	package/python-ansicolors/
+F:	package/python-bleak/
 F:	package/python-iniconfig/
 F:	package/python-intelhex/
 F:	package/python-packaging/
diff --git a/package/Config.in b/package/Config.in
index 70f908a7d5..333f774157 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -899,6 +899,7 @@ menu "External python modules"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bitstring/Config.in"
+	source "package/python-bleak/Config.in"
 	source "package/python-bluezero/Config.in"
 	source "package/python-boto3/Config.in"
 	source "package/python-botocore/Config.in"
diff --git a/package/python-bleak/Config.in b/package/python-bleak/Config.in
new file mode 100644
index 0000000000..3266932883
--- /dev/null
+++ b/package/python-bleak/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_BLEAK
+	bool "python-bleak"
+	select BR2_PACKAGE_PYTHON_TXDBUS # runtime
+	help
+	  Bluetooth Low Energy platform Agnostic Klient.
+
+	  https://github.com/hbldh/bleak
diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
new file mode 100644
index 0000000000..9506822c1b
--- /dev/null
+++ b/package/python-bleak/python-bleak.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/bleak/json
+md5  e891b33804b69f0247eb770ca27fa0d5  bleak-0.10.0.tar.gz
+sha256  5c3a873965f2910865895e572e7a4f10533d6e150e6ba17936397426bf8d1eee  bleak-0.10.0.tar.gz
+# Locally computed sha256 checksums
+sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
new file mode 100644
index 0000000000..040d64ed41
--- /dev/null
+++ b/package/python-bleak/python-bleak.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-bleak
+#
+################################################################################
+
+PYTHON_BLEAK_VERSION = 0.10.0
+PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/80/37/c8c88709e4f1ca4636bf11c96d1ec046d7426cd02670ae80a3542280558b
+PYTHON_BLEAK_SETUP_TYPE = setuptools
+PYTHON_BLEAK_LICENSE = MIT
+PYTHON_BLEAK_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
