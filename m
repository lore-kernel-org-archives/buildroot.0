From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@essensium.com>
Date: Fri,  7 Feb 2020 16:03:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-pydns: new package.
Message-ID: <20200207150327.4335-1-raphael.melotte@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python DNS library.

Signed-off-by: Rapha?l M?lotte <raphael.melotte@essensium.com>
---
 DEVELOPERS                             |  3 +++
 package/Config.in                      |  1 +
 package/python-pydns/Config.in         |  7 +++++++
 package/python-pydns/python-pydns.hash |  5 +++++
 package/python-pydns/python-pydns.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-pydns/Config.in
 create mode 100644 package/python-pydns/python-pydns.hash
 create mode 100644 package/python-pydns/python-pydns.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d8ea23e0b3..68bd86f23e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2076,6 +2076,9 @@ N:	Rahul Jain <rahul.jain@imgtec.com>
 F:	package/uhttpd/
 F:	package/ustream-ssl/
 
+N:  Rapha?l M?lotte <raphael.melotte@essensium.com>
+F:  package/python-pydns/
+
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/paho-mqtt-cpp/
 
diff --git a/package/Config.in b/package/Config.in
index bad4f9cba6..6fd2ea44be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1059,6 +1059,7 @@ menu "External python modules"
 	source "package/python-pycryptodomex/Config.in"
 	source "package/python-pydal/Config.in"
 	source "package/python-pydantic/Config.in"
+	source "package/python-pydns/Config.in"
 	source "package/python-pyelftools/Config.in"
 	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
diff --git a/package/python-pydns/Config.in b/package/python-pydns/Config.in
new file mode 100644
index 0000000000..55aac0d5d8
--- /dev/null
+++ b/package/python-pydns/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYDNS
+	bool "python-pydns"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Python DNS library.
+
+	  http://pydns.sourceforge.net/
diff --git a/package/python-pydns/python-pydns.hash b/package/python-pydns/python-pydns.hash
new file mode 100644
index 0000000000..cbefbaa132
--- /dev/null
+++ b/package/python-pydns/python-pydns.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pydns/json
+md5	e9574b74f01111405815a5fdccec15ce  pydns-2.3.6.tar.gz
+sha256	f1960d8bff0aafad9252b9e80279748fe7ebe5e719487d132ccb1281523cdb62  pydns-2.3.6.tar.gz
+# Locally computed sha256 checksums
+sha256	c1adc2cbd2a87ea2f78b68bd677f505e806f4d7580f23d81fbb998a99d4b75bd  LICENSE
diff --git a/package/python-pydns/python-pydns.mk b/package/python-pydns/python-pydns.mk
new file mode 100644
index 0000000000..415fdc6962
--- /dev/null
+++ b/package/python-pydns/python-pydns.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pydns
+#
+################################################################################
+
+PYTHON_PYDNS_VERSION = 2.3.6
+PYTHON_PYDNS_SOURCE = pydns-$(PYTHON_PYDNS_VERSION).tar.gz
+PYTHON_PYDNS_SITE = https://files.pythonhosted.org/packages/4b/9e/be4f6bbe72c2a12bb83f8a91e027fe58507afe7325dcd08b914f2bf0f1f0
+PYTHON_PYDNS_SETUP_TYPE = distutils
+PYTHON_PYDNS_LICENSE = CNRI-Python-GPL-Compatible
+PYTHON_PYDNS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.23.0
