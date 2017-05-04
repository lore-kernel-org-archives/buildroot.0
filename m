From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:09:27 +0200
Subject: [Buildroot] [git commit] package/python-simplegeneric: New package
Message-ID: <20170504200950.023CD81E3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c5688cfc690d79a9854ce9b0f5c2b9d62ecffed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 'simplegeneric'[1] package to Buildroot. Needed by IPython.

[1] https://pypi.python.org/pypi/simplegeneric

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
[Thomas: add entry in DEVELOPERS file, fix license.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                            |  1 +
 package/Config.in                                     |  1 +
 package/python-simplegeneric/Config.in                |  6 ++++++
 .../python-simplegeneric/python-simplegeneric.hash    |  3 +++
 package/python-simplegeneric/python-simplegeneric.mk  | 19 +++++++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a3da397..d28e6fb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -73,6 +73,7 @@ F:	package/wine/
 
 N:	Andrey Smirnov <andrew.smirnov at gmail.com
 F:	package/python-decorator/
+F:	package/python-simplegeneric/
 
 N:	Andrew Ruder <andrew.ruder@elecsyscorp.com>
 F:	package/expect/
diff --git a/package/Config.in b/package/Config.in
index e38a934..47ad2c2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -826,6 +826,7 @@ menu "External python modules"
 	source "package/python-sh/Config.in"
 	source "package/python-shutilwhich/Config.in"
 	source "package/python-simpleaudio/Config.in"
+	source "package/python-simplegeneric/Config.in"
 	source "package/python-simplejson/Config.in"
 	source "package/python-singledispatch/Config.in"
 	source "package/python-sip/Config.in"
diff --git a/package/python-simplegeneric/Config.in b/package/python-simplegeneric/Config.in
new file mode 100644
index 0000000..b5ebfec
--- /dev/null
+++ b/package/python-simplegeneric/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SIMPLEGENERIC
+	bool "python-simplegeneric"
+	help
+	  A configuration system for Python applications.
+
+	  https://pypi.python.org/pypi/simplegeneric
diff --git a/package/python-simplegeneric/python-simplegeneric.hash b/package/python-simplegeneric/python-simplegeneric.hash
new file mode 100644
index 0000000..24f652c
--- /dev/null
+++ b/package/python-simplegeneric/python-simplegeneric.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/simplegeneric, sha256 locally computed
+md5 f9c1fab00fd981be588fc32759f474e3 simplegeneric-0.8.1.zip
+sha256 dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173 simplegeneric-0.8.1.zip
diff --git a/package/python-simplegeneric/python-simplegeneric.mk b/package/python-simplegeneric/python-simplegeneric.mk
new file mode 100644
index 0000000..556a478
--- /dev/null
+++ b/package/python-simplegeneric/python-simplegeneric.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-simplegeneric
+#
+################################################################################
+
+PYTHON_SIMPLEGENERIC_VERSION = 0.8.1
+PYTHON_SIMPLEGENERIC_SOURCE = simplegeneric-$(PYTHON_SIMPLEGENERIC_VERSION).zip
+PYTHON_SIMPLEGENERIC_SITE = https://pypi.python.org/packages/3d/57/4d9c9e3ae9a255cd4e1106bb57e24056d3d0709fc01b2e3e345898e49d5b
+PYTHON_SIMPLEGENERIC_LICENSE = ZPL-2.1
+PYTHON_SIMPLEGENERIC_SETUP_TYPE = distutils
+
+define PYTHON_SIMPLEGENERIC_EXTRACT_CMDS
+	unzip $(DL_DIR)/$(PYTHON_SIMPLEGENERIC_SOURCE) -d $(@D)
+	mv $(@D)/simplegeneric-$(PYTHON_SIMPLEGENERIC_VERSION)/* $(@D)
+	rmdir $(@D)/simplegeneric-$(PYTHON_SIMPLEGENERIC_VERSION)
+endef
+
+$(eval $(python-package))
