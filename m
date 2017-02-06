From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  6 Feb 2017 16:56:24 +0100
Subject: [Buildroot] [PATCH 2/2] python-bitstring: new package
In-Reply-To: <20170206155624.9336-1-yegorslists@googlemail.com>
References: <20170206155624.9336-1-yegorslists@googlemail.com>
Message-ID: <20170206155624.9336-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                              |  1 +
 package/python-bitstring/Config.in             |  6 ++++++
 package/python-bitstring/python-bitstring.hash |  2 ++
 package/python-bitstring/python-bitstring.mk   | 14 ++++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/python-bitstring/Config.in
 create mode 100644 package/python-bitstring/python-bitstring.hash
 create mode 100644 package/python-bitstring/python-bitstring.mk

diff --git a/package/Config.in b/package/Config.in
index 304a78046..09672b955 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -655,6 +655,7 @@ menu "External python modules"
 	source "package/python-babel/Config.in"
 	source "package/python-backports-abc/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
+	source "package/python-bitstring/Config.in"
 	source "package/python-bottle/Config.in"
 	source "package/python-can/Config.in"
 	source "package/python-cbor/Config.in"
diff --git a/package/python-bitstring/Config.in b/package/python-bitstring/Config.in
new file mode 100644
index 000000000..93d768257
--- /dev/null
+++ b/package/python-bitstring/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_BITSTRING
+	bool "python-bitstring"
+	help
+	  Simple construction, analysis and modification of binary data.
+
+	  https://github.com/scott-griffiths/bitstring
diff --git a/package/python-bitstring/python-bitstring.hash b/package/python-bitstring/python-bitstring.hash
new file mode 100644
index 000000000..52630e0aa
--- /dev/null
+++ b/package/python-bitstring/python-bitstring.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	b769620c1b52d6c1548c6c4f055613f4eee3120ed8a5cff4ba4ffbbc8a582286  bitstring-3.1.5.tar.gz
diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
new file mode 100644
index 000000000..2c8fb9959
--- /dev/null
+++ b/package/python-bitstring/python-bitstring.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-bitstring
+#
+################################################################################
+
+PYTHON_BITSTRING_VERSION = 3.1.5
+PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
+PYTHON_BITSTRING_SITE = https://github.com/scott-griffiths/bitstring/archive
+PYTHON_BITSTRING_SETUP_TYPE = distutils
+PYTHON_BITSTRING_LICENSE = MIT
+PYTHON_BITSTRING_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
