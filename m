From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Feb 2016 16:34:23 +0100
Subject: [Buildroot] [git commit] python-cbor: new package
Message-ID: <20160202161733.B6DD7805BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d75a2dbaa73914273d0094132fb4583c62ad7d37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/python-cbor/Config.in        |  7 +++++++
 package/python-cbor/python-cbor.hash |  3 +++
 package/python-cbor/python-cbor.mk   | 13 +++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a10d926..a491d85 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -622,6 +622,7 @@ menu "External python modules"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bottle/Config.in"
 	source "package/python-can/Config.in"
+	source "package/python-cbor/Config.in"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
 	source "package/python-cheetah/Config.in"
diff --git a/package/python-cbor/Config.in b/package/python-cbor/Config.in
new file mode 100644
index 0000000..2d0962d
--- /dev/null
+++ b/package/python-cbor/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_CBOR
+	bool "python-cbor"
+	help
+	  RFC 7049 - Concise Binary Object Representation.
+
+	  https://pypi.python.org/pypi/cbor
+
diff --git a/package/python-cbor/python-cbor.hash b/package/python-cbor/python-cbor.hash
new file mode 100644
index 0000000..6714348
--- /dev/null
+++ b/package/python-cbor/python-cbor.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=711ee5ecc896595c1e95c1c48356606c, sha256 locally computed.
+md5	711ee5ecc896595c1e95c1c48356606c  cbor-0.1.25.tar.gz
+sha256	e342d425dde88bb93b741e34e3ba092492ba1f6fca94ce356054fb7daa420746  cbor-0.1.25.tar.gz
diff --git a/package/python-cbor/python-cbor.mk b/package/python-cbor/python-cbor.mk
new file mode 100644
index 0000000..4c3ce9d
--- /dev/null
+++ b/package/python-cbor/python-cbor.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-cbor
+#
+################################################################################
+
+PYTHON_CBOR_VERSION = 0.1.25
+PYTHON_CBOR_SOURCE = cbor-$(PYTHON_CBOR_VERSION).tar.gz
+PYTHON_CBOR_SITE = http://pypi.python.org/packages/source/c/cbor
+PYTHON_CBOR_LICENSE = Apache
+PYTHON_CBOR_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
