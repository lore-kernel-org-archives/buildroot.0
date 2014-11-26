From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:18:41 +0100
Subject: [Buildroot] [git commit branch/next] package: add
	python-networkmanager
Message-ID: <20141126212022.7069A7FEF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c9f95305fcc3ddc11d3b1704eab874fdb37183b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/python-networkmanager/Config.in            |   15 +++++++++++++++
 .../python-networkmanager.hash                     |    3 +++
 .../python-networkmanager/python-networkmanager.mk |   14 ++++++++++++++
 4 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f3b189b..bb5b144 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -508,6 +508,7 @@ menu "external python modules"
 	source "package/python-meld3/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-netifaces/Config.in"
+	source "package/python-networkmanager/Config.in"
 	source "package/python-nfc/Config.in"
 	source "package/python-numpy/Config.in"
 	source "package/python-posix-ipc/Config.in"
diff --git a/package/python-networkmanager/Config.in b/package/python-networkmanager/Config.in
new file mode 100644
index 0000000..fcbce57
--- /dev/null
+++ b/package/python-networkmanager/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_NETWORKMANAGER
+	bool "python-networkmanager"
+	depends on BR2_PACKAGE_NETWORK_MANAGER # runtime
+	depends on BR2_USE_WCHAR # dbus-python
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python
+	depends on BR2_PACKAGE_DBUS # dbus-python
+	select BR2_PACKAGE_DBUS_PYTHON
+	help
+	  python-networkmanager wraps NetworkManagers D-Bus interface
+	  so you can be less verbose when talking to NetworkManager
+	  from python. All interfaces have been wrapped in classes,
+	  properties are exposed as python properties and function
+	  calls are forwarded to the correct interface.
+
+	  https://pypi.python.org/pypi/python-networkmanager/
diff --git a/package/python-networkmanager/python-networkmanager.hash b/package/python-networkmanager/python-networkmanager.hash
new file mode 100644
index 0000000..6c6f697
--- /dev/null
+++ b/package/python-networkmanager/python-networkmanager.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=2cd400a7ca4dcd1ea98c864007032494, sha256 locally computed
+md5	2cd400a7ca4dcd1ea98c864007032494  python-networkmanager-0.9.12.tar.gz
+sha256	a4c7bbae8a1ee3cf370ff0cd2ba2e0f1fb7f8e8f99f8f48a1df624c19a11166f  python-networkmanager-0.9.12.tar.gz
diff --git a/package/python-networkmanager/python-networkmanager.mk b/package/python-networkmanager/python-networkmanager.mk
new file mode 100644
index 0000000..c043edb
--- /dev/null
+++ b/package/python-networkmanager/python-networkmanager.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-networkmanager
+#
+################################################################################
+
+PYTHON_NETWORKMANAGER_VERSION = 0.9.12
+PYTHON_NETWORKMANAGER_SITE = http://pypi.python.org/packages/source/p/python-networkmanager
+PYTHON_NETWORKMANAGER_SETUP_TYPE = distutils
+PYTHON_NETWORKMANAGER_LICENSE = GPLv3+
+PYTHON_NETWORKMANAGER_LICENSE_FILES = COPYING
+PYTHON_NETWORKMANAGER_DEPENDENCIES = dbus-python
+
+$(eval $(python-package))
