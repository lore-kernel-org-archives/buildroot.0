From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Feb 2016 22:28:25 +0100
Subject: [Buildroot] [git commit branch/next] python-characteristic: new
	package
Message-ID: <20160217212914.942A58185E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb570bb560da656f75f3aed1ac203f48381f846f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                        |  1 +
 package/python-characteristic/Config.in                  |  6 ++++++
 package/python-characteristic/python-characteristic.hash |  3 +++
 package/python-characteristic/python-characteristic.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 21be9f6..edf06f1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -626,6 +626,7 @@ menu "External python modules"
 	source "package/python-cbor/Config.in"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
+	source "package/python-characteristic/Config.in"
 	source "package/python-cheetah/Config.in"
 	source "package/python-cherrypy/Config.in"
 	source "package/python-click/Config.in"
diff --git a/package/python-characteristic/Config.in b/package/python-characteristic/Config.in
new file mode 100644
index 0000000..1226fa8
--- /dev/null
+++ b/package/python-characteristic/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CHARACTERISTIC
+	bool "python-characteristic"
+	help
+	  Python attributes without boilerplate.
+
+	  https://pypi.python.org/pypi/characteristic
diff --git a/package/python-characteristic/python-characteristic.hash b/package/python-characteristic/python-characteristic.hash
new file mode 100644
index 0000000..41dc18c
--- /dev/null
+++ b/package/python-characteristic/python-characteristic.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b249368dd021fde1c06b4802867c0913, sha256 locally computed.
+md5	b249368dd021fde1c06b4802867c0913  characteristic-14.3.0.tar.gz
+sha256	ded68d4e424115ed44e5c83c2a901a0b6157a959079d7591d92106ffd3ada380  characteristic-14.3.0.tar.gz
diff --git a/package/python-characteristic/python-characteristic.mk b/package/python-characteristic/python-characteristic.mk
new file mode 100644
index 0000000..dc3e8bb
--- /dev/null
+++ b/package/python-characteristic/python-characteristic.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-characteristic
+#
+################################################################################
+
+PYTHON_CHARACTERISTIC_VERSION = 14.3.0
+PYTHON_CHARACTERISTIC_SOURCE = characteristic-$(PYTHON_CHARACTERISTIC_VERSION).tar.gz
+PYTHON_CHARACTERISTIC_SITE = http://pypi.python.org/packages/source/c/characteristic
+PYTHON_CHARACTERISTIC_LICENSE = MIT
+PYTHON_CHARACTERISTIC_LICENSE_FILES = LICENSE
+PYTHON_CHARACTERISTIC_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
