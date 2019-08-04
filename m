From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat,  3 Aug 2019 21:16:26 -0400
Subject: [Buildroot] [PATCH 03/08] package/python-hiredis: new package
In-Reply-To: <20190804011631.86261-1-aduskett@gmail.com>
References: <20190804011631.86261-1-aduskett@gmail.com>
Message-ID: <20190804011631.86261-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Python extension that wraps protocol parsing code in hiredis.
It primarily speeds up parsing of multi bulk replies.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-hiredis/Config.in           |  7 +++++++
 package/python-hiredis/python-hiredis.hash |  6 ++++++
 package/python-hiredis/python-hiredis.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-hiredis/Config.in
 create mode 100644 package/python-hiredis/python-hiredis.hash
 create mode 100644 package/python-hiredis/python-hiredis.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0d5cc886c2..df1735cdde 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -59,6 +59,7 @@ F:	package/policycoreutils/
 F:	package/python3/
 F:	package/python-django-enumfields/
 F:	package/python-flask-sqlalchemy/
+F:	package/python-hiredis/
 F:	package/python-mutagen/
 F:	package/python-pip/
 F:	package/python-psycopg2/
diff --git a/package/Config.in b/package/Config.in
index ffe82f813f..e0080d2180 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -903,6 +903,7 @@ menu "External python modules"
 	source "package/python-gobject/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h2/Config.in"
+	source "package/python-hiredis/Config.in"
 	source "package/python-hpack/Config.in"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httplib2/Config.in"
diff --git a/package/python-hiredis/Config.in b/package/python-hiredis/Config.in
new file mode 100644
index 0000000000..580e6e733a
--- /dev/null
+++ b/package/python-hiredis/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_HIREDIS
+	bool "python-hiredis"
+	help
+	  Python extension that wraps protocol parsing code in hiredis.
+	  It primarily speeds up parsing of multi bulk replies.
+
+	  https://github.com/redis/hiredis-py
diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
new file mode 100644
index 0000000000..2ab6766dda
--- /dev/null
+++ b/package/python-hiredis/python-hiredis.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/hiredis/json
+md5	46bc0d51bda994611bae77c044b1398b  hiredis-1.0.0.tar.gz
+sha256	e97c953f08729900a5e740f1760305434d62db9f281ac351108d6c4b5bf51795  hiredis-1.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256	70edfa6d3e11f9d7497c2c2f298d06f33b11d10f37f76605102c5ab3b1f28262  COPYING
+sha256	dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
new file mode 100644
index 0000000000..cc28be83e8
--- /dev/null
+++ b/package/python-hiredis/python-hiredis.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-hiredis
+#
+################################################################################
+
+PYTHON_HIREDIS_VERSION = 1.0.0
+PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/9e/e0/c160dbdff032ffe68e4b3c576cba3db22d8ceffc9513ae63368296d1bcc8
+PYTHON_HIREDIS_SETUP_TYPE = setuptools
+PYTHON_HIREDIS_LICENSE = BSD-3-Clause, BSD-3-Clause
+PYTHON_HIREDIS_LICENSE_FILES = COPYING vendor/hiredis/COPYING
+
+$(eval $(python-package))
-- 
2.21.0
