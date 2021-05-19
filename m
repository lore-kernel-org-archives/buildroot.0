From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 16:41:09 +0200
Subject: [Buildroot] [git commit branch/next] package/python-dbus-next: new
 package
Message-ID: <20210519143342.5C3E88462D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b27332636887bb99a2121c28551a36b46ee1cabe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-dbus-next/Config.in             |  9 +++++++++
 package/python-dbus-next/python-dbus-next.hash |  5 +++++
 package/python-dbus-next/python-dbus-next.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a12d9d98b5..2a75d430af 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1649,6 +1649,7 @@ F:	package/murata-cyw-fw/
 F:	package/netdata/
 F:	package/python-ansicolors/
 F:	package/python-bleak/
+F:	package/python-dbus-next/
 F:	package/python-iniconfig/
 F:	package/python-intelhex/
 F:	package/python-packaging/
diff --git a/package/Config.in b/package/Config.in
index 6e10988e51..761d687e03 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -962,6 +962,7 @@ menu "External python modules"
 	source "package/python-daphne/Config.in"
 	source "package/python-dataproperty/Config.in"
 	source "package/python-dateutil/Config.in"
+	source "package/python-dbus-next/Config.in"
 	source "package/python-decorator/Config.in"
 	source "package/python-defusedxml/Config.in"
 	source "package/python-dialog/Config.in"
diff --git a/package/python-dbus-next/Config.in b/package/python-dbus-next/Config.in
new file mode 100644
index 0000000000..bafead8986
--- /dev/null
+++ b/package/python-dbus-next/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_DBUS_NEXT
+	bool "python-dbus-next"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
+	help
+	  A zero-dependency DBus library for Python with asyncio
+	  support.
+
+	  https://github.com/altdesktop/python-dbus-next
diff --git a/package/python-dbus-next/python-dbus-next.hash b/package/python-dbus-next/python-dbus-next.hash
new file mode 100644
index 0000000000..fa1cbc9da7
--- /dev/null
+++ b/package/python-dbus-next/python-dbus-next.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/dbus-next/json
+md5  fcf7443b379ef69f95727bec0221ebc9  dbus_next-0.2.2.tar.gz
+sha256  f656a3d3450b670f228248ffb1c3a703a69c4a8cb10cce63b108f17c8bd6c3de  dbus_next-0.2.2.tar.gz
+# Locally computed sha256 checksums
+sha256  c454ab6b8e0653a8eab828a8cbaaa368a1bbfba982178bb18b6177e311eae4cc  LICENSE
diff --git a/package/python-dbus-next/python-dbus-next.mk b/package/python-dbus-next/python-dbus-next.mk
new file mode 100644
index 0000000000..9aab9ac92b
--- /dev/null
+++ b/package/python-dbus-next/python-dbus-next.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-dbus-next
+#
+################################################################################
+
+PYTHON_DBUS_NEXT_VERSION = 0.2.2
+PYTHON_DBUS_NEXT_SOURCE = dbus_next-$(PYTHON_DBUS_NEXT_VERSION).tar.gz
+PYTHON_DBUS_NEXT_SITE = https://files.pythonhosted.org/packages/cb/fb/5ab0485c6460e39be75e16af95c0e23c2531c1ac5a482fffb9ee7d576e6f
+PYTHON_DBUS_NEXT_SETUP_TYPE = setuptools
+PYTHON_DBUS_NEXT_LICENSE = MIT
+PYTHON_DBUS_NEXT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
