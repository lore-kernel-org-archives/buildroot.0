From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:48 -0000
Subject: [Buildroot] [git commit] package/python-huepy: new package
Message-ID: <20191202083932.38CCA7F901@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5d9f559ae4de6ffcad508eb2f2e0089c2afc192
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-huepy/Config.in         |  6 ++++++
 package/python-huepy/python-huepy.hash |  4 ++++
 package/python-huepy/python-huepy.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b006ba6999..04401bb3eb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1394,6 +1394,7 @@ N:	Louis Aussedat <aussedat.louis@gmail.com>
 F:	board/friendlyarm/nanopi-neo-plus2/
 F:	configs/friendlyarm_nanopi_neo_plus2_defconfig
 F:	package/python-dnspython/
+F:	package/python-huepy/
 F:	package/python-tqdm/
 
 N:	Louis-Paul Cordier <lpdev@cordier.org>
diff --git a/package/Config.in b/package/Config.in
index ae396256f4..e1df9326de 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -922,6 +922,7 @@ menu "External python modules"
 	source "package/python-hpack/Config.in"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httplib2/Config.in"
+	source "package/python-huepy/Config.in"
 	source "package/python-humanize/Config.in"
 	source "package/python-hyperframe/Config.in"
 	source "package/python-hyperlink/Config.in"
diff --git a/package/python-huepy/Config.in b/package/python-huepy/Config.in
new file mode 100644
index 0000000000..0bdd25ffda
--- /dev/null
+++ b/package/python-huepy/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_HUEPY
+	bool "python-huepy"
+	help
+	  Hue will help you to print awesomely in terminals.
+
+	  https://github.com/s0md3v/hue
diff --git a/package/python-huepy/python-huepy.hash b/package/python-huepy/python-huepy.hash
new file mode 100644
index 0000000000..5a1a8fc1e3
--- /dev/null
+++ b/package/python-huepy/python-huepy.hash
@@ -0,0 +1,4 @@
+# Locally computer sha256 checksums
+md5	da6514d9d61fb75ac9470f6863ce1aca  python-huepy-a9851d5aea10d2299cc62b3f6dce26ac4ef2ea3e.tar.gz
+sha256	63147cef5ecae5c1ab38000be91def351710e6bef2c5f67b5303418becf6c0f2  python-huepy-a9851d5aea10d2299cc62b3f6dce26ac4ef2ea3e.tar.gz
+sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  LICENSE
diff --git a/package/python-huepy/python-huepy.mk b/package/python-huepy/python-huepy.mk
new file mode 100644
index 0000000000..5c1041205d
--- /dev/null
+++ b/package/python-huepy/python-huepy.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-huepy
+#
+################################################################################
+
+PYTHON_HUEPY_VERSION = a9851d5aea10d2299cc62b3f6dce26ac4ef2ea3e
+PYTHON_HUEPY_SITE = $(call github,s0md3v,hue,$(PYTHON_HUEPY_VERSION))
+PYTHON_HUEPY_LICENSE = GPL-3.0
+PYTHON_HUEPY_LICENSE_FILES = LICENSE
+PYTHON_HUEPY_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
