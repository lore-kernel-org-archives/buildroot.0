From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 23 Mar 2020 11:49:05 +0100
Subject: [Buildroot] [PATCH 4/8] package/python3-cheetah: add special host
 variant
In-Reply-To: <20200323104909.16765-1-yegorslists@googlemail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
Message-ID: <20200323104909.16765-4-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Needed to build mongodb.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python3-cheetah/python-cheetah.mk    | 18 ++++++++++++++++++
 package/python3-cheetah/python3-cheetah.hash |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 package/python3-cheetah/python-cheetah.mk
 create mode 120000 package/python3-cheetah/python3-cheetah.hash

diff --git a/package/python3-cheetah/python-cheetah.mk b/package/python3-cheetah/python-cheetah.mk
new file mode 100644
index 0000000000..8876f8d735
--- /dev/null
+++ b/package/python3-cheetah/python-cheetah.mk
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
diff --git a/package/python3-cheetah/python3-cheetah.hash b/package/python3-cheetah/python3-cheetah.hash
new file mode 120000
index 0000000000..c29a76ea80
--- /dev/null
+++ b/package/python3-cheetah/python3-cheetah.hash
@@ -0,0 +1 @@
+../python-cheetah/python-cheetah.hash
\ No newline at end of file
-- 
2.17.0
