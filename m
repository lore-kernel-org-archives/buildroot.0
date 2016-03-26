From: Erico Nunes <nunes.erico@gmail.com>
Date: Sat, 26 Mar 2016 15:26:16 -0300
Subject: [Buildroot] [PATCH 1/2] acpitool: new package
Message-ID: <1459016777-27952-1-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

acpitool is a small, convenient command-line ACPI client.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/Config.in              |  1 +
 package/acpitool/Config.in     | 11 +++++++++++
 package/acpitool/acpitool.hash |  2 ++
 package/acpitool/acpitool.mk   | 13 +++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/acpitool/Config.in
 create mode 100644 package/acpitool/acpitool.hash
 create mode 100644 package/acpitool/acpitool.mk

diff --git a/package/Config.in b/package/Config.in
index 1467f33..cca553c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -340,6 +340,7 @@ menu "Firmware"
 endmenu
 	source "package/a10disp/Config.in"
 	source "package/acpid/Config.in"
+	source "package/acpitool/Config.in"
 	source "package/am335x-pru-package/Config.in"
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
diff --git a/package/acpitool/Config.in b/package/acpitool/Config.in
new file mode 100644
index 0000000..7992e0f
--- /dev/null
+++ b/package/acpitool/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ACPITOOL
+	bool "acpitool"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  A small, convenient command-line ACPI client with a lot of
+	  features for Linux
+
+	  http://acpitool.sourceforge.net
+
+comment "acpitool needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/acpitool/acpitool.hash b/package/acpitool/acpitool.hash
new file mode 100644
index 0000000..e25dc54
--- /dev/null
+++ b/package/acpitool/acpitool.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 004fb6cd43102918b6302cf537a2db7ceadda04aef2e0906ddf230f820dad34f acpitool-0.5.1.tar.bz2
diff --git a/package/acpitool/acpitool.mk b/package/acpitool/acpitool.mk
new file mode 100644
index 0000000..f663fbb
--- /dev/null
+++ b/package/acpitool/acpitool.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# acpitool
+#
+################################################################################
+
+ACPITOOL_VERSION = 0.5.1
+ACPITOOL_SOURCE = acpitool-$(ACPITOOL_VERSION).tar.bz2
+ACPITOOL_SITE = http://downloads.sourceforge.net/sourceforge/acpitool
+ACPITOOL_LICENSE = GPLv2+
+ACPITOOL_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.7.4
