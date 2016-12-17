From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 15:04:57 +0100
Subject: [Buildroot] [git commit] python-mbstrdecoder: new package
Message-ID: <20161217140514.9508E81844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a26ab2404a0eca68e86c4600e93ab6bfdfcbf1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                    |  1 +
 package/python-mbstrdecoder/Config.in                |  6 ++++++
 package/python-mbstrdecoder/python-mbstrdecoder.hash |  3 +++
 package/python-mbstrdecoder/python-mbstrdecoder.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f7e8c0a..066759c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -710,6 +710,7 @@ menu "External python modules"
 	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
 	source "package/python-markupsafe/Config.in"
+	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-meld3/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-msgpack/Config.in"
diff --git a/package/python-mbstrdecoder/Config.in b/package/python-mbstrdecoder/Config.in
new file mode 100644
index 0000000..017002c
--- /dev/null
+++ b/package/python-mbstrdecoder/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_MBSTRDECODER
+	bool "python-mbstrdecoder"
+	help
+	  multi-byte character string decoder.
+
+	  https://github.com/thombashi/mbstrdecoder
diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.hash b/package/python-mbstrdecoder/python-mbstrdecoder.hash
new file mode 100644
index 0000000..1389ac3
--- /dev/null
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/mbstrdecoder/json, sha256 locally computed
+md5	5548c4748cf0bc16befcf7ef848f95ff  mbstrdecoder-0.1.0.tar.gz
+sha256	7c65c4ea6681729ddfdb7612ac39f5accb10abb4e838ca810d810931ec023aad  mbstrdecoder-0.1.0.tar.gz
diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.mk b/package/python-mbstrdecoder/python-mbstrdecoder.mk
new file mode 100644
index 0000000..f64bde9
--- /dev/null
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-mbstrdecoder
+#
+################################################################################
+
+PYTHON_MBSTRDECODER_VERSION = 0.1.0
+PYTHON_MBSTRDECODER_SOURCE = mbstrdecoder-$(PYTHON_MBSTRDECODER_VERSION).tar.gz
+PYTHON_MBSTRDECODER_SITE = https://pypi.python.org/packages/e4/10/fa3d8716b28e2b37eba1edab1c6831a56b805032328279c14fc99d37c391
+PYTHON_MBSTRDECODER_SETUP_TYPE = setuptools
+PYTHON_MBSTRDECODER_LICENSE = MIT
+PYTHON_MBSTRDECODER_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
