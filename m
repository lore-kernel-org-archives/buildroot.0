From: Horatiu Vultur <horatiu.vultur@microchip.com>
Date: Sat, 29 Aug 2020 09:24:16 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/easyframes: new package
Message-ID: <20200829072416.951156-1-horatiu.vultur@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>

---
Changes v3 -> v4:
  - update the version
  - remove C++ dependecy

Changes v2 -> v3:
  - add missing changelog

Changes v1 -> v2:
  - add missing comment in easyframes.hash
  - add sha256 for COPYING
  - remove zlib dependency
  - change from using sha to use tag
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/easyframes/Config.in       |  9 +++++++++
 package/easyframes/easyframes.hash |  3 +++
 package/easyframes/easyframes.mk   | 15 +++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/easyframes/Config.in
 create mode 100644 package/easyframes/easyframes.hash
 create mode 100644 package/easyframes/easyframes.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3c3dcda859..96414f5b4b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1111,6 +1111,9 @@ F:	package/gauche/
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
index 0000000000..f3a4ddbb34
--- /dev/null
+++ b/package/easyframes/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_EASYFRAMES
+	bool "easyframes"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  This is a small and simple command-line tool for network testing.
+	  The tool makes it simple to compose a frame, inject and express what
+	  and where frames are expected to be received.
+
+	  https://github.com/microchip-ung/easyframes
diff --git a/package/easyframes/easyframes.hash b/package/easyframes/easyframes.hash
new file mode 100644
index 0000000000..a0b193ca6e
--- /dev/null
+++ b/package/easyframes/easyframes.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 3c0449b3129c29b5ecf67b689f1a75ffc65fde3c5f62811e2f0439ce4f4af392 easyframes-v0.3.tar.gz
+sha256 24f37598e822a1411fb7164ce7eb3ef120aea8279016399abc282c2381ce3f57 COPYING
diff --git a/package/easyframes/easyframes.mk b/package/easyframes/easyframes.mk
new file mode 100644
index 0000000000..b0ec1ae7e5
--- /dev/null
+++ b/package/easyframes/easyframes.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# easyframes
+#
+################################################################################
+
+EASYFRAMES_VERSION = v0.3
+EASYFRAMES_SITE = $(call github,microchip-ung,easyframes,$(EASYFRAMES_VERSION))
+EASYFRAMES_INSTALL_STAGING = YES
+EASYFRAMES_DEPENDENCIES = libpcap
+
+EASYFRAMES_LICENSE = MIT
+EASYFRAMES_LICENSE_FILES = COPYING
+
+$(eval $(cmake-package))
-- 
2.27.0
