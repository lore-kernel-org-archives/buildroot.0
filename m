From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  6 Jul 2017 11:08:59 +0200
Subject: [Buildroot] [PATCH 2/3] python-m2r: new package
In-Reply-To: <20170706090900.15999-1-yegorslists@googlemail.com>
References: <20170706090900.15999-1-yegorslists@googlemail.com>
Message-ID: <20170706090900.15999-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Host variant is needed to generate long description
for python-automat package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                  |  1 +
 package/python-m2r/Config.in       |  8 ++++++++
 package/python-m2r/python-m2r.hash |  3 +++
 package/python-m2r/python-m2r.mk   | 16 ++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-m2r/Config.in
 create mode 100644 package/python-m2r/python-m2r.hash
 create mode 100644 package/python-m2r/python-m2r.mk

diff --git a/package/Config.in b/package/Config.in
index aac2b23063..f178aec963 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -764,6 +764,7 @@ menu "External python modules"
 	source "package/python-lmdb/Config.in"
 	source "package/python-logbook/Config.in"
 	source "package/python-lxml/Config.in"
+	source "package/python-m2r/Config.in"
 	source "package/python-mad/Config.in"
 	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
diff --git a/package/python-m2r/Config.in b/package/python-m2r/Config.in
new file mode 100644
index 0000000000..44dafaa464
--- /dev/null
+++ b/package/python-m2r/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_M2R
+	bool "python-m2r"
+	select BR2_PACKAGE_PYTHON_MISTUNE # runtime
+	select BR2_PACKAGE_PYTHON_DOCUTILS # runtime
+	help
+	  Markdown to reStructuredText converter.
+
+	  https://github.com/miyakogi/m2r
diff --git a/package/python-m2r/python-m2r.hash b/package/python-m2r/python-m2r.hash
new file mode 100644
index 0000000000..102da33b55
--- /dev/null
+++ b/package/python-m2r/python-m2r.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/m2r/json, sha256 locally computed
+md5	aac67f2167a3d81c8ccd7615e9c2cb7a  m2r-0.1.6.tar.gz
+sha256	a26bc2e25e0ad3f8650385aea25cf734ac4fcd30e54faec92fd39675da75e527  m2r-0.1.6.tar.gz
diff --git a/package/python-m2r/python-m2r.mk b/package/python-m2r/python-m2r.mk
new file mode 100644
index 0000000000..b506ad8517
--- /dev/null
+++ b/package/python-m2r/python-m2r.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-m2r
+#
+################################################################################
+
+PYTHON_M2R_VERSION = 0.1.6
+PYTHON_M2R_SOURCE = m2r-$(PYTHON_M2R_VERSION).tar.gz
+PYTHON_M2R_SITE = https://pypi.python.org/packages/8d/74/558f9aba132bb34cd661fad9e17d42bfa1332363466ff314e600096f78c3
+PYTHON_M2R_SETUP_TYPE = setuptools
+PYTHON_M2R_LICENSE = MIT
+PYTHON_M2R_LICENSE_FILES = LICENSE
+HOST_PYTHON_M2R_DEPENDENCIES = host-python-docutils host-python-mistune
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.11.0
