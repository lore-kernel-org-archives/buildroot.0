From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 21:58:48 +0100
Subject: [Buildroot] [git commit] python-cheetah: new package
Message-ID: <20141221205922.62E8180555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ef15fd63ef041dd28f7421db45463217e9429cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Remove dependency on host-python-markdown, apparently not needed
   (it builds fine in a minimal chroot, which doesn't have
   python-markdown installed)
 - Remove runtime dependency on markdown, I can run Cheetah basic
   examples without python-markdown installed.
 - Add dependency on Python 2 only, since it doesn't build for Python
   3.]

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/python-cheetah/Config.in         |   12 ++++++++++++
 package/python-cheetah/python-cheetah.mk |   13 +++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e27a804..5a7616b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -489,6 +489,7 @@ menu "external python modules"
 	source "package/python-bottle/Config.in"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
+	source "package/python-cheetah/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-crc16/Config.in"
diff --git a/package/python-cheetah/Config.in b/package/python-cheetah/Config.in
new file mode 100644
index 0000000..e98dc39
--- /dev/null
+++ b/package/python-cheetah/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_CHEETAH
+	bool "python-cheetah"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Cheetah is an open source template engine and code generation tool.
+
+	  It can be used standalone or combined with other tools and frameworks.
+	  Web development is its principle use, but Cheetah is very flexible
+	  and is also being used to generate C++ game code, Java, sql, form
+	  emails and even Python code.
+
+	  https://pypi.python.org/pypi/Cheetah/
diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
new file mode 100644
index 0000000..08076b5
--- /dev/null
+++ b/package/python-cheetah/python-cheetah.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-cheetah
+#
+################################################################################
+
+PYTHON_CHEETAH_VERSION = 2.4.4
+PYTHON_CHEETAH_SOURCE = Cheetah-$(PYTHON_CHEETAH_VERSION).tar.gz
+PYTHON_CHEETAH_SITE = http://pypi.python.org/packages/source/C/Cheetah
+PYTHON_CHEETAH_LICENSE = MIT
+PYTHON_CHEETAH_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
