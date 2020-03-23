From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 23 Mar 2020 11:49:03 +0100
Subject: [Buildroot] [PATCH 2/8] package/python-regex: new package
In-Reply-To: <20200323104909.16765-1-yegorslists@googlemail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
Message-ID: <20200323104909.16765-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                      |  1 +
 package/python-regex/Config.in         |  6 ++++++
 package/python-regex/python-regex.hash |  3 +++
 package/python-regex/python-regex.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-regex/Config.in
 create mode 100644 package/python-regex/python-regex.hash
 create mode 100644 package/python-regex/python-regex.mk

diff --git a/package/Config.in b/package/Config.in
index cba756d9f1..802a775831 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1111,6 +1111,7 @@ menu "External python modules"
 	source "package/python-raven/Config.in"
 	source "package/python-redis/Config.in"
 	source "package/python-reentry/Config.in"
+	source "package/python-regex/Config.in"
 	source "package/python-remi/Config.in"
 	source "package/python-request-id/Config.in"
 	source "package/python-requests/Config.in"
diff --git a/package/python-regex/Config.in b/package/python-regex/Config.in
new file mode 100644
index 0000000000..5f582d085a
--- /dev/null
+++ b/package/python-regex/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_REGEX
+	bool "python-regex"
+	help
+	  Alternative regular expression module, to replace re.
+
+	  https://bitbucket.org/mrabarnett/mrab-regex
diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
new file mode 100644
index 0000000000..9e256263a9
--- /dev/null
+++ b/package/python-regex/python-regex.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/regex/json
+md5  ac88a9c036e626ae4d436e69f35f50cf  regex-2020.2.20.tar.gz
+sha256  9e9624440d754733eddbcd4614378c18713d2d9d0dc647cf9c72f64e39671be5  regex-2020.2.20.tar.gz
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
new file mode 100644
index 0000000000..9f86638765
--- /dev/null
+++ b/package/python-regex/python-regex.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-regex
+#
+################################################################################
+
+PYTHON_REGEX_VERSION = 2020.2.20
+PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/e8/76/8ac7f467617b9cfbafcef3c76df6f22b15de654a62bea719792b00a83195
+PYTHON_REGEX_SETUP_TYPE = setuptools
+PYTHON_REGEX_LICENSE = CNRI-Python
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.17.0
