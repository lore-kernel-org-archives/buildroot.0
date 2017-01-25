From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 14:11:10 +1300
Subject: [Buildroot] [git commit] python-babel: new package
Message-ID: <20170125011321.0CAE281EDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21959ad8537440003c06d07357dbda286ab488cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A collection of tools for internationalizing Python applications.

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |  1 +
 package/python-babel/Config.in         |  8 ++++++++
 package/python-babel/python-babel.hash |  3 +++
 package/python-babel/python-babel.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2bcb5d2..4df2361 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -647,6 +647,7 @@ menu "External python modules"
 	source "package/python-argh/Config.in"
 	source "package/python-arrow/Config.in"
 	source "package/python-autobahn/Config.in"
+	source "package/python-babel/Config.in"
 	source "package/python-backports-abc/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bottle/Config.in"
diff --git a/package/python-babel/Config.in b/package/python-babel/Config.in
new file mode 100644
index 0000000..1a22b83
--- /dev/null
+++ b/package/python-babel/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_BABEL
+	bool "python-babel"
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	help
+	  A collection of tools for internationalizing Python
+	  applications.
+
+	  http://babel.pocoo.org/en/latest/
diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
new file mode 100644
index 0000000..4d75367
--- /dev/null
+++ b/package/python-babel/python-babel.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/Babel/json, sha256 locally computed
+md5	afa20bc55b0e991833030129ad498f35  Babel-2.3.4.tar.gz
+sha256	c535c4403802f6eb38173cd4863e419e2274921a01a8aad8a5b497c131c62875  Babel-2.3.4.tar.gz
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
new file mode 100644
index 0000000..3627b15
--- /dev/null
+++ b/package/python-babel/python-babel.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-babel
+#
+################################################################################
+
+PYTHON_BABEL_VERSION = 2.3.4
+PYTHON_BABEL_SOURCE = Babel-$(PYTHON_BABEL_VERSION).tar.gz
+PYTHON_BABEL_SITE = https://pypi.python.org/packages/6e/96/ba2a2462ed25ca0e651fb7b66e7080f5315f91425a07ea5b34d7c870c114
+PYTHON_BABEL_SETUP_TYPE = setuptools
+PYTHON_BABEL_LICENSE = BSD-3c
+PYTHON_BABEL_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
