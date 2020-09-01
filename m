From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue,  1 Sep 2020 19:16:42 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/python-pluggy: new package
In-Reply-To: <20200901171645.708587-1-m.niestroj@grinn-global.com>
References: <20200901171645.708587-1-m.niestroj@grinn-global.com>
Message-ID: <20200901171645.708587-2-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
changes v1 -> v2:
 * add dependency on python3
 * remove (broken) dependency on importlib-metadata, which is not needed with
   Python 3.8+ (reported by Thomas)

 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-pluggy/Config.in          |  7 +++++++
 package/python-pluggy/python-pluggy.hash |  5 +++++
 package/python-pluggy/python-pluggy.mk   | 15 +++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-pluggy/Config.in
 create mode 100644 package/python-pluggy/python-pluggy.hash
 create mode 100644 package/python-pluggy/python-pluggy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e550e5eb0e..1bafd26350 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1612,6 +1612,7 @@ F:	package/murata-cyw-fw/
 F:	package/netdata/
 F:	package/python-ansicolors/
 F:	package/python-packaging/
+F:	package/python-pluggy/
 F:	package/rs485conf/
 F:	package/turbolua/
 F:	support/testing/tests/package/test_netdata.py
diff --git a/package/Config.in b/package/Config.in
index b1df81d7f1..914f2b4d33 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1062,6 +1062,7 @@ menu "External python modules"
 	source "package/python-pigpio/Config.in"
 	source "package/python-pillow/Config.in"
 	source "package/python-pip/Config.in"
+	source "package/python-pluggy/Config.in"
 	source "package/python-ply/Config.in"
 	source "package/python-portend/Config.in"
 	source "package/python-posix-ipc/Config.in"
diff --git a/package/python-pluggy/Config.in b/package/python-pluggy/Config.in
new file mode 100644
index 0000000000..7179bc427c
--- /dev/null
+++ b/package/python-pluggy/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PLUGGY
+	bool "python-pluggy"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  plugin and hook calling mechanisms for python.
+
+	  https://github.com/pytest-dev/pluggy
diff --git a/package/python-pluggy/python-pluggy.hash b/package/python-pluggy/python-pluggy.hash
new file mode 100644
index 0000000000..24e207bfad
--- /dev/null
+++ b/package/python-pluggy/python-pluggy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pluggy/json
+md5  7f610e28b8b34487336b585a3dfb803d  pluggy-0.13.1.tar.gz
+sha256  15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0  pluggy-0.13.1.tar.gz
+# Locally computed sha256 checksums
+sha256  d6b65e6c213a5d0b577911d34d6e5949b9f59d76c238c5071a2f3fc16cfb2606  LICENSE
diff --git a/package/python-pluggy/python-pluggy.mk b/package/python-pluggy/python-pluggy.mk
new file mode 100644
index 0000000000..03cdecf4b9
--- /dev/null
+++ b/package/python-pluggy/python-pluggy.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pluggy
+#
+################################################################################
+
+PYTHON_PLUGGY_VERSION = 0.13.1
+PYTHON_PLUGGY_SOURCE = pluggy-$(PYTHON_PLUGGY_VERSION).tar.gz
+PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/f8/04/7a8542bed4b16a65c2714bf76cf5a0b026157da7f75e87cc88774aa10b14
+PYTHON_PLUGGY_SETUP_TYPE = setuptools
+PYTHON_PLUGGY_LICENSE = MIT
+PYTHON_PLUGGY_LICENSE_FILES = LICENSE
+PYTHON_PLUGGY_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.28.0
