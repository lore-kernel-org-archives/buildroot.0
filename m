From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Sep 2020 22:16:23 +0200
Subject: [Buildroot] [git commit] package/asn1c: new host package
Message-ID: <20200914202856.B71148A615@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16c7ac984f2f213b6fcb91b498cacc858984a675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The asn1c is a free, open source compiler of ASN.1 specifications into C
source code.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in.host       |  1 +
 package/asn1c/Config.in.host | 11 +++++++++++
 package/asn1c/asn1c.hash     |  5 +++++
 package/asn1c/asn1c.mk       | 12 ++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 884c79cfdf..f754a6f341 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2384,6 +2384,7 @@ N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	board/toradex/apalis-imx6/
 F:	configs/toradex_apalis_imx6_defconfig
 F:	package/aoetools/
+F:	package/asn1c/
 F:	package/azure-iot-sdk-c/
 F:	package/curlpp/
 F:	package/daq/
diff --git a/package/Config.in.host b/package/Config.in.host
index 097e2fb47d..243da8969f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,6 +2,7 @@ menu "Host utilities"
 
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
+	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
 	source "package/cbootimage/Config.in.host"
diff --git a/package/asn1c/Config.in.host b/package/asn1c/Config.in.host
new file mode 100644
index 0000000000..951f5f6691
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
index 0000000000..abc4d77e1c
--- /dev/null
+++ b/package/asn1c/asn1c.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  8007440b647ef2dd9fb73d931c33ac11764e6afb2437dbe638bb4e5fc82386b9  asn1c-0.9.28.tar.gz
+
+# Hash for license files:
+sha256  bcc636802a52ace2255212be15fb707084af87061b5cfd37eb84dcf6a02cc48b  LICENSE
diff --git a/package/asn1c/asn1c.mk b/package/asn1c/asn1c.mk
new file mode 100644
index 0000000000..314462a92b
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
