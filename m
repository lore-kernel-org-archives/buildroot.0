From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 22:45:48 +0200
Subject: [Buildroot] [git commit] python-pexpect: new package
Message-ID: <20160415204628.37819802AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60262f141d7b0c3872065141e5e038d274b06185
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas:
 - fix hash file
 - fix <pkg>_SITE variable
 - remove runtime only dependency from .mk file, as suggested by Yegor
   Yefremov]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/python-pexpect/Config.in           | 12 ++++++++++++
 package/python-pexpect/python-pexpect.hash |  3 +++
 package/python-pexpect/python-pexpect.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 25b43c0..bcfe13b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -688,6 +688,7 @@ menu "External python modules"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-pam/Config.in"
 	source "package/python-paramiko/Config.in"
+	source "package/python-pexpect/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
diff --git a/package/python-pexpect/Config.in b/package/python-pexpect/Config.in
new file mode 100644
index 0000000..58a3af5
--- /dev/null
+++ b/package/python-pexpect/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_PEXPECT
+	bool "python-pexpect"
+	select BR2_PACKAGE_PYTHON_PTYPROCESS # runtime
+	help
+	  Pexpect is a pure Python module for spawning child
+	  applications; controlling them; and responding to expected
+	  patterns in their output. Pexpect works like Don Libes???
+	  Expect. Pexpect allows your script to spawn a child
+	  application and control it as if a human were typing
+	  commands.
+
+	  https://pexpect.readthedocs.org
diff --git a/package/python-pexpect/python-pexpect.hash b/package/python-pexpect/python-pexpect.hash
new file mode 100644
index 0000000..29cf892
--- /dev/null
+++ b/package/python-pexpect/python-pexpect.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org, sha256 locally computed
+md5 056df81e6ca7081f1015b4b147b977b7 pexpect-4.0.1.tar.gz
+sha256 232795ebcaaf2e120396dbbaa3a129eda51757eeaae1911558f4ef8ee414fc6c pexpect-4.0.1.tar.gz
diff --git a/package/python-pexpect/python-pexpect.mk b/package/python-pexpect/python-pexpect.mk
new file mode 100644
index 0000000..b74bf83
--- /dev/null
+++ b/package/python-pexpect/python-pexpect.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pexpect
+#
+################################################################################
+
+PYTHON_PEXPECT_VERSION = 4.0.1
+PYTHON_PEXPECT_SITE = https://pypi.python.org/packages/source/p/pexpect
+PYTHON_PEXPECT_SOURCE = pexpect-$(PYTHON_PEXPECT_VERSION).tar.gz
+PYTHON_PEXPECT_LICENSE = ISC
+PYTHON_PEXPECT_LICENSE_FILES = LICENSE
+PYTHON_PEXPECT_SETUP_TYPE = distutils
+
+$(eval $(python-package))
