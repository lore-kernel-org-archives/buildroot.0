From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 27 Apr 2017 14:33:31 -0700
Subject: [Buildroot] [PATCH v2 01/10] package/python-decorator: New package
In-Reply-To: <20170427213340.26917-1-andrew.smirnov@gmail.com>
References: <20170427213340.26917-1-andrew.smirnov@gmail.com>
Message-ID: <20170427213340.26917-2-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add 'decorator'[1] package to Buildroot. Needed by 'traitlets'
package, which is added in the next patch.

[1] https://pypi.python.org/pypi/decorator

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/Config.in                            |  1 +
 package/python-decorator/Config.in           |  6 ++++++
 package/python-decorator/python-decorator.mk | 13 +++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/python-decorator/Config.in
 create mode 100644 package/python-decorator/python-decorator.mk

diff --git a/package/Config.in b/package/Config.in
index 25405c1..eb6d197 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -701,6 +701,7 @@ menu "External python modules"
 	source "package/python-daemon/Config.in"
 	source "package/python-dataproperty/Config.in"
 	source "package/python-dateutil/Config.in"
+	source "package/python-decorator/Config.in"
 	source "package/python-dialog/Config.in"
 	source "package/python-dialog3/Config.in"
 	source "package/python-dicttoxml/Config.in"
diff --git a/package/python-decorator/Config.in b/package/python-decorator/Config.in
new file mode 100644
index 0000000..e7ec00c
--- /dev/null
+++ b/package/python-decorator/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_DECORATOR
+	bool "python-decorator"
+	help
+	  Better living through Python with decorators
+
+	  https://github.com/micheles/decorator
diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
new file mode 100644
index 0000000..fac03a3
--- /dev/null
+++ b/package/python-decorator/python-decorator.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-decorator
+#
+################################################################################
+
+PYTHON_DECORATOR_VERSION = 4.0.11
+PYTHON_DECORATOR_SITE = https://github.com/micheles/decorator.git
+PYTHON_DECORATOR_SITE_METHOD = git
+PYTHON_DECORATOR_LICENSE = BSD-2-Clause
+PYTHON_DECORATOR_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.9.3
