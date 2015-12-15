From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:41:26 +0100
Subject: [Buildroot] [git commit] python-idna: new package
Message-ID: <20151215215626.C81BB81E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd3afecc70c8b727af4a8d58e11ba2c67ff2ebd9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/python-idna/Config.in        | 10 ++++++++++
 package/python-idna/python-idna.hash |  3 +++
 package/python-idna/python-idna.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c3c1776..402921d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -621,6 +621,7 @@ menu "External python modules"
 	source "package/python-gobject/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-id3/Config.in"
+	source "package/python-idna/Config.in"
 	source "package/python-ipaddr/Config.in"
 	source "package/python-ipy/Config.in"
 	source "package/python-ipython/Config.in"
diff --git a/package/python-idna/Config.in b/package/python-idna/Config.in
new file mode 100644
index 0000000..4ff4581
--- /dev/null
+++ b/package/python-idna/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_IDNA
+	bool "python-idna"
+	help
+	  A library to support the Internationalised Domain Names in
+	  Applications (IDNA) protocol as specified in RFC 5891. This
+	  version of the protocol is often referred to as ???IDNA2008???
+	  and can produce different results from the earlier standard
+	  from 2003.
+
+	  https://github.com/kjd/idna
diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
new file mode 100644
index 0000000..10e3e9d
--- /dev/null
+++ b/package/python-idna/python-idna.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=bd17a9d15e755375f48a62c13b25b801, sha256 locally computed
+md5     bd17a9d15e755375f48a62c13b25b801  idna-2.0.tar.gz
+sha256  16199aad938b290f5be1057c0e1efc6546229391c23cea61ca940c115f7d3d3b  idna-2.0.tar.gz
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
new file mode 100644
index 0000000..7dd1253
--- /dev/null
+++ b/package/python-idna/python-idna.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-idna
+#
+################################################################################
+
+PYTHON_IDNA_VERSION = 2.0
+PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
+PYTHON_IDNA_SITE = https://pypi.python.org/packages/source/i/idna
+PYTHON_IDNA_LICENSE =  BSD-3c
+PYTHON_IDNA_LICENSE_FILES = LICENSE.rst
+PYTHON_IDNA_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
