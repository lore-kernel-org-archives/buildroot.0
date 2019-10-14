From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 14 Oct 2019 22:12:27 +0300
Subject: [Buildroot] [PATCH 2/3] package/python-jaraco-functools: new package
In-Reply-To: <20191014191228.13432-1-asafka7@gmail.com>
References: <20191014191228.13432-1-asafka7@gmail.com>
Message-ID: <20191014191228.13432-12-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/Config.in                                 |  1 +
 package/python-jaraco-functools/Config.in         | 10 ++++++++++
 .../python-jaraco-functools.hash                  |  5 +++++
 .../python-jaraco-functools.mk                    | 15 +++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-jaraco-functools/Config.in
 create mode 100644 package/python-jaraco-functools/python-jaraco-functools.hash
 create mode 100644 package/python-jaraco-functools/python-jaraco-functools.mk

diff --git a/package/Config.in b/package/Config.in
index faa4689548..96ce12e388 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -938,6 +938,7 @@ menu "External python modules"
 	source "package/python-iso8601/Config.in"
 	source "package/python-itsdangerous/Config.in"
 	source "package/python-jaraco-classes/Config.in"
+	source "package/python-jaraco-functools/Config.in"
 	source "package/python-jedi/Config.in"
 	source "package/python-jinja2/Config.in"
 	source "package/python-json-schema-validator/Config.in"
diff --git a/package/python-jaraco-functools/Config.in b/package/python-jaraco-functools/Config.in
new file mode 100644
index 0000000000..e07c3131ff
--- /dev/null
+++ b/package/python-jaraco-functools/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS
+	bool "python-jaraco-functools"
+	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE \
+               if BR2_PACKAGE_PYTHON # runtime
+	help
+	  Additional functools in the spirit of stdlib?s
+	  functools.
+
+	  https://github.com/jaraco/jaraco.functools
diff --git a/package/python-jaraco-functools/python-jaraco-functools.hash b/package/python-jaraco-functools/python-jaraco-functools.hash
new file mode 100644
index 0000000000..051a39bfcf
--- /dev/null
+++ b/package/python-jaraco-functools/python-jaraco-functools.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/jaraco.functools/json
+md5     c245ade3e753bc556415f1fec102f232  jaraco.functools-2.0.tar.gz
+sha256  35ba944f52b1a7beee8843a5aa6752d1d5b79893eeb7770ea98be6b637bf9345  jaraco.functools-2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-jaraco-functools/python-jaraco-functools.mk b/package/python-jaraco-functools/python-jaraco-functools.mk
new file mode 100644
index 0000000000..f062063b0b
--- /dev/null
+++ b/package/python-jaraco-functools/python-jaraco-functools.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-jaraco-functools
+#
+################################################################################
+
+PYTHON_JARACO_FUNCTOOLS_VERSION = 2.0
+PYTHON_JARACO_FUNCTOOLS_SOURCE = jaraco.functools-$(PYTHON_JARACO_FUNCTOOLS_VERSION).tar.gz
+PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/a9/1e/44f6a5cffef147a3ffd37a748b8f4c2ded9b07ca20a15f17cd9874158f24
+PYTHON_JARACO_FUNCTOOLS_LICENSE = MIT
+PYTHON_JARACO_FUNCTOOLS_LICENSE_FILES = LICENSE
+PYTHON_JARACO_FUNCTOOLS_SETUP_TYPE = setuptools
+PYTHON_JARACO_FUNCTOOLS_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.20.1
