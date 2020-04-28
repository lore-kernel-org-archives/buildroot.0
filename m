From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 28 Apr 2020 14:14:51 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/python-bsdiff4: new package
Message-ID: <20200428111451.6677-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Binary diff and patch using the BSDIFF4-format.

License file isn't shipped with the package, so PKG-INFO
is used instead. A PR has been submitted upstream in order
to add the license when the package is shipped.
PR status:
https://github.com/ilanschnell/bsdiff4/pull/15

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
v1->v2:
Add "BSD-Protection" to _LICENSE
---
 package/Config.in                          |  1 +
 package/python-bsdiff4/Config.in           |  8 ++++++++
 package/python-bsdiff4/python-bsdiff4.hash |  5 +++++
 package/python-bsdiff4/python-bsdiff4.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-bsdiff4/Config.in
 create mode 100644 package/python-bsdiff4/python-bsdiff4.hash
 create mode 100644 package/python-bsdiff4/python-bsdiff4.mk

diff --git a/package/Config.in b/package/Config.in
index bf02870ea2..8d857b6bcb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -893,6 +893,7 @@ menu "External python modules"
 	source "package/python-bluezero/Config.in"
 	source "package/python-bottle/Config.in"
 	source "package/python-brotli/Config.in"
+	source "package/python-bsdiff4/Config.in"
 	source "package/python-bunch/Config.in"
 	source "package/python-cached-property/Config.in"
 	source "package/python-can/Config.in"
diff --git a/package/python-bsdiff4/Config.in b/package/python-bsdiff4/Config.in
new file mode 100644
index 0000000000..a383cda0f5
--- /dev/null
+++ b/package/python-bsdiff4/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_BSDIFF4
+	bool "python-bsdiff4"
+	select BR2_PACKAGE_PYTHON_BZIP2 if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_BZIP2 if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  binary diff and patch using the BSDIFF4-format.
+
+	  https://github.com/ilanschnell/bsdiff4
diff --git a/package/python-bsdiff4/python-bsdiff4.hash b/package/python-bsdiff4/python-bsdiff4.hash
new file mode 100644
index 0000000000..6db2535cc1
--- /dev/null
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/bsdiff4/json
+md5	59ae574a8bc2aae659ce4c282293202c  bsdiff4-1.1.9.tar.gz
+sha256	a7c48ec58dc1c4a2b9fb5da05637524d5dbb1643a3df7cdc6ed105636909ff79  bsdiff4-1.1.9.tar.gz
+# Locally computed sha256
+sha256	e60be11b30cb7f07210e4c2d64246b49d20a25caf48efea5c13995788a425468  PKG-INFO
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
new file mode 100644
index 0000000000..b213f10d52
--- /dev/null
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-bsdiff4
+#
+################################################################################
+
+PYTHON_BSDIFF4_VERSION = 1.1.9
+PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/39/34/bd2ae6cd4b2a5d3af9173a9d7f6ecd2723ea7b0401ad807a0c7e7b50faa3
+PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
+PYTHON_BSDIFF4_LICENSE_FILES = PKG-INFO
+PYTHON_BSDIFF4_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.26.2
