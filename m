From: Julien Olivain <juju@cotds.org>
Date: Sat,  4 Jan 2020 16:59:02 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/python-pyalsa: new package
In-Reply-To: <20191231174019.19617-1-juju@cotds.org>
References: <20191231174019.19617-1-juju@cotds.org>
Message-ID: <20200104155902.10810-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Official ALSA Python binding, including hardware
management, mixer and sequencer control.

http://www.alsa-project.org/

Signed-off-by: Julien Olivain <juju@cotds.org>

---
Changes v1 -> v2:
  - Fix a typo in DEVELOPERS file

---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-pyalsa/Config.in          |  7 +++++++
 package/python-pyalsa/python-pyalsa.hash |  2 ++
 package/python-pyalsa/python-pyalsa.mk   | 13 +++++++++++++
 5 files changed, 24 insertions(+)
 create mode 100644 package/python-pyalsa/Config.in
 create mode 100644 package/python-pyalsa/python-pyalsa.hash
 create mode 100644 package/python-pyalsa/python-pyalsa.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 63e6981570..18f518d6f4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1377,6 +1377,7 @@ F:	configs/imx8mmpico_defconfig
 F:	configs/imx8mpico_defconfig
 F:	package/fluid-soundfont/
 F:	package/fluidsynth/
+F:	package/python-pyalsa/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
diff --git a/package/Config.in b/package/Config.in
index 894284c650..eb278838aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1036,6 +1036,7 @@ menu "External python modules"
 	source "package/python-pudb/Config.in"
 	source "package/python-py/Config.in"
 	source "package/python-pyaes/Config.in"
+	source "package/python-pyalsa/Config.in"
 	source "package/python-pyasn/Config.in"
 	source "package/python-pyasn-modules/Config.in"
 	source "package/python-pyasn1/Config.in"
diff --git a/package/python-pyalsa/Config.in b/package/python-pyalsa/Config.in
new file mode 100644
index 0000000000..f379096058
--- /dev/null
+++ b/package/python-pyalsa/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYALSA
+	bool "python-pyalsa"
+	help
+	  Official ALSA Python binding, including hardware
+	  management, mixer and sequencer control.
+
+	  http://www.alsa-project.org/
diff --git a/package/python-pyalsa/python-pyalsa.hash b/package/python-pyalsa/python-pyalsa.hash
new file mode 100644
index 0000000000..c484313b96
--- /dev/null
+++ b/package/python-pyalsa/python-pyalsa.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 2771291a5d2cf700f0abbe6629ea37468d1463a01b2330d84ef976e1e918676c  pyalsa-1.1.6.tar.bz2
diff --git a/package/python-pyalsa/python-pyalsa.mk b/package/python-pyalsa/python-pyalsa.mk
new file mode 100644
index 0000000000..af20b5602a
--- /dev/null
+++ b/package/python-pyalsa/python-pyalsa.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-pyalsa
+#
+################################################################################
+
+PYTHON_PYALSA_VERSION = 1.1.6
+PYTHON_PYALSA_SOURCE = pyalsa-$(PYTHON_PYALSA_VERSION).tar.bz2
+PYTHON_PYALSA_SITE = ftp://ftp.alsa-project.org/pub/pyalsa
+PYTHON_PYALSA_SETUP_TYPE = distutils
+PYTHON_PYALSA_LICENSE = LGPL-2.1+
+
+$(eval $(python-package))
-- 
2.24.1
