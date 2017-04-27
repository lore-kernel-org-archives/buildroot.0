From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 27 Apr 2017 14:33:37 -0700
Subject: [Buildroot] [PATCH v2 07/10] package/python-pickleshare: New package
In-Reply-To: <20170427213340.26917-1-andrew.smirnov@gmail.com>
References: <20170427213340.26917-1-andrew.smirnov@gmail.com>
Message-ID: <20170427213340.26917-8-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add 'pickleshare'[1] package to buildroot. Needed by 'IPython'.

[1] https://pypi.python.org/pypi/pickleshare

Add pickleshare to satisfy IPython's dependency.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-pickleshare/Config.in               |  7 +++++++
 package/python-pickleshare/python-pickleshare.hash |  2 ++
 package/python-pickleshare/python-pickleshare.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/python-pickleshare/Config.in
 create mode 100644 package/python-pickleshare/python-pickleshare.hash
 create mode 100644 package/python-pickleshare/python-pickleshare.mk

diff --git a/package/Config.in b/package/Config.in
index d8880df..a749b78 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -771,6 +771,7 @@ menu "External python modules"
 	source "package/python-pathlib2/Config.in"
 	source "package/python-pathvalidate/Config.in"
 	source "package/python-pexpect/Config.in"
+	source "package/python-pickleshare/Config.in"
 	source "package/python-pillow/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-prompt-toolkit/Config.in"
diff --git a/package/python-pickleshare/Config.in b/package/python-pickleshare/Config.in
new file mode 100644
index 0000000..a453769
--- /dev/null
+++ b/package/python-pickleshare/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PICKLESHARE
+	bool "python-pickleshare"
+	select BR2_PACKAGE_PYTHON_PATHLIB2 if BR2_PACKAGE_PYTHON
+	help
+	  A configuration system for Python applications.
+
+	  https://pypi.python.org/pypi/pickleshare
diff --git a/package/python-pickleshare/python-pickleshare.hash b/package/python-pickleshare/python-pickleshare.hash
new file mode 100644
index 0000000..f9f9beb
--- /dev/null
+++ b/package/python-pickleshare/python-pickleshare.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 a9ccf2c87c2224f26dd5b7dfd135f2472e374ae972f8d510b1b940861beb1eb4 pickleshare-0.7.4.tar.gz
diff --git a/package/python-pickleshare/python-pickleshare.mk b/package/python-pickleshare/python-pickleshare.mk
new file mode 100644
index 0000000..fa62c62
--- /dev/null
+++ b/package/python-pickleshare/python-pickleshare.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-pickleshare
+#
+################################################################################
+
+PYTHON_PICKLESHARE_VERSION = 0.7.4
+PYTHON_PICKLESHARE_SOURCE = pickleshare-$(PYTHON_PICKLESHARE_VERSION).tar.gz
+PYTHON_PICKLESHARE_SITE = $(call github,pickleshare,pickleshare,$(PYTHON_PICKLESHARE_VERSION))
+PYTHON_PICKLESHARE_LICENSE = MIT
+PYTHON_PICKLESHARE_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.9.3
