From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 23 Mar 2020 11:49:06 +0100
Subject: [Buildroot] [PATCH 5/8] package/python3-requests: add special host
 variant
In-Reply-To: <20200323104909.16765-1-yegorslists@googlemail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
Message-ID: <20200323104909.16765-5-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Needed to build mongodb.

Also convert python-requests to host package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-requests/python-requests.mk     |  1 +
 package/python3-requests/python3-requests.hash |  1 +
 package/python3-requests/python3-requests.mk   | 18 ++++++++++++++++++
 3 files changed, 20 insertions(+)
 create mode 120000 package/python3-requests/python3-requests.hash
 create mode 100644 package/python3-requests/python3-requests.mk

diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index e64db94523..8c012145f3 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -12,3 +12,4 @@ PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/package/python3-requests/python3-requests.hash b/package/python3-requests/python3-requests.hash
new file mode 120000
index 0000000000..19e182d4a6
--- /dev/null
+++ b/package/python3-requests/python3-requests.hash
@@ -0,0 +1 @@
+../python-requests/python-requests.hash
\ No newline at end of file
diff --git a/package/python3-requests/python3-requests.mk b/package/python3-requests/python3-requests.mk
new file mode 100644
index 0000000000..b75b388499
--- /dev/null
+++ b/package/python3-requests/python3-requests.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python3-requests
+#
+################################################################################
+
+# Please keep in sync with
+# package/python-requests/python-requests.mk
+PYTHON3_REQUESTS_VERSION = 2.22.0
+PYTHON3_REQUESTS_SOURCE = requests-$(PYTHON3_REQUESTS_VERSION).tar.gz
+PYTHON3_REQUESTS_SITE = https://files.pythonhosted.org/packages/01/62/ddcf76d1d19885e8579acb1b1df26a852b03472c0e46d2b959a714c90608
+PYTHON3_REQUESTS_SETUP_TYPE = setuptools
+PYTHON3_REQUESTS_LICENSE = Apache-2.0
+PYTHON3_REQUESTS_LICENSE_FILES = LICENSE
+HOST_PYTHON3_REQUESTS_DL_SUBDIR = python-requests
+HOST_PYTHON3_REQUESTS_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
-- 
2.17.0
