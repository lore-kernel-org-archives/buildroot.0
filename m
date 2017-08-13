From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 13 Aug 2017 17:28:27 +0200
Subject: [Buildroot] [git commit branch/next] python-m2r: new package
Message-ID: <20170813154723.9C16B818A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=800b808bad629c27df900bfee76367b478d6d2fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Host variant is needed to generate long description
for python-automat package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                  |  1 +
 package/python-m2r/Config.in       |  8 ++++++++
 package/python-m2r/python-m2r.hash |  3 +++
 package/python-m2r/python-m2r.mk   | 16 ++++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 34ce399..9bc3209 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -772,6 +772,7 @@ menu "External python modules"
 	source "package/python-lmdb/Config.in"
 	source "package/python-logbook/Config.in"
 	source "package/python-lxml/Config.in"
+	source "package/python-m2r/Config.in"
 	source "package/python-mad/Config.in"
 	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
diff --git a/package/python-m2r/Config.in b/package/python-m2r/Config.in
new file mode 100644
index 0000000..44dafaa
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
index 0000000..102da33
--- /dev/null
+++ b/package/python-m2r/python-m2r.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/m2r/json, sha256 locally computed
+md5	aac67f2167a3d81c8ccd7615e9c2cb7a  m2r-0.1.6.tar.gz
+sha256	a26bc2e25e0ad3f8650385aea25cf734ac4fcd30e54faec92fd39675da75e527  m2r-0.1.6.tar.gz
diff --git a/package/python-m2r/python-m2r.mk b/package/python-m2r/python-m2r.mk
new file mode 100644
index 0000000..b506ad8
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
