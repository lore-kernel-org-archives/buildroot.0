From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jun 2016 22:51:46 +0200
Subject: [Buildroot] [git commit] python-dominate: new package
Message-ID: <20160620205603.3654481D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fe87260eedfd67d33a17249f3f6a66aebc13e63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                            |  1 +
 package/python-dominate/Config.in            |  7 +++++++
 package/python-dominate/python-dominate.hash |  2 ++
 package/python-dominate/python-dominate.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 02cc3bd..aa1da13 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -661,6 +661,7 @@ menu "External python modules"
 	source "package/python-dialog/Config.in"
 	source "package/python-django/Config.in"
 	source "package/python-docopt/Config.in"
+	source "package/python-dominate/Config.in"
 	source "package/python-dpkt/Config.in"
 	source "package/python-ecdsa/Config.in"
 	source "package/python-enum/Config.in"
diff --git a/package/python-dominate/Config.in b/package/python-dominate/Config.in
new file mode 100644
index 0000000..35e9a0c
--- /dev/null
+++ b/package/python-dominate/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_DOMINATE
+	bool "python-dominate"
+	help
+	  Dominate is a Python library for creating and manipulating
+	  HTML documents using an elegant DOM API.
+
+	  http://github.com/Knio/dominate/
diff --git a/package/python-dominate/python-dominate.hash b/package/python-dominate/python-dominate.hash
new file mode 100644
index 0000000..1d763ac
--- /dev/null
+++ b/package/python-dominate/python-dominate.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 318063a9b600cdc13f84592ad515db0fd3a2816a2433e2a2fad55a5398ae05da  python-dominate-acb02c7c71e353e5dfbc905d506b54908533027e.tar.gz
diff --git a/package/python-dominate/python-dominate.mk b/package/python-dominate/python-dominate.mk
new file mode 100644
index 0000000..170553f
--- /dev/null
+++ b/package/python-dominate/python-dominate.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-dominate
+#
+################################################################################
+
+PYTHON_DOMINATE_VERSION = acb02c7c71e353e5dfbc905d506b54908533027e
+PYTHON_DOMINATE_SITE = $(call github,Knio,dominate,$(PYTHON_DOMINATE_VERSION))
+PYTHON_DOMINATE_SETUP_TYPE = setuptools
+PYTHON_DOMINATE_LICENSE = LGPLv3+
+PYTHON_DOMINATE_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
