From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 13:46:20 +0200
Subject: [Buildroot] [git commit] python-six: add host variant
Message-ID: <20170924114002.84EC57FC94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b135e9595bcd0918dcb68e9f8d380042ca6a8c5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While currently there is no in-tree Buildroot package which depends on
host-python-six, it can be needed to build external packages.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Tested-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in.host            | 1 +
 package/python-six/Config.in.host | 9 +++++++++
 package/python-six/python-six.mk  | 1 +
 3 files changed, 11 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 9e05ec6..679fe22 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -38,6 +38,7 @@ menu "Host utilities"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/python-lxml/Config.in.host"
+	source "package/python-six/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
diff --git a/package/python-six/Config.in.host b/package/python-six/Config.in.host
new file mode 100644
index 0000000..1d37e76
--- /dev/null
+++ b/package/python-six/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_PYTHON_SIX
+	bool "host python-six"
+	help
+	  Six is a Python 2 and 3 compatibility library. It provides
+	  utility functions for smoothing over the differences between
+	  the Python versions with the goal of writing Python code that
+	  is compatible on both Python versions.
+
+	  http://pythonhosted.org/six
diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index 0edefe3..850f934 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -12,3 +12,4 @@ PYTHON_SIX_LICENSE = MIT
 PYTHON_SIX_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
