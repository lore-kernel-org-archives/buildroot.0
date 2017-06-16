From: Alexandre Esse <alexandre.esse.dev@gmail.com>
Date: Sat, 17 Jun 2017 01:29:27 +0200
Subject: [Buildroot] [PATCH 1/1] kvazaar: new package
Message-ID: <1497655767-752-1-git-send-email-alexandre.esse.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kvazaar is an open-source HEVC encoder licensed under LGPLv2.1.
This provides tools to encode raw video into HEVC stream.

website: http://ultravideo.cs.tut.fi/

Signed-off-by: Alexandre Esse <alexandre.esse.dev@gmail.com>
---
 DEVELOPERS                   |  2 +
 package/Config.in            |  1 +
 package/kvazaar/Config.in    |  4 ++++
 package/kvazaar/kvazaar.hash |  1 +
 package/kvazaar/kvazaar.mk   | 14 ++++++++++++++
 5 files changed, 21 insertions(+)
 create mode 100644 package/kvazaar/Config.in
 create mode 100644 package/kvazaar/kvazaar.hash
 create mode 100644 package/kvazaar/kvazaar.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6f752cb..c45a09d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -65,6 +65,7 @@ N:	Alexandre Belloni <alexandre.belloni@free-electrons.com>
 F:	package/tz/
 
+N:	Alexandre Esse <alexandre.esse.dev@gmail.com>
+F:	package/kvazaar/
 
 N:	Alistair Francis <alistair.francis@xilinx.com>
diff --git a/package/Config.in b/package/Config.in
index 95604ed..236c865 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1220,6 +1220,7 @@ endmenu
 
 menu "Multimedia"
 	source "package/bitstream/Config.in"
+	source "package/kvazaar/Config.in"
 	source "package/libaacs/Config.in"
 	source "package/libamcodec/Config.in"
 	source "package/libass/Config.in"
diff --git a/package/kvazaar/Config.in b/package/kvazaar/Config.in
new file mode 100644
index 0000000..a720f17
--- /dev/null
+++ b/package/kvazaar/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_KVAZAAR
+	bool "kvazaar"
+	help
+                An open-source HEVC encoder licensed under LGPLv2.1
diff --git a/package/kvazaar/kvazaar.hash b/package/kvazaar/kvazaar.hash
new file mode 100644
index 0000000..1f3b65f
--- /dev/null
+++ b/package/kvazaar/kvazaar.hash
@@ -0,0 +1 @@
+sha256 8e382738a51004bfcfca4c832e8b41fe6a17f889f3c39151dc1c1a37261a3a6d  kvazaar-v1.1.0.tar.gz
diff --git a/package/kvazaar/kvazaar.mk b/package/kvazaar/kvazaar.mk
new file mode 100644
index 0000000..0d9eadb
--- /dev/null
+++ b/package/kvazaar/kvazaar.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# kvazaar
+#
+################################################################################
+
+KVAZAAR_VERSION = v1.1.0
+KVAZAAR_SITE = $(call github,ultravideo,kvazaar,$(KVAZAAR_VERSION))
+KVAZAAR_LICENSE = LGPLv2.1
+KVAZAAR_LICENSE_FILES = COPYING
+KVAZAAR_AUTORECONF = YES
+KVAZAAR_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.7.4
