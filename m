From: Denis THULIN <denis.thulin@openwide.fr>
Date: Mon,  1 Jun 2015 16:56:09 +0200
Subject: [Buildroot] [PATCH 3/3] python-magic: new package
In-Reply-To: <1433170569-15031-1-git-send-email-denis.thulin@openwide.fr>
References: <1433170569-15031-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <1433170569-15031-4-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A file type identification for python using libmagic

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---
v0:
    - Generated using python-package-generator.py
    - Modification on package/Config.in was done manually
---
 package/Config.in                      |  1 +
 package/python-magic/Config.in         |  7 +++++++
 package/python-magic/python-magic.hash |  2 ++
 package/python-magic/python-magic.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-magic/Config.in
 create mode 100644 package/python-magic/python-magic.hash
 create mode 100644 package/python-magic/python-magic.mk

diff --git a/package/Config.in b/package/Config.in
index 7b015a3..c70ca4a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -601,6 +601,7 @@ menu "external python modules"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-lxml/Config.in"
+	source "package/python-magic/Config.in"
 	source "package/python-mako/Config.in"
 	source "package/python-mad/Config.in"
 	source "package/python-markdown/Config.in"
diff --git a/package/python-magic/Config.in b/package/python-magic/Config.in
new file mode 100644
index 0000000..e6c06b9
--- /dev/null
+++ b/package/python-magic/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MAGIC
+	depends on BR2_PACKAGE_PYTHON
+	bool "python-magic"
+	help
+	  File type identification using libmagic
+	  
+	  http://github.com/ahupp/python-magic
diff --git a/package/python-magic/python-magic.hash b/package/python-magic/python-magic.hash
new file mode 100644
index 0000000..65d0ad0
--- /dev/null
+++ b/package/python-magic/python-magic.hash
@@ -0,0 +1,2 @@
+# md5 from https://pypi.python.org/pypi/python-magic/json
+md5	07e7a0fea78dd81ed609414c3484df58  python-magic-0.4.6.tar.gz
diff --git a/package/python-magic/python-magic.mk b/package/python-magic/python-magic.mk
new file mode 100644
index 0000000..91d1707
--- /dev/null
+++ b/package/python-magic/python-magic.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# package/python-magic
+#
+################################################################################
+
+PYTHON_MAGIC_VERSION = 0.4.6
+PYTHON_MAGIC_SOURCE = python-magic-$(PYTHON_MAGIC_VERSION).tar.gz
+PYTHON_MAGIC_SITE = https://pypi.python.org/packages/source/p/python-magic/
+PYTHON_MAGIC_SETUP_TYPE = setuptools
+PYTHON_MAGIC_LICENSE = PSF
+PYTHON_MAGIC_LICEiNSE_FILES = 
+
+$(eval $(python-package))
\ No newline at end of file
-- 
2.4.2
