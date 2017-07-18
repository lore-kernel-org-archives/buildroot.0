From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 18 Jul 2017 09:06:58 +0200
Subject: [Buildroot] [PATCH] python-asn1crypto: new package
Message-ID: <20170718070658.27434-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                |  1 +
 package/python-asn1crypto/Config.in              |  8 ++++++++
 package/python-asn1crypto/python-asn1crypto.hash |  3 +++
 package/python-asn1crypto/python-asn1crypto.mk   | 13 +++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-asn1crypto/Config.in
 create mode 100644 package/python-asn1crypto/python-asn1crypto.hash
 create mode 100644 package/python-asn1crypto/python-asn1crypto.mk

diff --git a/package/Config.in b/package/Config.in
index b48ab5e0d..28cb6f145 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -685,6 +685,7 @@ menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-arrow/Config.in"
+	source "package/python-asn1crypto/Config.in"
 	source "package/python-attrs/Config.in"
 	source "package/python-autobahn/Config.in"
 	source "package/python-babel/Config.in"
diff --git a/package/python-asn1crypto/Config.in b/package/python-asn1crypto/Config.in
new file mode 100644
index 000000000..345c73988
--- /dev/null
+++ b/package/python-asn1crypto/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_ASN1CRYPTO
+	bool "python-asn1crypto"
+	help
+	  Fast ASN.1 parser and serializer with definitions for private keys,
+	  public keys, certificates, CRL, OCSP, CMS, PKCS#3, PKCS#7, PKCS#8,
+	  PKCS#12, PKCS#5, X.509 and TSP.
+
+	  https://github.com/wbond/asn1crypto
diff --git a/package/python-asn1crypto/python-asn1crypto.hash b/package/python-asn1crypto/python-asn1crypto.hash
new file mode 100644
index 000000000..ec5d7cfc2
--- /dev/null
+++ b/package/python-asn1crypto/python-asn1crypto.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/asn1crypto/json, sha256 locally computed
+md5	74a8b9402625b38ef19cf3fa69ef8470  asn1crypto-0.22.0.tar.gz
+sha256	cbbadd640d3165ab24b06ef25d1dca09a3441611ac15f6a6b452474fdf0aed1a  asn1crypto-0.22.0.tar.gz
diff --git a/package/python-asn1crypto/python-asn1crypto.mk b/package/python-asn1crypto/python-asn1crypto.mk
new file mode 100644
index 000000000..681dfd5c1
--- /dev/null
+++ b/package/python-asn1crypto/python-asn1crypto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-asn1crypto
+#
+################################################################################
+
+PYTHON_ASN1CRYPTO_VERSION = 0.22.0
+PYTHON_ASN1CRYPTO_SOURCE = asn1crypto-$(PYTHON_ASN1CRYPTO_VERSION).tar.gz
+PYTHON_ASN1CRYPTO_SITE = https://pypi.python.org/packages/67/14/5d66588868c4304f804ebaff9397255f6ec5559e46724c2496e0f26e68d6
+PYTHON_ASN1CRYPTO_SETUP_TYPE = setuptools
+PYTHON_ASN1CRYPTO_LICENSE = MIT
+
+$(eval $(python-package))
-- 
2.11.0
