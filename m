From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 21:45:00 +0200
Subject: [Buildroot] [git commit] package/python-colorzero: new package
Message-ID: <20200618194318.944C282B7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=185398f6198f222b45c85a6260b4e723e2f9a4c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-colorzero/Config.in             |  6 ++++++
 package/python-colorzero/python-colorzero.hash |  4 ++++
 package/python-colorzero/python-colorzero.mk   | 13 +++++++++++++
 support/scripts/pkg-stats                      |  2 ++
 6 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cbe6bc1856..65bce3e4a4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2025,6 +2025,7 @@ F:	package/iwd/
 F:	package/libevdev/
 F:	package/log4cplus/
 F:	package/postgresql/
+F:	package/python-colorzero/
 F:	package/qt5/
 F:	package/quotatool/
 F:	package/racehound/
diff --git a/package/Config.in b/package/Config.in
index 1f44fe7ca9..fbe87ec902 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -913,6 +913,7 @@ menu "External python modules"
 	source "package/python-coherence/Config.in"
 	source "package/python-colorama/Config.in"
 	source "package/python-colorlog/Config.in"
+	source "package/python-colorzero/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-constantly/Config.in"
diff --git a/package/python-colorzero/Config.in b/package/python-colorzero/Config.in
new file mode 100644
index 0000000000..b2ef711fbe
--- /dev/null
+++ b/package/python-colorzero/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_COLORZERO
+	bool "python-colorzero"
+	help
+	  A color manipulation library for Python.
+
+	  https://github.com/waveform80/colorzero
diff --git a/package/python-colorzero/python-colorzero.hash b/package/python-colorzero/python-colorzero.hash
new file mode 100644
index 0000000000..118ccea7d7
--- /dev/null
+++ b/package/python-colorzero/python-colorzero.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  24d30b55793150f9ae7478f8aa2126fe5598a31f928907eadbf9d5a19aa9964c  python-colorzero-1.1.tar.gz
+# Locally computed
+sha256  47778d78e05bb6c39c022814e3712a0327c6418c7251757e72167ab8ff12bb4d  LICENSE.txt
diff --git a/package/python-colorzero/python-colorzero.mk b/package/python-colorzero/python-colorzero.mk
new file mode 100644
index 0000000000..6ddbcbe1c5
--- /dev/null
+++ b/package/python-colorzero/python-colorzero.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-colorzero
+#
+################################################################################
+
+PYTHON_COLORZERO_VERSION = 1.1
+PYTHON_COLORZERO_SITE = $(call github,waveform80,colorzero,release-$(PYTHON_COLORZERO_VERSION))
+PYTHON_COLORZERO_LICENSE = BSD-3-Clause
+PYTHON_COLORZERO_LICENSE_FILES = LICENSE.txt
+PYTHON_COLORZERO_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index c1f41fc9e8..4d76ca32f9 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -383,6 +383,8 @@ class CVE:
                     if not hasattr(cve_affected_version, "version"):
                         print("Cannot parse CVE affected version '%s'" % v["version_value"])
                         continue
+                    print(pkg_version)
+                    print(cve_affected_version)
                     return pkg_version <= cve_affected_version
                 else:
                     print("version_affected: %s" % v['version_affected'])
