From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 13 Sep 2017 15:20:55 +0200
Subject: [Buildroot] [PATCH v2] python-six: add host variant
Message-ID: <20170913132055.12371-1-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While currently there is no in-tree Buildroot package which depends on
host-python-six, it can be needed to build external packages.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/Config.in.host            | 1 +
 package/python-six/Config.in.host | 9 +++++++++
 package/python-six/python-six.mk  | 1 +
 3 files changed, 11 insertions(+)
 create mode 100644 package/python-six/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index c5a852b858a4..e2717ae3b541 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -36,6 +36,7 @@ menu "Host utilities"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/python-lxml/Config.in.host"
+	source "package/python-six/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
diff --git a/package/python-six/Config.in.host b/package/python-six/Config.in.host
new file mode 100644
index 000000000000..1d37e768ae29
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
index 0edefe346fdb..850f9340d322 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -12,3 +12,4 @@ PYTHON_SIX_LICENSE = MIT
 PYTHON_SIX_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.13.1
