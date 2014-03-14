From: rc.lsw.collaborate at gmail.com <rc.lsw.collaborate@gmail.com>
Date: Fri, 14 Mar 2014 17:58:19 -0500
Subject: [Buildroot] [PATCH v2] pyrex: new host package
In-Reply-To: <1394837899-14937-1-git-send-email-rc.lsw.collaborate@gmail.com>
References: <1394837899-14937-1-git-send-email-rc.lsw.collaborate@gmail.com>
Message-ID: <1394837899-14937-2-git-send-email-rc.lsw.collaborate@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <mlweber1@rockwellcollins.com>

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
Changes v1 -> v2:
   - Converted to a host only pkg as this pkg provides generated
     C code that an application would use from a sysroot
     (not on target).  (Suggested by Thomas)
---
 package/Config.in                    |    1 +
 package/python-pyrex/Config.in.host  |    7 +++++++
 package/python-pyrex/python-pyrex.mk |   15 +++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/python-pyrex/Config.in.host
 create mode 100644 package/python-pyrex/python-pyrex.mk

diff --git a/package/Config.in b/package/Config.in
index 70e5a7f..cec0fea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -454,6 +454,7 @@ source "package/python-pyasn/Config.in"
 source "package/python-pycrypto/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
+source "package/python-pyrex/Config.in.host"
 source "package/python-pyro/Config.in"
 source "package/python-pysnmp/Config.in"
 source "package/python-pysnmp-apps/Config.in"
diff --git a/package/python-pyrex/Config.in.host b/package/python-pyrex/Config.in.host
new file mode 100644
index 0000000..ff83daf
--- /dev/null
+++ b/package/python-pyrex/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PYTHON_PYREX
+	bool "python-pyrex (host tool)"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Pyrex is a language for writing Python extension modules
+
+	  http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/
diff --git a/package/python-pyrex/python-pyrex.mk b/package/python-pyrex/python-pyrex.mk
new file mode 100644
index 0000000..73cb163
--- /dev/null
+++ b/package/python-pyrex/python-pyrex.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pyrex
+#
+################################################################################
+
+PYTHON_PYREX_VERSION = 0.9.9
+PYTHON_PYREX_SOURCE = Pyrex-$(PYTHON_PYREX_VERSION).tar.gz
+PYTHON_PYREX_SITE = http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/
+PYTHON_PYREX_DEPENDENCIES = host-python
+PYTHON_PYREX_LICENSE = Apache-v2
+PYTHON_PYREX_LICENSE_FILES = LICENSE.txt
+PYTHON_PYREX_SETUP_TYPE = distutils
+
+$(eval $(host-python-package))
--
1.7.9.5
