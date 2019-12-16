From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 23:28:08 +0100
Subject: [Buildroot] [git commit] package/python-smmap2: new package
Message-ID: <20191216221921.08D0D8B83A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30968cfd83ae44ba1ca4d7094d47c4b91d3ffcdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Smmap wraps an interface around mmap and tracks the mapped files as
well as the amount of clients who use it. If the system runs out of
resources, or if a memory limit is reached, it will automatically
unload unused maps to allow continued operation.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-smmap2/Config.in          | 10 ++++++++++
 package/python-smmap2/python-smmap2.hash |  5 +++++
 package/python-smmap2/python-smmap2.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5b7b3c80fc..30fcf69970 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -65,6 +65,7 @@ F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
 F:	package/python-pip/
 F:	package/python-psycopg2/
+F:	package/python-smmap2/
 F:	package/python-sqlalchemy/
 F:	package/python-sqlparse/
 F:	package/python-visitor/
diff --git a/package/Config.in b/package/Config.in
index 5a4be6ee2c..c7f8389809 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1110,6 +1110,7 @@ menu "External python modules"
 	source "package/python-six/Config.in"
 	source "package/python-slob/Config.in"
 	source "package/python-smbus-cffi/Config.in"
+	source "package/python-smmap2/Config.in"
 	source "package/python-socketio/Config.in"
 	source "package/python-sockjs/Config.in"
 	source "package/python-sortedcontainers/Config.in"
diff --git a/package/python-smmap2/Config.in b/package/python-smmap2/Config.in
new file mode 100644
index 0000000000..21a3bdb613
--- /dev/null
+++ b/package/python-smmap2/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_SMMAP2
+	bool "python-smmap2"
+	help
+	  Smmap wraps an interface around mmap and tracks the mapped
+	  files as well as the amount of clients who use it. If the
+	  system runs out of resources, or if a memory limit is reached,
+	  it will automatically unload unused maps to allow continued
+	  operation.
+
+	  https://github.com/gitpython-developers/smmap
diff --git a/package/python-smmap2/python-smmap2.hash b/package/python-smmap2/python-smmap2.hash
new file mode 100644
index 0000000000..8a7ea42a5d
--- /dev/null
+++ b/package/python-smmap2/python-smmap2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/smmap2/json
+md5	1c59a985be5aa645c4c5a4e063a40dd5  smmap2-2.0.5.tar.gz
+sha256	29a9ffa0497e7f2be94ca0ed1ca1aa3cd4cf25a1f6b4f5f87f74b46ed91d609a  smmap2-2.0.5.tar.gz
+# Locally computed sha256 checksums
+sha256	88e9d93f708d110b328a834302dd1d5c6afbda530e7721d15d80b3511d86f235  LICENSE
diff --git a/package/python-smmap2/python-smmap2.mk b/package/python-smmap2/python-smmap2.mk
new file mode 100644
index 0000000000..daf379fe1a
--- /dev/null
+++ b/package/python-smmap2/python-smmap2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-smmap2
+#
+################################################################################
+
+PYTHON_SMMAP2_VERSION = 2.0.5
+PYTHON_SMMAP2_SOURCE = smmap2-$(PYTHON_SMMAP2_VERSION).tar.gz
+PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/3b/ba/e49102b3e8ffff644edded25394b2d22ebe3e645f3f6a8139129c4842ffe
+PYTHON_SMMAP2_SETUP_TYPE = setuptools
+PYTHON_SMMAP2_LICENSE = BSD-3-Clause
+PYTHON_SMMAP2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
