From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:41:32 +0100
Subject: [Buildroot] [git commit] python-versiontools: new package
Message-ID: <20131215130826.937209C025@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b71842cb658cdef0715877bd1d7a4eb1c76d3287
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: convert to the Python package infrastructure, added license
informations.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |    1 +
 package/python-versiontools/Config.in              |    7 +++++++
 package/python-versiontools/python-versiontools.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3316d0f..b766939 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -406,6 +406,7 @@ source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 source "package/python-thrift/Config.in"
+source "package/python-versiontools/Config.in"
 endmenu
 endif
 source "package/python3/Config.in"
diff --git a/package/python-versiontools/Config.in b/package/python-versiontools/Config.in
new file mode 100644
index 0000000..cb260c1
--- /dev/null
+++ b/package/python-versiontools/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_VERSIONTOOLS
+	bool "python-versiontools"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Smart replacement for plain tuple used in __version__.
+
+	  https://pypi.python.org/pypi/versiontools
diff --git a/package/python-versiontools/python-versiontools.mk b/package/python-versiontools/python-versiontools.mk
new file mode 100644
index 0000000..7d745b9
--- /dev/null
+++ b/package/python-versiontools/python-versiontools.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-versiontools
+#
+################################################################################
+
+PYTHON_VERSIONTOOLS_VERSION = 1.9.1
+PYTHON_VERSIONTOOLS_SOURCE = versiontools-$(PYTHON_VERSIONTOOLS_VERSION).tar.gz
+PYTHON_VERSIONTOOLS_SITE = http://pypi.python.org/packages/source/v/versiontools/
+PYTHON_VERSIONTOOLS_SETUP_TYPE = setuptools
+PYTHON_VERSIONTOOLS_LICENSE = LGPLv3
+
+$(eval $(python-package))
