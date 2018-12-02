From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:26 -0000
Subject: [Buildroot] [git commit] python-pycares: new package
Message-ID: <20181202071554.C29D28107F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba9e5d0fc0c9aec4f81148a67567df78fc5992fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python interface for c-ares.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-pycares/Config.in           |  6 ++++++
 package/python-pycares/python-pycares.hash |  5 +++++
 package/python-pycares/python-pycares.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 53467da489..88dcbc11a2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -986,6 +986,7 @@ F:	configs/pine64_sopine_defconfig
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/python-async-timeout/
 F:	package/python-multidict/
+F:	package/python-pycares/
 F:	package/python-yarl/
 
 N:	James Knight <james.knight@rockwellcollins.com>
diff --git a/package/Config.in b/package/Config.in
index b60e7700ad..4d7ed6512f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -949,6 +949,7 @@ menu "External python modules"
 	source "package/python-pyasn-modules/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
+	source "package/python-pycares/Config.in"
 	source "package/python-pycli/Config.in"
 	source "package/python-pycparser/Config.in"
 	source "package/python-pycrypto/Config.in"
diff --git a/package/python-pycares/Config.in b/package/python-pycares/Config.in
new file mode 100644
index 0000000000..4144952d8d
--- /dev/null
+++ b/package/python-pycares/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYCARES
+	bool "python-pycares"
+	help
+	  Python interface for c-ares.
+
+	  http://github.com/saghul/pycares
diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
new file mode 100644
index 0000000000..2e80a974dc
--- /dev/null
+++ b/package/python-pycares/python-pycares.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pycares/json
+md5	74893b2b380fbb45329a406ae4b1ae89  pycares-2.3.0.tar.gz
+sha256	36f4c03df57c41a87eb3d642201684eb5a8bc194f4bafaa9f60ee6dc0aef8e40  pycares-2.3.0.tar.gz
+# Locally computed sha256 checksums
+sha256	427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
new file mode 100644
index 0000000000..961c87eaf0
--- /dev/null
+++ b/package/python-pycares/python-pycares.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pycares
+#
+################################################################################
+
+PYTHON_PYCARES_VERSION = 2.3.0
+PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/89/5c/3a7e1a52d6abb52b9ca1a56d2df699936e89d8b98f75cfd60d03363e7c10
+PYTHON_PYCARES_SETUP_TYPE = setuptools
+PYTHON_PYCARES_LICENSE = MIT
+PYTHON_PYCARES_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
