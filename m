From: gpotter2 <gabriel@potter.fr>
Date: Tue,  3 Dec 2019 23:28:32 +0000
Subject: [Buildroot] [PATCH 1/1] package/python-scapy3k: remove package
Message-ID: <20191203232832.70247-1-gabriel@potter.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Scapy3k is deprecated since Scapy supports Python 3.
Scapy should be used instead

See https://bugs.busybox.net/show_bug.cgi?id=12376

Signed-off-by: Gabriel Potter <gabriel@potter.fr>
---
 Config.in.legacy                           |  6 ++++++
 package/Config.in                          |  1 -
 package/python-scapy3k/Config.in           |  9 ---------
 package/python-scapy3k/python-scapy3k.hash |  2 --
 package/python-scapy3k/python-scapy3k.mk   | 12 ------------
 5 files changed, 6 insertions(+), 24 deletions(-)
 delete mode 100644 package/python-scapy3k/Config.in
 delete mode 100644 package/python-scapy3k/python-scapy3k.hash
 delete mode 100644 package/python-scapy3k/python-scapy3k.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 02886bff36..dfe7683a42 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_PYTHON_SCAPY3K
+	bool "scapy3k was removed"
+	select BR2_LEGACY
+	help
+	  scapy3k has been deprecated since Scapy gained Python 3 support. Use BR2_PACKAGE_PYTHON_SCAPY instead
+
 config BR2_BINUTILS_VERSION_2_30_X
 	bool "binutils version 2.30 support removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 9e2b78fe6a..307583d01f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1078,7 +1078,6 @@ menu "External python modules"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy/Config.in"
-	source "package/python-scapy3k/Config.in"
 	source "package/python-schedule/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
diff --git a/package/python-scapy3k/Config.in b/package/python-scapy3k/Config.in
deleted file mode 100644
index 3e75fcd177..0000000000
--- a/package/python-scapy3k/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_PYTHON_SCAPY3K
-	bool "python-scapy3k"
-	depends on BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON3_ZLIB
-	help
-	  Network packet and pcap file crafting/sniffing/manipulation
-	  security tool (based on scapy) with python3 compatibility.
-
-	  https://github.com/phaethon/scapy
diff --git a/package/python-scapy3k/python-scapy3k.hash b/package/python-scapy3k/python-scapy3k.hash
deleted file mode 100644
index 0faa3761f0..0000000000
--- a/package/python-scapy3k/python-scapy3k.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256  3717913cb54f211918eccb65fad9ccf8a66bd542a4a659b2c0ac762db08eb766  python-scapy3k-0.18.tar.gz
diff --git a/package/python-scapy3k/python-scapy3k.mk b/package/python-scapy3k/python-scapy3k.mk
deleted file mode 100644
index 63f081e3fc..0000000000
--- a/package/python-scapy3k/python-scapy3k.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# python-scapy3k
-#
-################################################################################
-
-PYTHON_SCAPY3K_VERSION = 0.18
-PYTHON_SCAPY3K_SITE = $(call github,phaethon,scapy,v$(PYTHON_SCAPY3K_VERSION))
-PYTHON_SCAPY3K_SETUP_TYPE = distutils
-PYTHON_SCAPY3K_LICENSE = GPL-2.0+
-
-$(eval $(python-package))
-- 
2.17.1
