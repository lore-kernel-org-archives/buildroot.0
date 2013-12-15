From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:41:31 +0100
Subject: [Buildroot] [git commit] python-configobj: new package
Message-ID: <20131215130826.8C4BB9C035@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=494c8eb54b051d45b43d833a3e41f5735cd8075e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: convert to the Python package infrastructure.]

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                            |    1 +
 package/python-configobj/Config.in           |   10 ++++++++++
 package/python-configobj/python-configobj.mk |   14 ++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a884de1..3316d0f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -386,6 +386,7 @@ source "package/python/Config.in"
 if BR2_PACKAGE_PYTHON
 menu "external python modules"
 source "package/python-bottle/Config.in"
+source "package/python-configobj/Config.in"
 source "package/python-crc16/Config.in"
 source "package/python-dialog/Config.in"
 source "package/python-dpkt/Config.in"
diff --git a/package/python-configobj/Config.in b/package/python-configobj/Config.in
new file mode 100644
index 0000000..fc57e26
--- /dev/null
+++ b/package/python-configobj/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_CONFIGOBJ
+	bool "python-configobj"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  ConfigObj is a simple but powerful config file reader and
+	  writer: an ini file round tripper. Its main feature is that
+	  it is very easy to use, with a straightforward programmer's
+	  interface and a simple syntax for config files.
+
+	  http://www.voidspace.org.uk/python/configobj.html
diff --git a/package/python-configobj/python-configobj.mk b/package/python-configobj/python-configobj.mk
new file mode 100644
index 0000000..5211b1d
--- /dev/null
+++ b/package/python-configobj/python-configobj.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-configobj
+#
+################################################################################
+
+PYTHON_CONFIGOBJ_VERSION = 4.7.2
+PYTHON_CONFIGOBJ_SOURCE = configobj-$(PYTHON_CONFIGOBJ_VERSION).tar.gz
+PYTHON_CONFIGOBJ_SITE = http://pypi.python.org/packages/source/c/configobj
+PYTHON_CONFIGOBJ_LICENSE = BSD-3c
+# License only mentioned in the source
+PYTHON_CONFIGOBJ_SETUP_TYPE = distutils
+
+$(eval $(python-package))
