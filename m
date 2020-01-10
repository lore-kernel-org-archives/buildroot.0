From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri, 10 Jan 2020 18:14:20 -0300
Subject: [Buildroot] [PATCH] package/asn1c: new host package
Message-ID: <20200110211420.7704-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The asn1c is a free, open source compiler of ASN.1 specifications into C
source code.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in.host       |  1 +
 package/asn1c/Config.in.host | 11 +++++++++++
 package/asn1c/asn1c.hash     |  5 +++++
 package/asn1c/asn1c.mk       | 12 ++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/asn1c/Config.in.host
 create mode 100644 package/asn1c/asn1c.hash
 create mode 100644 package/asn1c/asn1c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 80843dd1a113..287e222cdf57 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2241,6 +2241,7 @@ N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	board/toradex/apalis-imx6/
 F:	configs/toradex_apalis_imx6_defconfig
 F:	package/aoetools/
+F:	package/asn1c/
 F:	package/curlpp/
 F:	package/daq/
 F:	package/libgdiplus/
diff --git a/package/Config.in.host b/package/Config.in.host
index 62e860d7c36c..a012ffaa38e9 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,6 +2,7 @@ menu "Host utilities"
 
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
+	source "package/asn1c/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
 	source "package/cargo/Config.in.host"
 	source "package/cbootimage/Config.in.host"
diff --git a/package/asn1c/Config.in.host b/package/asn1c/Config.in.host
new file mode 100644
index 000000000000..951f5f66915e
--- /dev/null
+++ b/package/asn1c/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_ASN1C
+	bool "host asn1c"
+	help
+	  ASN.1 stands for Abstract Syntax Notation One and allows
+	  to describe complex data structures independently of any
+	  particular programming language.
+
+	  The asn1c is a free, open source compiler of ASN.1
+	  specifications into C source code.
+
+	  http://lionet.info/asn1c
diff --git a/package/asn1c/asn1c.hash b/package/asn1c/asn1c.hash
new file mode 100644
index 000000000000..a4fd3beffa53
--- /dev/null
+++ b/package/asn1c/asn1c.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256 8007440b647ef2dd9fb73d931c33ac11764e6afb2437dbe638bb4e5fc82386b9  asn1c-0.9.28.tar.gz
+
+# Hash for license files:
+sha256 bcc636802a52ace2255212be15fb707084af87061b5cfd37eb84dcf6a02cc48b  LICENSE
diff --git a/package/asn1c/asn1c.mk b/package/asn1c/asn1c.mk
new file mode 100644
index 000000000000..314462a92bf9
--- /dev/null
+++ b/package/asn1c/asn1c.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# asn1c
+#
+################################################################################
+
+ASN1C_VERSION = 0.9.28
+ASN1C_SITE = https://github.com/vlm/asn1c/releases/download/v$(ASN1C_VERSION)
+ASN1C_LICENSE = BSD-2-Clause
+ASN1C_LICENSE_FILES = LICENSE
+
+$(eval $(host-autotools-package))
-- 
2.17.1
