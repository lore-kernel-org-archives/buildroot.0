From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 16:23:22 +0100
Subject: [Buildroot] [git commit] package/python-terminaltables: new package
Message-ID: <20190317152442.B39968EC9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5583fd1b031d5c98583d5ffa831aada3e386018a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Generate simple tables in terminals from a nested list of strings.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                               |  1 +
 package/Config.in                                        |  1 +
 package/python-terminaltables/Config.in                  |  6 ++++++
 package/python-terminaltables/python-terminaltables.hash |  3 +++
 package/python-terminaltables/python-terminaltables.mk   | 13 +++++++++++++
 5 files changed, 24 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2da50e0299..359f04490c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1047,6 +1047,7 @@ F:	package/python-async-timeout/
 F:	package/python-cchardet/
 F:	package/python-multidict/
 F:	package/python-pycares/
+F:	package/python-terminaltables/
 F:	package/python-yarl/
 
 N:	James Knight <james.knight@rockwellcollins.com>
diff --git a/package/Config.in b/package/Config.in
index 6891004660..457018b18e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1051,6 +1051,7 @@ menu "External python modules"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tempora/Config.in"
+	source "package/python-terminaltables/Config.in"
 	source "package/python-texttable/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tomako/Config.in"
diff --git a/package/python-terminaltables/Config.in b/package/python-terminaltables/Config.in
new file mode 100644
index 0000000000..bb3c51c48f
--- /dev/null
+++ b/package/python-terminaltables/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TERMINALTABLES
+	bool "python-terminaltables"
+	help
+	  Generate simple tables in terminals from a nested list of strings.
+
+	  https://github.com/Robpol86/terminaltables
diff --git a/package/python-terminaltables/python-terminaltables.hash b/package/python-terminaltables/python-terminaltables.hash
new file mode 100644
index 0000000000..3184f5f716
--- /dev/null
+++ b/package/python-terminaltables/python-terminaltables.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/terminaltables/json
+md5	863797674d8f75d22e16e6c1fdcbeb41  terminaltables-3.1.0.tar.gz
+sha256	f3eb0eb92e3833972ac36796293ca0906e998dc3be91fbe1f8615b331b853b81  terminaltables-3.1.0.tar.gz
diff --git a/package/python-terminaltables/python-terminaltables.mk b/package/python-terminaltables/python-terminaltables.mk
new file mode 100644
index 0000000000..763f82e9a2
--- /dev/null
+++ b/package/python-terminaltables/python-terminaltables.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-terminaltables
+#
+################################################################################
+
+PYTHON_TERMINALTABLES_VERSION = 3.1.0
+PYTHON_TERMINALTABLES_SOURCE = terminaltables-$(PYTHON_TERMINALTABLES_VERSION).tar.gz
+PYTHON_TERMINALTABLES_SITE = https://files.pythonhosted.org/packages/9b/c4/4a21174f32f8a7e1104798c445dacdc1d4df86f2f26722767034e4de4bff
+PYTHON_TERMINALTABLES_SETUP_TYPE = setuptools
+PYTHON_TERMINALTABLES_LICENSE = MIT
+
+$(eval $(python-package))
