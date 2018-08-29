From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 21:40:50 +0200
Subject: [Buildroot] [git commit] python-falcon: new package
Message-ID: <20180907111607.7214681170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ea57b712d7e6b3c16892828361a39847c4ba7cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An unladen web framework for building APIs and app backends.

http://falconframework.org

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Thomas: add missing _LICENSE variable.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-falcon/Config.in          |  9 +++++++++
 package/python-falcon/python-falcon.hash |  5 +++++
 package/python-falcon/python-falcon.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e58fd05cd5..bd8095bd20 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -877,6 +877,7 @@ F:	package/libwebsock/
 F:	package/sofia-sip/
 
 N:	Grzegorz Blach <grzegorz@blach.pl>
+F:	package/python-falcon/
 F:	package/python-mimeparse/
 
 N:	Guillaume Gardet <guillaume.gardet@oliseo.fr>
diff --git a/package/Config.in b/package/Config.in
index cd17f0e709..66f303ec58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -820,6 +820,7 @@ menu "External python modules"
 	source "package/python-engineio/Config.in"
 	source "package/python-enum/Config.in"
 	source "package/python-enum34/Config.in"
+	source "package/python-falcon/Config.in"
 	source "package/python-flask/Config.in"
 	source "package/python-flask-cors/Config.in"
 	source "package/python-flask-babel/Config.in"
diff --git a/package/python-falcon/Config.in b/package/python-falcon/Config.in
new file mode 100644
index 0000000000..ffd66eec1b
--- /dev/null
+++ b/package/python-falcon/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_FALCON
+	bool "python-falcon"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_MIMEPARSE # runtime
+	help
+	  An unladen web framework for building APIs and app
+	  backends.
+
+	  http://falconframework.org
diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
new file mode 100644
index 0000000000..7f6ee6ea3d
--- /dev/null
+++ b/package/python-falcon/python-falcon.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/falcon/json
+md5	3cb880665ee2cd52143cf8a7790a35e6  falcon-1.4.1.tar.gz
+sha256	3981f609c0358a9fcdb25b0e7fab3d9e23019356fb429c635ce4133135ae1bc4  falcon-1.4.1.tar.gz
+# Locally computed sha256 checksums
+sha256	e9e7f1a7ba764f042e56afce6f3563c2be9c4fffbb1404b20f8050ae051f577c  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
new file mode 100644
index 0000000000..106387f96f
--- /dev/null
+++ b/package/python-falcon/python-falcon.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-falcon
+#
+################################################################################
+
+PYTHON_FALCON_VERSION = 1.4.1
+PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/2f/e6/5045da9df509b9259037f065d15608930fd6c997ee930ad230f9fbfecf15
+PYTHON_FALCON_SETUP_TYPE = setuptools
+PYTHON_FALCON_LICENSE = Apache-2.0
+PYTHON_FALCON_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
