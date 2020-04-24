From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Apr 2020 14:57:00 +0200
Subject: [Buildroot] [git commit] package/python3-cheetah: add special host
 variant
Message-ID: <20200425093247.D0AD9805E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80c09eb511309623ad40e1f940fccba2bb25803b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed to build mongodb.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cheetah/python-cheetah.mk     |  1 +
 package/python3-cheetah/python3-cheetah.hash |  1 +
 package/python3-cheetah/python3-cheetah.mk   | 18 ++++++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
index 1ad49a43b7..3dfd1fc54a 100644
--- a/package/python-cheetah/python-cheetah.mk
+++ b/package/python-cheetah/python-cheetah.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-cheetah/python3-cheetah.mk
 PYTHON_CHEETAH_VERSION = 3.2.4
 PYTHON_CHEETAH_SOURCE = Cheetah3-$(PYTHON_CHEETAH_VERSION).tar.gz
 PYTHON_CHEETAH_SITE = https://files.pythonhosted.org/packages/4e/72/e6a7d92279e3551db1b68fd336fd7a6e3d2f2ec742bf486486e6150d77d2
diff --git a/package/python3-cheetah/python3-cheetah.hash b/package/python3-cheetah/python3-cheetah.hash
new file mode 120000
index 0000000000..c29a76ea80
--- /dev/null
+++ b/package/python3-cheetah/python3-cheetah.hash
@@ -0,0 +1 @@
+../python-cheetah/python-cheetah.hash
\ No newline at end of file
diff --git a/package/python3-cheetah/python3-cheetah.mk b/package/python3-cheetah/python3-cheetah.mk
new file mode 100644
index 0000000000..8876f8d735
--- /dev/null
+++ b/package/python3-cheetah/python3-cheetah.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python3-cheetah
+#
+################################################################################
+
+# Please keep in sync with
+# package/python-cheetah/python-cheetah.mk
+PYTHON3_CHEETAH_VERSION = 3.2.4
+PYTHON3_CHEETAH_SOURCE = Cheetah3-$(PYTHON3_CHEETAH_VERSION).tar.gz
+PYTHON3_CHEETAH_SITE = https://files.pythonhosted.org/packages/4e/72/e6a7d92279e3551db1b68fd336fd7a6e3d2f2ec742bf486486e6150d77d2
+PYTHON3_CHEETAH_LICENSE = MIT
+PYTHON3_CHEETAH_LICENSE_FILES = LICENSE
+PYTHON3_CHEETAH_SETUP_TYPE = setuptools
+HOST_PYTHON3_CHEETAH_DL_SUBDIR = python-cheetah
+HOST_PYTHON3_CHEETAH_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
