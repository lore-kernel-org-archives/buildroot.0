From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@essensium.com>
Date: Fri,  7 Feb 2020 12:43:50 +0100
Subject: [Buildroot] [PATCH 4/4] package/python-boto3: new package.
In-Reply-To: <20200207114350.31365-1-raphael.melotte@essensium.com>
References: <20200207114350.31365-1-raphael.melotte@essensium.com>
Message-ID: <20200207114350.31365-5-raphael.melotte@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The AWS SDK for Python.

Signed-off-by: Rapha?l M?lotte <raphael.melotte@essensium.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-boto3/Config.in         |  9 +++++++++
 package/python-boto3/python-boto3.hash |  5 +++++
 package/python-boto3/python-boto3.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-boto3/Config.in
 create mode 100644 package/python-boto3/python-boto3.hash
 create mode 100644 package/python-boto3/python-boto3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4d636ebb47..2b9837d17a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2077,6 +2077,7 @@ F:	package/uhttpd/
 F:	package/ustream-ssl/
 
 N:  Rapha?l M?lotte <raphael.melotte@essensium.com>
+F:  package/python-boto3/
 F:  package/python-botocore/
 F:  package/python-jmespath/
 F:  package/python-s3transfer/
diff --git a/package/Config.in b/package/Config.in
index 9d5d5dba6d..54101c3803 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -877,6 +877,7 @@ menu "External python modules"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bitstring/Config.in"
 	source "package/python-bluezero/Config.in"
+	source "package/python-boto3/Config.in"
 	source "package/python-botocore/Config.in"
 	source "package/python-bottle/Config.in"
 	source "package/python-brotli/Config.in"
diff --git a/package/python-boto3/Config.in b/package/python-boto3/Config.in
new file mode 100644
index 0000000000..67b1420388
--- /dev/null
+++ b/package/python-boto3/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_BOTO3
+	bool "python-boto3"
+	select BR2_PACKAGE_PYTHON_BOTOCORE # runtime
+	select BR2_PACKAGE_PYTHON_JMESPATH # runtime
+	select BR2_PACKAGE_PYTHON_S3TRANSFER # runtime
+	help
+	  The AWS SDK for Python.
+
+	  https://github.com/boto/boto3
diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
new file mode 100644
index 0000000000..49eb9ae5c6
--- /dev/null
+++ b/package/python-boto3/python-boto3.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/boto3/json
+md5	02e0d5ea4affd9c64e9166d5d3786766  boto3-1.9.210.tar.gz
+sha256	e221f6867282266e06aec2213f0ea5fdbd4eb3facbca4fcbf96886073350bc5e  boto3-1.9.210.tar.gz
+# Locally computed sha256 checksums
+sha256	0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
new file mode 100644
index 0000000000..e00cb84ad1
--- /dev/null
+++ b/package/python-boto3/python-boto3.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-boto3
+#
+################################################################################
+
+PYTHON_BOTO3_VERSION = 1.9.210
+PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/d3/ac/79093e14a5397096d1fe4a17329a8453cebed8629cbc434e2dad5fb75b65
+PYTHON_BOTO3_SETUP_TYPE = setuptools
+PYTHON_BOTO3_LICENSE = Apache-2.0
+PYTHON_BOTO3_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.23.0
