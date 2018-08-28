From: Grzegorz Blach <grzegorz@blach.pl>
Date: Tue, 28 Aug 2018 12:16:18 +0200
Subject: [Buildroot] [PATCH 2/2] python-falcon: new package
In-Reply-To: <20180828101618.4746-1-grzegorz@blach.pl>
References: <20180828101618.4746-1-grzegorz@blach.pl>
Message-ID: <20180828101618.4746-2-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An unladen web framework for building APIs and app backends.

http://falconframework.org

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-falcon/Config.in          |  9 +++++++++
 package/python-falcon/python-falcon.hash |  5 +++++
 package/python-falcon/python-falcon.mk   | 13 +++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-falcon/Config.in
 create mode 100644 package/python-falcon/python-falcon.hash
 create mode 100644 package/python-falcon/python-falcon.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a9d5942adb..af039cc2ff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -851,6 +851,7 @@ F:	package/libwebsock/
 F:	package/sofia-sip/
 
 N:	Grzegorz Blach <grzegorz@blach.pl>
+F:	package/python-falcon
 F:	package/python-mimeparse
 
 N:	Guillaume Gardet <guillaume.gardet@oliseo.fr>
diff --git a/package/Config.in b/package/Config.in
index 0640a399bb..e243db552e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -799,6 +799,7 @@ menu "External python modules"
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
index 0000000000..52911c5428
--- /dev/null
+++ b/package/python-falcon/python-falcon.mk
@@ -0,0 +1,13 @@
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
+PYTHON_FALCON_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.1
