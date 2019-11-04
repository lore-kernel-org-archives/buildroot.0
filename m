From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:20:37 +0100
Subject: [Buildroot] [git commit] package/python-tqdm: new package
Message-ID: <20191104211411.15EAC8E6F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28e72ce2ade102de4874ce0b0c79b40eead47b98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A Fast, Extensible Progress Bar for Python and CLI.

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
[Thomas:
 - drop depends on BR2_PACKAGE_PYTHON3
 - fix license information]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-tqdm/Config.in        |  6 ++++++
 package/python-tqdm/python-tqdm.hash |  5 +++++
 package/python-tqdm/python-tqdm.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3bea7c4cf7..24c57b25f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1391,6 +1391,7 @@ F:	package/ti-sgx-um/
 N:	Louis Aussedat <aussedat.louis@gmail.com>
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
index 0000000000..89b571fe6a
--- /dev/null
+++ b/package/python-tqdm/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TQDM
+	bool "python-tqdm"
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
index 0000000000..3aa562e22e
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
+PYTHON_TQDM_LICENSE = MPL-2.0, MIT
+PYTHON_TQDM_LICENSE_FILES = LICENCE
+
+$(eval $(python-package))
