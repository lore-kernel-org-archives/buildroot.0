From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 09:50:07 +0200
Subject: [Buildroot] [git commit] acpitool: new package
Message-ID: <20160703082050.34FB181D8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ad939961e8f38b82f5a51db2abd8547af176635
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

acpitool is a small, convenient command-line ACPI client.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Tested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in              |  1 +
 package/acpitool/Config.in     | 11 +++++++++++
 package/acpitool/acpitool.hash |  2 ++
 package/acpitool/acpitool.mk   | 13 +++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 550beb3..c57c932 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -352,6 +352,7 @@ menu "Firmware"
 endmenu
 	source "package/a10disp/Config.in"
 	source "package/acpid/Config.in"
+	source "package/acpitool/Config.in"
 	source "package/aer-inject/Config.in"
 	source "package/am335x-pru-package/Config.in"
 	source "package/avrdude/Config.in"
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
