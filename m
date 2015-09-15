From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 23:45:19 +0200
Subject: [Buildroot] [git commit] python-pyratemp: new package
Message-ID: <20150915214537.021CD81E68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50aef967ca9327952dff6c4e1926bc08250e336d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

add python simple template module

Signed-off-by: Steve Calfee <stevecalfee@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |    1 +
 package/python-pyratemp/Config.in            |    8 ++++++++
 package/python-pyratemp/python-pyratemp.hash |    4 ++++
 package/python-pyratemp/python-pyratemp.mk   |   14 ++++++++++++++
 4 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fc35f12..e1f3270 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -642,6 +642,7 @@ menu "external python modules"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pypcap/Config.in"
 	source "package/python-pyqt/Config.in"
+	source "package/python-pyratemp/Config.in"
 	source "package/python-pyro/Config.in"
 	source "package/python-pyroute2/Config.in"
 	source "package/python-pysendfile/Config.in"
diff --git a/package/python-pyratemp/Config.in b/package/python-pyratemp/Config.in
new file mode 100644
index 0000000..9a299d1
--- /dev/null
+++ b/package/python-pyratemp/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYRATEMP
+	bool "python-pyratemp"
+	help
+	  python-pyratemp is a Python library for doing html
+	  templates.  written entirely in Python, that is designed to
+	  be very easy to use and very like writing Python.
+
+	  https://pypi.python.org/pypi/pyratemp/
diff --git a/package/python-pyratemp/python-pyratemp.hash b/package/python-pyratemp/python-pyratemp.hash
new file mode 100644
index 0000000..f3f29a3
--- /dev/null
+++ b/package/python-pyratemp/python-pyratemp.hash
@@ -0,0 +1,4 @@
+#md5 from https://pypi.python.org/pypi?:action=show_md5&digest=e4bbe5d4a98016efef882b2b2f47defb
+md5     e4bbe5d4a98016efef882b2b2f47defb pyratemp-0.3.2.tgz
+# Locally calculated:
+sha256 c45ed656ada482a02fe780495f37a695e7671accb04f918f7e7f18abf877bc71 pyratemp-0.3.2.tgz
diff --git a/package/python-pyratemp/python-pyratemp.mk b/package/python-pyratemp/python-pyratemp.mk
new file mode 100644
index 0000000..055fb30
--- /dev/null
+++ b/package/python-pyratemp/python-pyratemp.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyratemp
+#
+################################################################################
+
+PYTHON_PYRATEMP_VERSION = 0.3.2
+PYTHON_PYRATEMP_SOURCE = pyratemp-$(PYTHON_PYRATEMP_VERSION).tgz
+PYTHON_PYRATEMP_SITE = https://pypi.python.org/packages/source/p/pyratemp
+PYTHON_PYRATEMP_LICENSE = MIT
+PYTHON_PYRATEMP_LICENSE_FILES = LICENSE
+PYTHON_PYRATEMP_SETUP_TYPE = distutils
+
+$(eval $(python-package))
