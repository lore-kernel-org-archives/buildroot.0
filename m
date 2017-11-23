From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 22:52:14 +0100
Subject: [Buildroot] [git commit] package/python-oauthlib: new package
Message-ID: <20171201205334.9E9587F90C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18d54431b3fe3319d67359df916a4e59b82b3c04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for python-mwclient version bump to 0.8.6.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-oauthlib/Config.in            |  7 +++++++
 package/python-oauthlib/python-oauthlib.hash |  4 ++++
 package/python-oauthlib/python-oauthlib.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fe943d3..2ff00c8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -322,6 +322,7 @@ F:	package/python-mwclient/
 F:	package/python-mwscrape/
 F:	package/python-mwscrape2slob/
 F:	package/python-mako/
+F:	package/python-oauthlib/
 F:	package/python-pyicu/
 F:	package/python-pylru/
 F:	package/python-slob/
diff --git a/package/Config.in b/package/Config.in
index 0f5b7df..66a490d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -817,6 +817,7 @@ menu "External python modules"
 	source "package/python-networkmanager/Config.in"
 	source "package/python-nfc/Config.in"
 	source "package/python-numpy/Config.in"
+	source "package/python-oauthlib/Config.in"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-pam/Config.in"
 	source "package/python-paramiko/Config.in"
diff --git a/package/python-oauthlib/Config.in b/package/python-oauthlib/Config.in
new file mode 100644
index 0000000..982272c
--- /dev/null
+++ b/package/python-oauthlib/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_OAUTHLIB
+	bool "python-oauthlib"
+	help
+	  A generic, spec-compliant, thorough implementation of the OAuth
+	  request-signing logic.
+
+	  https://github.com/idan/oauthlib
diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
new file mode 100644
index 0000000..f8e1324
--- /dev/null
+++ b/package/python-oauthlib/python-oauthlib.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/oauthlib/json, sha256 locally computed
+md5	277a9a966cc8c72e492b4eeb41332445  oauthlib-2.0.6.tar.gz
+sha256	ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2539bbc3ec70ce1  oauthlib-2.0.6.tar.gz
+sha256	9e1ae8725f5815738dadb6cbb09f450453d94e07c7b5efaee864f546a6209a95  LICENSE
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
new file mode 100644
index 0000000..ab39800
--- /dev/null
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-oauthlib
+#
+################################################################################
+
+PYTHON_OAUTHLIB_VERSION = 2.0.6
+PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
+PYTHON_OAUTHLIB_SITE = https://pypi.python.org/packages/a5/8a/212e9b47fb54be109f3ff0684165bb38c51117f34e175c379fce5c7df754
+PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
+PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
+PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
