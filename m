From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 1 Nov 2018 11:57:11 +0100
Subject: [Buildroot] [git commit] python-scapy: new package
Message-ID: <20181101105858.0BFEE83A93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5180dddc4a40ca4af2d76146ac4f32ef5536d4e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Interactive packet manipulation tool.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                      |  1 +
 package/python-scapy/Config.in         |  8 ++++++++
 package/python-scapy/python-scapy.hash |  5 +++++
 package/python-scapy/python-scapy.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3334d0d1cf..b2b37a4438 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1001,6 +1001,7 @@ menu "External python modules"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-scandir/Config.in"
+	source "package/python-scapy/Config.in"
 	source "package/python-scapy3k/Config.in"
 	source "package/python-schedule/Config.in"
 	source "package/python-sdnotify/Config.in"
diff --git a/package/python-scapy/Config.in b/package/python-scapy/Config.in
new file mode 100644
index 0000000000..6575a33af3
--- /dev/null
+++ b/package/python-scapy/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SCAPY
+	bool "python-scapy"
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
+	help
+	  Scapy: interactive packet manipulation tool.
+
+	  http://www.secdev.org/projects/scapy
diff --git a/package/python-scapy/python-scapy.hash b/package/python-scapy/python-scapy.hash
new file mode 100644
index 0000000000..4d8001b752
--- /dev/null
+++ b/package/python-scapy/python-scapy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/scapy/json
+md5	d7d3c4294f5a718e234775d38dbeb7ec  scapy-2.4.0.tar.gz
+sha256	452f714f5c2eac6fd0a6146b1dbddfc24dd5f4103f3ed76227995a488cfb2b73  scapy-2.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256	7a49a7fdaf7b648e451dd01e4875cf4dbfa556c6359c6b97feed5047540ea989  PKG-INFO
diff --git a/package/python-scapy/python-scapy.mk b/package/python-scapy/python-scapy.mk
new file mode 100644
index 0000000000..c44b2cb2e5
--- /dev/null
+++ b/package/python-scapy/python-scapy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-scapy
+#
+################################################################################
+
+PYTHON_SCAPY_VERSION = 2.4.0
+PYTHON_SCAPY_SOURCE = scapy-$(PYTHON_SCAPY_VERSION).tar.gz
+PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/68/01/b9943984447e7ea6f8948e90c1729b78161c2bb3eef908430638ec3f7296
+PYTHON_SCAPY_LICENSE = GPL-2.0
+PYTHON_SCAPY_LICENSE_FILES = PKG-INFO
+PYTHON_SCAPY_SETUP_TYPE = distutils
+
+$(eval $(python-package))
