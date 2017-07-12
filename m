From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 18:37:01 +0200
Subject: [Buildroot] [git commit] python-hyperlink: new package
Message-ID: <20170712163301.88C548213C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c6222c04327da94b2a19f9984d94ee16a1a3320
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Though PyPI says the license is BSD, GitHub repo has an MIT license
file since April 2017 and upstream setup.py was also fixed.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                              |  1 +
 package/python-hyperlink/Config.in             |  6 ++++++
 package/python-hyperlink/python-hyperlink.hash |  3 +++
 package/python-hyperlink/python-hyperlink.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index db943df..b48ab5e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -742,6 +742,7 @@ menu "External python modules"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-humanize/Config.in"
+	source "package/python-hyperlink/Config.in"
 	source "package/python-id3/Config.in"
 	source "package/python-idna/Config.in"
 	source "package/python-incremental/Config.in"
diff --git a/package/python-hyperlink/Config.in b/package/python-hyperlink/Config.in
new file mode 100644
index 0000000..11ac814
--- /dev/null
+++ b/package/python-hyperlink/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_HYPERLINK
+	bool "python-hyperlink"
+	help
+	  A featureful, correct URL for Python.
+
+	  https://github.com/python-hyper/hyperlink
diff --git a/package/python-hyperlink/python-hyperlink.hash b/package/python-hyperlink/python-hyperlink.hash
new file mode 100644
index 0000000..5ff5e7a
--- /dev/null
+++ b/package/python-hyperlink/python-hyperlink.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/hyperlink/json, sha256 locally computed
+md5	717dae425baa7b6f6d9d590666ec8472  hyperlink-17.2.1.tar.gz
+sha256	2c74b35662416f44823d50e59305f761a933723ae6528cc5b0d711361453f28b  hyperlink-17.2.1.tar.gz
diff --git a/package/python-hyperlink/python-hyperlink.mk b/package/python-hyperlink/python-hyperlink.mk
new file mode 100644
index 0000000..21f784e
--- /dev/null
+++ b/package/python-hyperlink/python-hyperlink.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-hyperlink
+#
+################################################################################
+
+PYTHON_HYPERLINK_VERSION = 17.2.1
+PYTHON_HYPERLINK_SOURCE = hyperlink-$(PYTHON_HYPERLINK_VERSION).tar.gz
+PYTHON_HYPERLINK_SITE = https://pypi.python.org/packages/a2/d9/56b6a007a643d6511e616a2be74f67c3703e2aea4e9eaa44bdf48bc78c82
+PYTHON_HYPERLINK_SETUP_TYPE = setuptools
+PYTHON_HYPERLINK_LICENSE = MIT
+
+$(eval $(python-package))
