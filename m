From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Sat, 20 Dec 2014 15:33:56 +0100
Subject: [Buildroot] [PATCH v3 2/2] python-cheetah: add new package
In-Reply-To: <1419086036-19127-1-git-send-email-gwenj@trabucayre.com>
References: <1419086036-19127-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <1419086036-19127-2-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v2 -> v3:
	- fix dependencies

Changes v1 -> v2:
	- Add python-cheetah patch

 package/Config.in                        |  1 +
 package/python-cheetah/Config.in         | 12 ++++++++++++
 package/python-cheetah/python-cheetah.mk | 14 ++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/python-cheetah/Config.in
 create mode 100644 package/python-cheetah/python-cheetah.mk

diff --git a/package/Config.in b/package/Config.in
index 51630ba..3324f17 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -489,6 +489,7 @@ menu "external python modules"
 	source "package/python-bottle/Config.in"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
+	source "package/python-cheetah/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-crc16/Config.in"
diff --git a/package/python-cheetah/Config.in b/package/python-cheetah/Config.in
new file mode 100644
index 0000000..aaa58c9
--- /dev/null
+++ b/package/python-cheetah/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_CHEETAH
+	bool "python-cheetah"
+	select BR2_PACKAGE_PYTHON_MARKDOWN
+	help
+	  Cheetah is an open source template engine and code generation tool.
+
+	  It can be used standalone or combined with other tools and frameworks.
+	  Web development is its principle use, but Cheetah is very flexible
+	  and is also being used to generate C++ game code, Java, sql, form
+	  emails and even Python code.
+
+	  https://pypi.python.org/pypi/Cheetah/
diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
new file mode 100644
index 0000000..cd066f0
--- /dev/null
+++ b/package/python-cheetah/python-cheetah.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cheetah
+#
+################################################################################
+
+PYTHON_CHEETAH_VERSION = 2.4.4
+PYTHON_CHEETAH_SOURCE = Cheetah-$(PYTHON_CHEETAH_VERSION).tar.gz
+PYTHON_CHEETAH_SITE = http://pypi.python.org/packages/source/C/Cheetah
+PYTHON_CHEETAH_LICENSE = MIT
+PYTHON_CHEETAH_SETUP_TYPE = setuptools
+PYTHON_CHEETAH_DEPENDENCIES += host-python-markdown python-markdown
+
+$(eval $(python-package))
-- 
2.0.4
