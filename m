From: Louis Aussedat <aussedat.louis@gmail.com>
Date: Sun, 10 Nov 2019 23:26:55 +0100
Subject: [Buildroot] [PATCH 3/3] package/python-future: new package
In-Reply-To: <20191110222655.21977-1-aussedat.louis@gmail.com>
References: <20191110222655.21977-1-aussedat.louis@gmail.com>
Message-ID: <20191110222655.21977-3-aussedat.louis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-future/Config.in          |  7 +++++++
 package/python-future/python-future.hash |  5 +++++
 package/python-future/python-future.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-future/Config.in
 create mode 100644 package/python-future/python-future.hash
 create mode 100644 package/python-future/python-future.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 68328b30b3..5b2c087f28 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1394,6 +1394,7 @@ N:	Louis Aussedat <aussedat.louis@gmail.com>
 F:	board/friendlyarm/nanopi-neo-plus2/
 F:	configs/friendlyarm_nanopi_neo_plus2_defconfig
 F:  package/python-dnspython/
+F:  package/python-future/
 F:  package/python-huepy/
 F:	package/python-tqdm/
 
diff --git a/package/Config.in b/package/Config.in
index 66f7b29b74..42c59d257b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -913,6 +913,7 @@ menu "External python modules"
 	source "package/python-flask-sqlalchemy/Config.in"
 	source "package/python-flup/Config.in"
 	source "package/python-functools32/Config.in"
+	source "package/python-future/Config.in"
 	source "package/python-futures/Config.in"
 	source "package/python-gobject/Config.in"
 	source "package/python-gunicorn/Config.in"
diff --git a/package/python-future/Config.in b/package/python-future/Config.in
new file mode 100644
index 0000000000..29303f334d
--- /dev/null
+++ b/package/python-future/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_FUTURE
+	bool "python-future"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Easy, clean, reliable Python 2/3 compatibility.
+
+	  http://python-future.org
diff --git a/package/python-future/python-future.hash b/package/python-future/python-future.hash
new file mode 100644
index 0000000000..c43018103e
--- /dev/null
+++ b/package/python-future/python-future.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.python.org/pypi/future/json
+md5	e4579c836b9c025872efe230f6270349  future-0.18.2.tar.gz
+sha256	b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d  future-0.18.2.tar.gz
+# Locally computed sha256 checksums
+sha256	916e561392d48471b9c23437f56e2652f320cb3b119ceaa162edf41016f746b9  LICENSE.txt
diff --git a/package/python-future/python-future.mk b/package/python-future/python-future.mk
new file mode 100644
index 0000000000..76f32180ac
--- /dev/null
+++ b/package/python-future/python-future.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-future
+#
+################################################################################
+
+PYTHON_FUTURE_VERSION = 0.18.2
+PYTHON_FUTURE_SOURCE = future-$(PYTHON_FUTURE_VERSION).tar.gz
+PYTHON_FUTURE_SITE = https://files.pythonhosted.org/packages/45/0b/38b06fd9b92dc2b68d58b75f900e97884c45bedd2ff83203d933cf5851c9
+PYTHON_FUTURE_SETUP_TYPE = setuptools
+PYTHON_FUTURE_LICENSE = MIT
+PYTHON_FUTURE_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.20.1
