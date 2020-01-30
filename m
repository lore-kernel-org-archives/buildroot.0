From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Jan 2020 00:04:23 +0100
Subject: [Buildroot] [git commit] package/python-aenum: new package
Message-ID: <20200131065647.6965786AC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2707f1c8724784b60d67240a3f95ebc26345e6b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Peter: add license hash]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                      |  1 +
 package/python-aenum/Config.in         |  7 +++++++
 package/python-aenum/python-aenum.hash |  4 ++++
 package/python-aenum/python-aenum.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7c1a2aa7bb..c8f23c2712 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -833,6 +833,7 @@ endif
 	source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
+	source "package/python-aenum/Config.in"
 	source "package/python-aioblescan/Config.in"
 	source "package/python-aiocoap/Config.in"
 	source "package/python-aioconsole/Config.in"
diff --git a/package/python-aenum/Config.in b/package/python-aenum/Config.in
new file mode 100644
index 0000000000..be3dd0fb9c
--- /dev/null
+++ b/package/python-aenum/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_AENUM
+	bool "python-aenum"
+	help
+	  Advanced Enumerations (compatible with Python's stdlib Enum),
+	  NamedTuples, and NamedConstants.
+
+	  https://pypi.org/project/aenum
diff --git a/package/python-aenum/python-aenum.hash b/package/python-aenum/python-aenum.hash
new file mode 100644
index 0000000000..16ee23aba5
--- /dev/null
+++ b/package/python-aenum/python-aenum.hash
@@ -0,0 +1,4 @@
+# sha256 from https://pypi.org/pypi/aenum/json
+sha256	a4334cabf47c167d44ab5a6198837b80deec5d5bad1b5cf70c966c3a330260e8  aenum-2.2.3.tar.gz
+# locally calculated
+sha256	0db837e38002017b352666c83c8d3216ee5b9b2229375eb2cf4487f8c24e1f8c  aenum/LICENSE
diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
new file mode 100644
index 0000000000..1d5322ef41
--- /dev/null
+++ b/package/python-aenum/python-aenum.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aenum
+#
+################################################################################
+
+PYTHON_AENUM_VERSION = 2.2.3
+PYTHON_AENUM_SOURCE = aenum-$(PYTHON_AENUM_VERSION).tar.gz
+PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/6f/6a/8ed729e0add885d7a559ebb06133029b1f8c4bd66cbf1bdee1ec969fb310
+PYTHON_AENUM_SETUP_TYPE = setuptools
+PYTHON_AENUM_LICENSE = BSD-3-Clause
+PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
+
+$(eval $(python-package))
