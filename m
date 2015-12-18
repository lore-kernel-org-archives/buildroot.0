From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 22:07:52 +0100
Subject: [Buildroot] [git commit] python-singledispatch: new package
Message-ID: <20151218211955.056EA826C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61ae4ffb2474f4fad7c8513f5ed732cf4a96b1bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This library brings functools.singledispatch from Python 3.4
to Python 2.7.x.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                        |  1 +
 package/python-singledispatch/Config.in                  |  8 ++++++++
 package/python-singledispatch/python-singledispatch.hash |  3 +++
 package/python-singledispatch/python-singledispatch.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 818433f..01388c2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -676,6 +676,7 @@ menu "External python modules"
 	source "package/python-serial/Config.in"
 	source "package/python-setuptools/Config.in"
 	source "package/python-simplejson/Config.in"
+	source "package/python-singledispatch/Config.in"
 	source "package/python-sip/Config.in"
 	source "package/python-six/Config.in"
 	source "package/python-spidev/Config.in"
diff --git a/package/python-singledispatch/Config.in b/package/python-singledispatch/Config.in
new file mode 100644
index 0000000..192e516
--- /dev/null
+++ b/package/python-singledispatch/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SINGLEDISPATCH
+	bool "python-singledispatch"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  This library brings functools.singledispatch from
+	  Python 3.4 to Python 2.6-3.3
+
+	  https://pypi.python.org/pypi/singledispatch
diff --git a/package/python-singledispatch/python-singledispatch.hash b/package/python-singledispatch/python-singledispatch.hash
new file mode 100644
index 0000000..8a96d21
--- /dev/null
+++ b/package/python-singledispatch/python-singledispatch.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=af2fc6a3d6cc5a02d0bf54d909785fcb, sha256 locally computed
+md5     af2fc6a3d6cc5a02d0bf54d909785fcb singledispatch-3.4.0.3.tar.gz
+sha256  5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c  singledispatch-3.4.0.3.tar.gz
diff --git a/package/python-singledispatch/python-singledispatch.mk b/package/python-singledispatch/python-singledispatch.mk
new file mode 100644
index 0000000..7e1d5ac
--- /dev/null
+++ b/package/python-singledispatch/python-singledispatch.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-singledispatch
+#
+################################################################################
+
+PYTHON_SINGLEDISPATCH_VERSION = 3.4.0.3
+PYTHON_SINGLEDISPATCH_SOURCE = singledispatch-$(PYTHON_SINGLEDISPATCH_VERSION).tar.gz
+PYTHON_SINGLEDISPATCH_SITE = https://pypi.python.org/packages/source/s/singledispatch
+PYTHON_SINGLEDISPATCH_LICENSE = MIT
+PYTHON_SINGLEDISPATCH_LICENSE_FILES = setup.py
+PYTHON_SINGLEDISPATCH_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
