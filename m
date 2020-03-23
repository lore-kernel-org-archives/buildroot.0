From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Mon, 23 Mar 2020 10:45:39 -0500
Subject: [Buildroot] [PATCH v2 1/1] package/python-filelock: new package
Message-ID: <20200323154539.39731-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package contains a single module, which implements
a platform independent file lock in Python, which provides
a simple way of inter-process communication.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
--
v2: updated commit message to fit new package standard
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-filelock/Config.in            |  6 ++++++
 package/python-filelock/python-filelock.hash |  5 +++++
 package/python-filelock/python-filelock.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-filelock/Config.in
 create mode 100644 package/python-filelock/python-filelock.hash
 create mode 100644 package/python-filelock/python-filelock.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8ea08739f7..0cd2502e5d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1230,6 +1230,7 @@ F:	package/zynq-boot-bin/
 
 N:	Jared Bents <jared.bents@rockwellcollins.com>
 F:	package/davici/
+F:	package/python-filelock/
 
 N:	Jarkko Sakkinen <jarkko.sakkinen@intel.com>
 F:	package/quota/
diff --git a/package/Config.in b/package/Config.in
index 2b903140df..48abe77f03 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -946,6 +946,7 @@ menu "External python modules"
 	source "package/python-enum34/Config.in"
 	source "package/python-esptool/Config.in"
 	source "package/python-falcon/Config.in"
+	source "package/python-filelock/Config.in"
 	source "package/python-fire/Config.in"
 	source "package/python-flask/Config.in"
 	source "package/python-flask-babel/Config.in"
diff --git a/package/python-filelock/Config.in b/package/python-filelock/Config.in
new file mode 100644
index 0000000000..57ec039400
--- /dev/null
+++ b/package/python-filelock/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_FILELOCK
+	bool "python-filelock"
+	help
+	  A platform independent file lock.
+
+	  https://github.com/benediktschmitt/py-filelock
diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
new file mode 100644
index 0000000000..d50d2d561c
--- /dev/null
+++ b/package/python-filelock/python-filelock.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/filelock/json
+md5  c1fe6d9a7433a7ca6ce4f36e273317d1  filelock-3.0.12.tar.gz
+sha256  18d82244ee114f543149c66a6e0c14e9c4f8a1044b5cdaadd0f82159d6a6ff59  filelock-3.0.12.tar.gz
+# Locally computed sha256 checksums
+sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
new file mode 100644
index 0000000000..35b3374d29
--- /dev/null
+++ b/package/python-filelock/python-filelock.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-filelock
+#
+################################################################################
+
+PYTHON_FILELOCK_VERSION = 3.0.12
+PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/14/ec/6ee2168387ce0154632f856d5cc5592328e9cf93127c5c9aeca92c8c16cb
+PYTHON_FILELOCK_SETUP_TYPE = setuptools
+PYTHON_FILELOCK_LICENSE = Public Domain
+PYTHON_FILELOCK_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.1
