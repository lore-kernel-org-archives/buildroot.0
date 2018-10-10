From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 14:26:38 +0200
Subject: [Buildroot] [git commit] python-pycryptodomex: new package
Message-ID: <20181010122734.7FF9D822B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=567fee95e08942e4705bf925bc94ef5d42f36a26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cryptographic library for Python

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
[Thomas: adjust license information, it's not under Apache-2.0, but a
combination of BSD-2-Clause, Public Domain and OCB License.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                             |  1 +
 package/Config.in                                      |  1 +
 package/python-pycryptodomex/Config.in                 |  6 ++++++
 package/python-pycryptodomex/python-pycryptodomex.hash |  5 +++++
 package/python-pycryptodomex/python-pycryptodomex.mk   | 17 +++++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0757ebfcf2..990621fb11 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -219,6 +219,7 @@ F:	package/python-ply/
 F:	package/python-priority/
 F:	package/python-pyasn1/
 F:	package/python-pyasn1-modules/
+F:	package/python-pycryptodomex/
 F:	package/python-pyhamcrest/
 F:	package/python-pyopenssl/
 F:	package/python-pyqrcode/
diff --git a/package/Config.in b/package/Config.in
index 6207767ff2..8d995f82e6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -950,6 +950,7 @@ menu "External python modules"
 	source "package/python-pycli/Config.in"
 	source "package/python-pycparser/Config.in"
 	source "package/python-pycrypto/Config.in"
+	source "package/python-pycryptodomex/Config.in"
 	source "package/python-pydal/Config.in"
 	source "package/python-pyelftools/Config.in"
 	source "package/python-pyftpdlib/Config.in"
diff --git a/package/python-pycryptodomex/Config.in b/package/python-pycryptodomex/Config.in
new file mode 100644
index 0000000000..c7127fee59
--- /dev/null
+++ b/package/python-pycryptodomex/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYCRYPTODOMEX
+	bool "python-pycryptodomex"
+	help
+	  Cryptographic library for Python.
+
+	  http://www.pycryptodome.org
diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
new file mode 100644
index 0000000000..3dec1a1442
--- /dev/null
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
+md5	7e1884f55077ed2e48d36565525b1657  pycryptodomex-3.6.6.tar.gz
+sha256	d0d448484e161786922b41e112b5d7cf76ef5f0c725ea5107ef866bb14a38b12  pycryptodomex-3.6.6.tar.gz
+# Locally computed sha256 checksums
+sha256	fc884f6492490d0f227613ee900ff2a27e6879b79ee637c53a4697238bf12970  LICENSE.rst
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
new file mode 100644
index 0000000000..828f93632e
--- /dev/null
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-pycryptodomex
+#
+################################################################################
+
+PYTHON_PYCRYPTODOMEX_VERSION = 3.6.6
+PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/95/10/f3bd758050da1c08ea30c8b4daf9ff895f306b780f07430fcc9b38722e1b
+PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
+PYTHON_PYCRYPTODOMEX_LICENSE = \
+	BSD-2-Clause, \
+	Public Domain (pycrypto original code), \
+	OCB license (OCB cypher)
+PYTHON_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst
+
+$(eval $(python-package))
