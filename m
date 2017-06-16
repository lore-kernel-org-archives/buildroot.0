From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 16 Jun 2017 09:27:57 +0200
Subject: [Buildroot] [PATCH 3/4] python-cheroot: new package
In-Reply-To: <20170616072758.13871-1-yegorslists@googlemail.com>
References: <20170616072758.13871-1-yegorslists@googlemail.com>
Message-ID: <20170616072758.13871-3-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                          |  1 +
 package/python-cheroot/Config.in           |  8 ++++++++
 package/python-cheroot/python-cheroot.hash |  3 +++
 package/python-cheroot/python-cheroot.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-cheroot/Config.in
 create mode 100644 package/python-cheroot/python-cheroot.hash
 create mode 100644 package/python-cheroot/python-cheroot.mk

diff --git a/package/Config.in b/package/Config.in
index a1b572335..0ada98139 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -694,6 +694,7 @@ menu "External python modules"
 	source "package/python-characteristic/Config.in"
 	source "package/python-chardet/Config.in"
 	source "package/python-cheetah/Config.in"
+	source "package/python-cheroot/Config.in"
 	source "package/python-cherrypy/Config.in"
 	source "package/python-click/Config.in"
 	source "package/python-coherence/Config.in"
diff --git a/package/python-cheroot/Config.in b/package/python-cheroot/Config.in
new file mode 100644
index 000000000..bb85f7bdc
--- /dev/null
+++ b/package/python-cheroot/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_CHEROOT
+	bool "python-cheroot"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Cheroot is the high-performance, pure-Python
+	  HTTP server used by CherryPy.
+
+	  https://github.com/cherrypy/cheroot
diff --git a/package/python-cheroot/python-cheroot.hash b/package/python-cheroot/python-cheroot.hash
new file mode 100644
index 000000000..348b82d1c
--- /dev/null
+++ b/package/python-cheroot/python-cheroot.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/cheroot/json, sha256 locally computed
+md5	e5503b0e67bdba29c6585965e7f42099  cheroot-5.5.0.tar.gz
+sha256	59e349f91b9230930f7078646bb92b3a5b0f9cf19a6ff949777409fd289a1eba  cheroot-5.5.0.tar.gz
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
new file mode 100644
index 000000000..3f4b6893d
--- /dev/null
+++ b/package/python-cheroot/python-cheroot.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-cheroot
+#
+################################################################################
+
+PYTHON_CHEROOT_VERSION = 5.5.0
+PYTHON_CHEROOT_SOURCE = cheroot-$(PYTHON_CHEROOT_VERSION).tar.gz
+PYTHON_CHEROOT_SITE = https://pypi.python.org/packages/a5/43/f8a461762dc62e9f273d4944fb8c140757c11a29c91c91d3fbd5fafb1570
+PYTHON_CHEROOT_LICENSE = BSD-3-Clause
+PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
+PYTHON_CHEROOT_SETUP_TYPE = setuptools
+PYTHON_CHEROOT_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.11.0
