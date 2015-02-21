From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 14:00:39 +0100
Subject: [Buildroot] [git commit] package/python-mako: New package
Message-ID: <20150302222721.57156807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a15524b67f91c96378a9c83248c18f0655d8f71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upcoming mesa3d 10.5.x needs the host-version of this package:
http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=10.5&id=2b37bea010a9c9333a813cc77d28629e1382c0be

[Thomas: remove dependency on host-pkgconf, apparently not needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |    1 +
 package/python-mako/Config.in      |    8 ++++++++
 package/python-mako/python-mako.mk |   18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bad0f7b..a45b0f9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -536,6 +536,7 @@ menu "external python modules"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-lxml/Config.in"
+	source "package/python-mako/Config.in"
 	source "package/python-mad/Config.in"
 	source "package/python-markdown/Config.in"
 	source "package/python-markupsafe/Config.in"
diff --git a/package/python-mako/Config.in b/package/python-mako/Config.in
new file mode 100644
index 0000000..442e290
--- /dev/null
+++ b/package/python-mako/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_MAKO
+	bool "python-mako"
+	help
+	  Mako is a template library written in Python. It provides a
+	  familiar, non-XML syntax which compiles into Python modules
+	  for maximum performance.
+
+	  https://pypi.python.org/pypi/Mako
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
new file mode 100644
index 0000000..398b8d2
--- /dev/null
+++ b/package/python-mako/python-mako.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-mako
+#
+################################################################################
+
+PYTHON_MAKO_VERSION = 1.0.1
+PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
+PYTHON_MAKO_SITE = https://pypi.python.org/packages/source/M/Mako
+PYTHON_MAKO_SETUP_TYPE = setuptools
+PYTHON_MAKO_LICENSE = MIT
+PYTHON_MAKO_LICENSE_FILES = LICENSE
+
+# In host build, setup.py tries to download markupsafe if it is not installed
+HOST_PYTHON_MAKO_DEPENDENCIES = host-python-markupsafe
+
+$(eval $(python-package))
+$(eval $(host-python-package))
