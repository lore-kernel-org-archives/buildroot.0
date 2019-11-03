From: Louis Aussedat <aussedat.louis@gmail.com>
Date: Sun,  3 Nov 2019 17:01:58 +0100
Subject: [Buildroot] [PATCH 2/2] package/python-tqdm: new package
In-Reply-To: <20191103160158.16864-1-aussedat.louis@gmail.com>
References: <20191103160158.16864-1-aussedat.louis@gmail.com>
Message-ID: <20191103160158.16864-2-aussedat.louis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A Fast, Extensible Progress Bar for Python and CLI.

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-tqdm/Config.in        |  7 +++++++
 package/python-tqdm/python-tqdm.hash |  5 +++++
 package/python-tqdm/python-tqdm.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-tqdm/Config.in
 create mode 100644 package/python-tqdm/python-tqdm.hash
 create mode 100644 package/python-tqdm/python-tqdm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9782614239..211545242d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1391,6 +1391,7 @@ F:	package/ti-sgx-um/
 N:  Louis Aussedat <aussedat.louis@gmail.com>
 F:	board/friendlyarm/nanopi-neo-plus2/
 F:	configs/friendlyarm_nanopi_neo_plus2_defconfig
+F:	package/python-tqdm/
 
 N:	Louis-Paul Cordier <lpdev@cordier.org>
 F:	package/intel-gmmlib/
diff --git a/package/Config.in b/package/Config.in
index 2819cab4ae..1ad1d49a8a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1109,6 +1109,7 @@ menu "External python modules"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
 	source "package/python-tornado/Config.in"
+	source "package/python-tqdm/Config.in"
 	source "package/python-traitlets/Config.in"
 	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
diff --git a/package/python-tqdm/Config.in b/package/python-tqdm/Config.in
new file mode 100644
index 0000000000..52978331dc
--- /dev/null
+++ b/package/python-tqdm/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TQDM
+	bool "python-tqdm"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  A Fast, Extensible Progress Bar for Python and CLI.
+
+	  https://tqdm.github.io
diff --git a/package/python-tqdm/python-tqdm.hash b/package/python-tqdm/python-tqdm.hash
new file mode 100644
index 0000000000..63dea98cf2
--- /dev/null
+++ b/package/python-tqdm/python-tqdm.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/project/tqdm
+md5	84f1744e2cc097d9e824a2e201cca4a6  tqdm-4.37.0.tar.gz
+sha256	fca09992116d6dc3ad9789cf601a254081eb40d5c14c1863ab6cd10e15c2cb26  tqdm-4.37.0.tar.gz
+# Locally computed sha256 checksums
+sha256	1bbf12d09d437844527b3cdaba01d379dac651b5cbb5ebb0d764274684d2680b  LICENCE
diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
new file mode 100644
index 0000000000..c91213765d
--- /dev/null
+++ b/package/python-tqdm/python-tqdm.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-tqdm
+#
+################################################################################
+
+PYTHON_TQDM_VERSION = 4.37.0
+PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
+PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/cc/7b/5878d4e1b01a2eb802f78ea277f2385072681cabefc8fb4fbdee28dd1869
+PYTHON_TQDM_SETUP_TYPE = setuptools
+PYTHON_TQDM_LICENSE = MPL-2.0
+PYTHON_TQDM_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.20.1
