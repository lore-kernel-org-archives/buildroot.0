From: Horatiu Vultur <horatiu.vultur@microchip.com>
Date: Sat, 15 Aug 2020 16:26:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/easyframes: new package
Message-ID: <20200815142631.1054530-1-horatiu.vultur@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/easyframes/Config.in       | 13 +++++++++++++
 package/easyframes/easyframes.hash |  1 +
 package/easyframes/easyframes.mk   | 16 ++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/easyframes/Config.in
 create mode 100644 package/easyframes/easyframes.hash
 create mode 100644 package/easyframes/easyframes.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 35840ec9a8..dd1ec8903c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1109,6 +1109,9 @@ F:	package/gauche/
 F:	package/gmrender-resurrect/
 F:	package/squeezelite/
 
+N:	Horatiu Vultur <horatiu.vultur@microchip.com>
+F:	package/easyframes/
+
 N:	Ian Haylock <haylocki@yahoo.co.uk>
 F:	package/python-rpi-gpio/
 
diff --git a/package/Config.in b/package/Config.in
index d7e79f4795..3965d523c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2039,6 +2039,7 @@ menu "Networking applications"
 	source "package/dnsmasq/Config.in"
 	source "package/drbd-utils/Config.in"
 	source "package/dropbear/Config.in"
+	source "package/easyframes/Config.in"
 	source "package/ebtables/Config.in"
 	source "package/ejabberd/Config.in"
 	source "package/ethtool/Config.in"
diff --git a/package/easyframes/Config.in b/package/easyframes/Config.in
new file mode 100644
index 0000000000..bed5de0ce0
--- /dev/null
+++ b/package/easyframes/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_EASYFRAMES
+	bool "easyframes"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_ZLIB
+	help
+	  This is a small and simple command-line tool for network testing.
+	  The tool makes it simple to compose a frame, inject and express what
+	  and where frames are expected to be received.
+
+	  https://github.com/microchip-ung/easyframes
diff --git a/package/easyframes/easyframes.hash b/package/easyframes/easyframes.hash
new file mode 100644
index 0000000000..371e927170
--- /dev/null
+++ b/package/easyframes/easyframes.hash
@@ -0,0 +1 @@
+sha256 998d260f0e2dd3206201e566af176ebf20298185f040c3c8bf085e054aeed10f easyframes-25f3aad30a7d8c7844cb08a95a1048959553a503.tar.gz
diff --git a/package/easyframes/easyframes.mk b/package/easyframes/easyframes.mk
new file mode 100644
index 0000000000..8b22bac03b
--- /dev/null
+++ b/package/easyframes/easyframes.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# easyframes
+#
+################################################################################
+
+EASYFRAMES_VERSION = 25f3aad30a7d8c7844cb08a95a1048959553a503
+EASYFRAMES_SITE_METHOD = git
+EASYFRAMES_SITE = https://github.com/microchip-ung/easyframes
+EASYFRAMES_INSTALL_STAGING = YES
+EASYFRAMES_DEPENDENCIES = zlib libpcap
+
+EASYFRAMES_LICENSE = MIT
+EASYFRAMES_LICENSE_FILES = COPYING
+
+$(eval $(cmake-package))
-- 
2.27.0
