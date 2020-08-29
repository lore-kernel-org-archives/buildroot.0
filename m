From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 12:04:01 +0200
Subject: [Buildroot] [git commit] package/easyframes: new package
Message-ID: <20200902161637.5A7CB85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=841c604748c7ccd40bd618af912998ec3b9cec69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/easyframes/Config.in       | 10 ++++++++++
 package/easyframes/easyframes.hash |  3 +++
 package/easyframes/easyframes.mk   | 13 +++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f4980c72cb..5b783a7fe4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1110,6 +1110,9 @@ F:	package/gauche/
 F:	package/gmrender-resurrect/
 F:	package/squeezelite/
 
+N:	Horatiu Vultur <horatiu.vultur@microchip.com>
+F:	package/easyframes/
+
 N:	Ian Haylock <haylocki@yahoo.co.uk>
 F:	package/python-rpi-gpio/
 
diff --git a/package/Config.in b/package/Config.in
index efa5e474c3..f5cdf7c55a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2046,6 +2046,7 @@ menu "Networking applications"
 	source "package/dnsmasq/Config.in"
 	source "package/drbd-utils/Config.in"
 	source "package/dropbear/Config.in"
+	source "package/easyframes/Config.in"
 	source "package/ebtables/Config.in"
 	source "package/ejabberd/Config.in"
 	source "package/ethtool/Config.in"
diff --git a/package/easyframes/Config.in b/package/easyframes/Config.in
new file mode 100644
index 0000000000..b2c45496b4
--- /dev/null
+++ b/package/easyframes/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_EASYFRAMES
+	bool "easyframes"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  This is a small and simple command-line tool for network
+	  testing.  The tool makes it simple to compose a frame,
+	  inject and express what and where frames are expected to be
+	  received.
+
+	  https://github.com/microchip-ung/easyframes
diff --git a/package/easyframes/easyframes.hash b/package/easyframes/easyframes.hash
new file mode 100644
index 0000000000..0f16e0caa1
--- /dev/null
+++ b/package/easyframes/easyframes.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 3c0449b3129c29b5ecf67b689f1a75ffc65fde3c5f62811e2f0439ce4f4af392 easyframes-0.3.tar.gz
+sha256 24f37598e822a1411fb7164ce7eb3ef120aea8279016399abc282c2381ce3f57 COPYING
diff --git a/package/easyframes/easyframes.mk b/package/easyframes/easyframes.mk
new file mode 100644
index 0000000000..2c209433d2
--- /dev/null
+++ b/package/easyframes/easyframes.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# easyframes
+#
+################################################################################
+
+EASYFRAMES_VERSION = 0.3
+EASYFRAMES_SITE = $(call github,microchip-ung,easyframes,v$(EASYFRAMES_VERSION))
+EASYFRAMES_DEPENDENCIES = libpcap
+EASYFRAMES_LICENSE = MIT
+EASYFRAMES_LICENSE_FILES = COPYING
+
+$(eval $(cmake-package))
