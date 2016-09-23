From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 08:32:51 +0200
Subject: [Buildroot] [git commit] python-simpleaudio: new package
Message-ID: <20160923063327.51F1B822CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d56825c6f3aea128104f813b05d8567f89112fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 package/python-simpleaudio/Config.in               | 13 +++++++++++++
 package/python-simpleaudio/python-simpleaudio.hash |  3 +++
 package/python-simpleaudio/python-simpleaudio.mk   | 15 +++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 9ca6c15..fe3ac2c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -769,6 +769,7 @@ menu "External python modules"
 	source "package/python-setproctitle/Config.in"
 	source "package/python-setuptools/Config.in"
 	source "package/python-shutilwhich/Config.in"
+	source "package/python-simpleaudio/Config.in"
 	source "package/python-simplejson/Config.in"
 	source "package/python-singledispatch/Config.in"
 	source "package/python-sip/Config.in"
diff --git a/package/python-simpleaudio/Config.in b/package/python-simpleaudio/Config.in
new file mode 100644
index 0000000..a3e07f9
--- /dev/null
+++ b/package/python-simpleaudio/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_SIMPLEAUDIO
+	bool "python-simpleaudio"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	select BR2_PACKAGE_ALSA_LIB
+	help
+	  The simplaudio package provides cross-platform, dependency-free
+	  audio playback capability for Python 3 on OSX, Windows, and Linux.
+
+	  https://github.com/hamiltron/py-simple-audio
+
+comment "python-simpleaudio needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-simpleaudio/python-simpleaudio.hash b/package/python-simpleaudio/python-simpleaudio.hash
new file mode 100644
index 0000000..7e3a7fb
--- /dev/null
+++ b/package/python-simpleaudio/python-simpleaudio.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/simpleaudio/json, sha256 locally computed
+md5     8c1c82fdf7ebba1a79b1243651e451d7 simpleaudio-1.0.1.tar.gz
+sha256  6cc84d50d8192c074505c719722138ae6ea987fd8eee7fd930237cb308962604  simpleaudio-1.0.1.tar.gz
diff --git a/package/python-simpleaudio/python-simpleaudio.mk b/package/python-simpleaudio/python-simpleaudio.mk
new file mode 100644
index 0000000..b9562ee
--- /dev/null
+++ b/package/python-simpleaudio/python-simpleaudio.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# python-simpleaudio
+#
+#############################################################
+
+PYTHON_SIMPLEAUDIO_VERSION = 1.0.1
+PYTHON_SIMPLEAUDIO_SOURCE = simpleaudio-$(PYTHON_SIMPLEAUDIO_VERSION).tar.gz
+PYTHON_SIMPLEAUDIO_SITE = https://pypi.python.org/packages/12/f6/327c1af94062a6a6a5ff06dcf9dc689ed81aa07ae757cca3438c3c9e50fe
+PYTHON_SIMPLEAUDIO_LICENSE = MIT
+PYTHON_SIMPLEAUDIO_LICENSE_FILES = LICENSE.txt
+PYTHON_SIMPLEAUDIO_SETUP_TYPE = setuptools
+PYTHON_SIMPLEAUDIO_DEPENDENCIES = alsa-lib
+
+$(eval $(python-package))
