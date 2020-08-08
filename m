From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Aug 2020 00:18:18 +0200
Subject: [Buildroot] [git commit branch/next] package/python-bsdiff4: new
 package
Message-ID: <20200808221444.3656E81D63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce75149eb58b7990f1a7a86c2f172140cc5663b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Binary diff and patch using the BSDIFF4-format.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                          |  1 +
 package/python-bsdiff4/Config.in           |  8 ++++++++
 package/python-bsdiff4/python-bsdiff4.hash |  5 +++++
 package/python-bsdiff4/python-bsdiff4.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d7e79f4795..7936cb8105 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -895,6 +895,7 @@ menu "External python modules"
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
index 0000000000..e64e817f9c
--- /dev/null
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/bsdiff4/json
+md5	a0d047e91429ce67a3b0231facf41169  bsdiff4-1.2.0.tar.gz
+sha256	3c2f7f5504f41a54d238b54b00b4544d0eb4276179edabf02b9d00415a03cc9d  bsdiff4-1.2.0.tar.gz
+# Locally computed sha256
+sha256	c6c921c90383f1c43beb53c49a652d28309a410a7c394c729fd8870271451cf0  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
new file mode 100644
index 0000000000..7bc607b2d6
--- /dev/null
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-bsdiff4
+#
+################################################################################
+
+PYTHON_BSDIFF4_VERSION = 1.2.0
+PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/9b/ca/06cd939630ca78125c36489f92b52918980cbcfee2dcc0969411eb5ae8a8
+PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
+PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
+PYTHON_BSDIFF4_SETUP_TYPE = distutils
+
+$(eval $(python-package))
