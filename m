From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 10:54:46 +0100
Subject: [Buildroot] [git commit] package/python-zc-lockfile: new package
Message-ID: <20200204095217.642D68A48F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd307e5f4fdbd54481aa01a9c6c1526c0f2b1c48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |  1 +
 package/python-zc-lockfile/Config.in               |  6 ++++++
 package/python-zc-lockfile/python-zc-lockfile.hash |  5 +++++
 package/python-zc-lockfile/python-zc-lockfile.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 9e51259df9..4bdb84daa9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1191,6 +1191,7 @@ menu "External python modules"
 	source "package/python-xmltodict/Config.in"
 	source "package/python-yarl/Config.in"
 	source "package/python-yieldfrom/Config.in"
+	source "package/python-zc-lockfile/Config.in"
 	source "package/python-zeroconf/Config.in"
 	source "package/python-zope-interface/Config.in"
 endmenu
diff --git a/package/python-zc-lockfile/Config.in b/package/python-zc-lockfile/Config.in
new file mode 100644
index 0000000000..928f3604b7
--- /dev/null
+++ b/package/python-zc-lockfile/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ZC_LOCKFILE
+	bool "python-zc-lockfile"
+	help
+	  Basic inter-process locks.
+
+	  https://github.com/zopefoundation/zc.lockfile
diff --git a/package/python-zc-lockfile/python-zc-lockfile.hash b/package/python-zc-lockfile/python-zc-lockfile.hash
new file mode 100644
index 0000000000..4a9c194885
--- /dev/null
+++ b/package/python-zc-lockfile/python-zc-lockfile.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/zc.lockfile/json
+md5	3895445752278ddcc4578658c3c9a492  zc.lockfile-2.0.tar.gz
+sha256	307ad78227e48be260e64896ec8886edc7eae22d8ec53e4d528ab5537a83203b  zc.lockfile-2.0.tar.gz
+# Locally computed sha256 checksums
+sha256	3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zc-lockfile/python-zc-lockfile.mk b/package/python-zc-lockfile/python-zc-lockfile.mk
new file mode 100644
index 0000000000..a4621e6d06
--- /dev/null
+++ b/package/python-zc-lockfile/python-zc-lockfile.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-zc-lockfile
+#
+################################################################################
+
+PYTHON_ZC_LOCKFILE_VERSION = 2.0
+PYTHON_ZC_LOCKFILE_SOURCE = zc.lockfile-$(PYTHON_ZC_LOCKFILE_VERSION).tar.gz
+PYTHON_ZC_LOCKFILE_SITE = https://files.pythonhosted.org/packages/11/98/f21922d501ab29d62665e7460c94f5ed485fd9d8348c126697947643a881
+PYTHON_ZC_LOCKFILE_SETUP_TYPE = setuptools
+PYTHON_ZC_LOCKFILE_LICENSE = ZPL-2.1
+PYTHON_ZC_LOCKFILE_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
