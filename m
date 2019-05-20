From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 May 2019 11:29:33 +0200
Subject: [Buildroot] [git commit branch/next] package/python-cycler: new
 package
Message-ID: <20190520094924.938EB887ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e96c1b244e4283f5c8596728423c4d3b8a6487cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Creates a Cycler object much like cycler, but
includes input validation.

This package is required by matplotlib.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                               |  3 +++
 package/Config.in                        |  1 +
 package/python-cycler/Config.in          |  8 ++++++++
 package/python-cycler/python-cycler.hash |  4 ++++
 package/python-cycler/python-cycler.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 59b47e38fe..0962ef2c8d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1227,6 +1227,9 @@ F:	package/python-xlib/
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
 
+N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+F:	package/python-cycler/
+
 N:	Juha Rantanen <juha@codercoded.com>
 F:	package/acsccid/
 
diff --git a/package/Config.in b/package/Config.in
index e5b26dd33f..28e52a5eba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -860,6 +860,7 @@ menu "External python modules"
 	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
 	source "package/python-cssutils/Config.in"
+	source "package/python-cycler/Config.in"
 	source "package/python-daemon/Config.in"
 	source "package/python-daemonize/Config.in"
 	source "package/python-dataproperty/Config.in"
diff --git a/package/python-cycler/Config.in b/package/python-cycler/Config.in
new file mode 100644
index 0000000000..854873c969
--- /dev/null
+++ b/package/python-cycler/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_CYCLER
+	bool "python-cycler"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	help
+	  Creates a Cycler objects much like cycler, but
+	  includes input validation.
+
+	  https://matplotlib.org/cycler/
diff --git a/package/python-cycler/python-cycler.hash b/package/python-cycler/python-cycler.hash
new file mode 100644
index 0000000000..8255458b26
--- /dev/null
+++ b/package/python-cycler/python-cycler.hash
@@ -0,0 +1,4 @@
+# sha256 from https://pypi.org/project/cyclic/#files
+sha256	cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8  cycler-0.10.0.tar.gz
+# Locally computed sha256 checksums
+sha256	f1218143d766da3fea66f13396b7f15df46a83303f29bf96ba6e98eb4d42f408  LICENSE
diff --git a/package/python-cycler/python-cycler.mk b/package/python-cycler/python-cycler.mk
new file mode 100644
index 0000000000..4f1f40191f
--- /dev/null
+++ b/package/python-cycler/python-cycler.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cycler
+#
+################################################################################
+
+PYTHON_CYCLER_VERSION = 0.10.0
+PYTHON_CYCLER_SOURCE = cycler-$(PYTHON_CYCLER_VERSION).tar.gz
+PYTHON_CYCLER_SITE = https://files.pythonhosted.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488
+PYTHON_CYCLER_LICENSE = BSD
+PYTHON_CYCLER_LICENSE_FILES = LICENSE
+PYTHON_CYCLER_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
