From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 20:10:46 +0200
Subject: [Buildroot] [PATCH v14 1/8] package/python3-mako: new package
In-Reply-To: <20190921181053.8999-1-bernd.kuhls@t-online.de>
References: <20190921181053.8999-1-bernd.kuhls@t-online.de>
Message-ID: <20190921181053.8999-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@smile.fr>

host-python3-mako will be used by python 3 only script used in the
build system of mesa3d package.

There is no way to force building host-python-mako for python2 and
python3 [1].

[1] http://patchwork.ozlabs.org/patch/1084248/

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[removed host-python-markupsafe dependency, not needed since v1.0.2]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-mako/python-mako.mk     |  2 ++
 package/python3-mako/python3-mako.hash |  1 +
 package/python3-mako/python3-mako.mk   | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 120000 package/python3-mako/python3-mako.hash
 create mode 100644 package/python3-mako/python3-mako.mk

diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 0d06dc4986..f8478cf031 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+# Please keep in sync with
+# package/python3-mako/python3-mako.mk
 PYTHON_MAKO_VERSION = 1.0.6
 PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
 PYTHON_MAKO_SITE = https://pypi.python.org/packages/56/4b/cb75836863a6382199aefb3d3809937e21fa4cb0db15a4f4ba0ecc2e7e8e
diff --git a/package/python3-mako/python3-mako.hash b/package/python3-mako/python3-mako.hash
new file mode 120000
index 0000000000..068be91fb0
--- /dev/null
+++ b/package/python3-mako/python3-mako.hash
@@ -0,0 +1 @@
+../python-mako/python-mako.hash
\ No newline at end of file
diff --git a/package/python3-mako/python3-mako.mk b/package/python3-mako/python3-mako.mk
new file mode 100644
index 0000000000..624152e484
--- /dev/null
+++ b/package/python3-mako/python3-mako.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python3-mako
+#
+################################################################################
+
+# Please keep in sync with
+# package/python-mako/python-mako.mk
+PYTHON3_MAKO_VERSION = 1.0.6
+PYTHON3_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
+PYTHON3_MAKO_SITE = https://pypi.python.org/packages/56/4b/cb75836863a6382199aefb3d3809937e21fa4cb0db15a4f4ba0ecc2e7e8e
+PYTHON3_MAKO_SETUP_TYPE = setuptools
+PYTHON3_MAKO_LICENSE = MIT
+PYTHON3_MAKO_LICENSE_FILES = LICENSE
+HOST_PYTHON3_MAKO_DL_SUBDIR = python-mako
+HOST_PYTHON3_MAKO_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
-- 
2.20.1
