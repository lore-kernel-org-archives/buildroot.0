From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Thu,  9 May 2019 17:58:49 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-cycler: new package
In-Reply-To: <1557417530-25084-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1557417530-25084-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1557417530-25084-2-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Creates a Cycler object much like cycler, but
includes input validation.

This package is required by matplotlib.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 DEVELOPERS                               |  3 +++
 package/Config.in                        |  1 +
 package/python-cycler/Config.in          |  8 ++++++++
 package/python-cycler/python-cycler.hash |  4 ++++
 package/python-cycler/python-cycler.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-cycler/Config.in
 create mode 100644 package/python-cycler/python-cycler.hash
 create mode 100644 package/python-cycler/python-cycler.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5bfc456..4bb18fb 100644
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
index f592e74..80622b5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -859,6 +859,7 @@ menu "External python modules"
 	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
 	source "package/python-cssutils/Config.in"
+	source "package/python-cycler/Config.in"
 	source "package/python-daemon/Config.in"
 	source "package/python-daemonize/Config.in"
 	source "package/python-dataproperty/Config.in"
diff --git a/package/python-cycler/Config.in b/package/python-cycler/Config.in
new file mode 100644
index 0000000..854873c
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
index 0000000..8255458
--- /dev/null
+++ b/package/python-cycler/python-cycler.hash
@@ -0,0 +1,4 @@
+# sha256 from https://pypi.org/project/cyclic/#files
+sha256	cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8  cycler-0.10.0.tar.gz
+# Locally computed sha256 checksums
+sha256	f1218143d766da3fea66f13396b7f15df46a83303f29bf96ba6e98eb4d42f408  LICENSE
diff --git a/package/python-cycler/python-cycler.mk b/package/python-cycler/python-cycler.mk
new file mode 100644
index 0000000..4f1f401
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
-- 
2.7.4
