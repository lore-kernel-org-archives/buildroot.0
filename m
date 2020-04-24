From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Apr 2020 15:16:17 +0200
Subject: [Buildroot] [git commit] package/python3-requests: add special host
 variant
Message-ID: <20200425093247.D9DB7805E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97ac0abad212d5bd78acf9f01d56cee2dcb9f1ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed to build mongodb.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-requests/python-requests.mk     |  1 +
 package/python3-requests/python3-requests.hash |  1 +
 package/python3-requests/python3-requests.mk   | 17 +++++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 1adf564015..9d36346b65 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-requests/python3-requests.mk
 PYTHON_REQUESTS_VERSION = 2.23.0
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
 PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/f5/4f/280162d4bd4d8aad241a21aecff7a6e46891b905a4341e7ab549ebaf7915
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
index 0000000000..e2bb00eab2
--- /dev/null
+++ b/package/python3-requests/python3-requests.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python3-requests
+#
+################################################################################
+
+# Please keep in sync with package/python-requests/python-requests.mk
+PYTHON3_REQUESTS_VERSION = 2.23.0
+PYTHON3_REQUESTS_SOURCE = requests-$(PYTHON3_REQUESTS_VERSION).tar.gz
+PYTHON3_REQUESTS_SITE = https://files.pythonhosted.org/packages/f5/4f/280162d4bd4d8aad241a21aecff7a6e46891b905a4341e7ab549ebaf7915
+PYTHON3_REQUESTS_SETUP_TYPE = setuptools
+PYTHON3_REQUESTS_LICENSE = Apache-2.0
+PYTHON3_REQUESTS_LICENSE_FILES = LICENSE
+HOST_PYTHON3_REQUESTS_DL_SUBDIR = python-requests
+HOST_PYTHON3_REQUESTS_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
