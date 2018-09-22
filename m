From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 22 Sep 2018 22:36:29 +0300
Subject: [Buildroot] [PATCH 2/4] python-ply: new package
In-Reply-To: <20180922193631.14369-1-asafka7@gmail.com>
References: <20180922193631.14369-1-asafka7@gmail.com>
Message-ID: <20180922193631.14369-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No license file was found in the repo and README.md seems
to be the closest (license type was mentioned in setup.py).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/python-ply/Config.in       |  6 ++++++
 package/python-ply/python-ply.hash |  5 +++++
 package/python-ply/python-ply.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-ply/Config.in
 create mode 100644 package/python-ply/python-ply.hash
 create mode 100644 package/python-ply/python-ply.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4c49cc3908..03ea952377 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -204,6 +204,7 @@ F:	package/python-engineio/
 F:	package/python-fire/
 F:	package/python-jsonmodels/
 F:	package/python-paramiko/
+F:	package/python-ply/
 F:	package/python-pyasn1/
 F:	package/python-pycryptodomex/
 F:	package/python-pyroute2/
diff --git a/package/Config.in b/package/Config.in
index 826182cdb3..cdfdcbe726 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -907,6 +907,7 @@ menu "External python modules"
 	source "package/python-pickleshare/Config.in"
 	source "package/python-pillow/Config.in"
 	source "package/python-pip/Config.in"
+	source "package/python-ply/Config.in"
 	source "package/python-portend/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-priority/Config.in"
diff --git a/package/python-ply/Config.in b/package/python-ply/Config.in
new file mode 100644
index 0000000000..d6d265ad1c
--- /dev/null
+++ b/package/python-ply/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PLY
+	bool "python-ply"
+	help
+	  Python Lex & Yacc.
+
+	  http://www.dabeaz.com/ply/
diff --git a/package/python-ply/python-ply.hash b/package/python-ply/python-ply.hash
new file mode 100644
index 0000000000..1eba3b0ffe
--- /dev/null
+++ b/package/python-ply/python-ply.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/ply/json
+md5	6465f602e656455affcd7c5734c638f8  ply-3.11.tar.gz
+sha256	00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3  ply-3.11.tar.gz
+# Locally computed sha256 checksums
+sha256	1095b93b81d2043c5c55e0859875b416f75edb6d5eccb4bf2ace1b5445d1c84f  README.md
diff --git a/package/python-ply/python-ply.mk b/package/python-ply/python-ply.mk
new file mode 100644
index 0000000000..bf4c9d6a4f
--- /dev/null
+++ b/package/python-ply/python-ply.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ply
+#
+################################################################################
+
+PYTHON_PLY_VERSION = 3.11
+PYTHON_PLY_SOURCE = ply-$(PYTHON_PLY_VERSION).tar.gz
+PYTHON_PLY_SITE = https://files.pythonhosted.org/packages/e5/69/882ee5c9d017149285cab114ebeab373308ef0f874fcdac9beb90e0ac4da
+PYTHON_PLY_SETUP_TYPE = setuptools
+PYTHON_PLY_LICENSE = BSD
+PYTHON_PLY_LICENSE_FILES = README.md
+
+$(eval $(python-package))
-- 
2.17.1
