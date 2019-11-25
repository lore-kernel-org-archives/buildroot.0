From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 25 Nov 2019 11:38:48 -0800
Subject: [Buildroot] [PATCH/next 1/3] python-pbr: new package
Message-ID: <20191125193850.862709-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@greenlots.com>

PBR is a library that injects some useful and sensible default
behaviors into a setuptools run.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
---
 DEVELOPERS                         |  1 +
 package/python-pbr/python-pbr.hash |  6 ++++++
 package/python-pbr/python-pbr.mk   | 14 ++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/python-pbr/python-pbr.hash
 create mode 100644 package/python-pbr/python-pbr.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5837bbfab2..3149095d9e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -62,6 +62,7 @@ F:	package/python-daphne/
 F:	package/python-django-enumfields/
 F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
+F:	package/python-pbr/
 F:	package/python-pip/
 F:	package/python-psycopg2/
 F:	package/python-sqlalchemy/
diff --git a/package/python-pbr/python-pbr.hash b/package/python-pbr/python-pbr.hash
new file mode 100644
index 0000000000..cca9de0178
--- /dev/null
+++ b/package/python-pbr/python-pbr.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/pbr/json
+md5	477d2aa285ad97250a172b199f4060b7  pbr-5.4.3.tar.gz
+sha256	2c8e420cd4ed4cec4e7999ee47409e876af575d4c35a45840d59e8b5f3155ab8  pbr-5.4.3.tar.gz
+# Locally computed sha256 checksums
+sha256	5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  LICENSE
+sha256	eb4a8c8791f6caab1cf36df26db2b6f4e2ddda52657b060ff7f02abc63910aef  pbr/tests/testpackage/LICENSE.txt
diff --git a/package/python-pbr/python-pbr.mk b/package/python-pbr/python-pbr.mk
new file mode 100644
index 0000000000..70a79d1628
--- /dev/null
+++ b/package/python-pbr/python-pbr.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pbr
+#
+################################################################################
+
+PYTHON_PBR_VERSION = 5.4.3
+PYTHON_PBR_SOURCE = pbr-$(PYTHON_PBR_VERSION).tar.gz
+PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/99/f1/7807d3409c79905a907f1c616d910c921b2a8e73c17b2969930318f44777
+PYTHON_PBR_SETUP_TYPE = setuptools
+PYTHON_PBR_LICENSE = BSD-3-Clause, Apache-2.0
+PYTHON_PBR_LICENSE_FILES = LICENSE pbr/tests/testpackage/LICENSE.txt
+
+$(eval $(host-python-package))
-- 
2.23.0
