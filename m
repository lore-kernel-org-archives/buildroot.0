From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 13 Dec 2017 10:04:21 +0100
Subject: [Buildroot] [PATCH 1/4] python-more-itertools: new package
Message-ID: <20171213090424.11172-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                        |  1 +
 package/python-more-itertools/Config.in                  |  7 +++++++
 package/python-more-itertools/python-more-itertools.hash |  4 ++++
 package/python-more-itertools/python-more-itertools.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-more-itertools/Config.in
 create mode 100644 package/python-more-itertools/python-more-itertools.hash
 create mode 100644 package/python-more-itertools/python-more-itertools.mk

diff --git a/package/Config.in b/package/Config.in
index cb2141b8f3..0e9a420452 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -810,6 +810,7 @@ menu "External python modules"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-meld3/Config.in"
 	source "package/python-mistune/Config.in"
+	source "package/python-more-itertools/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-mutagen/Config.in"
 	source "package/python-mwclient/Config.in"
diff --git a/package/python-more-itertools/Config.in b/package/python-more-itertools/Config.in
new file mode 100644
index 0000000000..dc5fb7ce54
--- /dev/null
+++ b/package/python-more-itertools/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MORE_ITERTOOLS
+	bool "python-more-itertools"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  More routines for operating on iterables, beyond itertools.
+
+	  https://github.com/erikrose/more-itertools
diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
new file mode 100644
index 0000000000..36748cb395
--- /dev/null
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/more-itertools/json, sha256 locally computed
+md5	fef89b28d050e325fbb7eb209e75ab45  more-itertools-4.0.1.tar.gz
+sha256	5d21dcefa19782f9ec9aa64e0bfd903f5024512b1e1f17519800b193b2e64d31  more-itertools-4.0.1.tar.gz
+sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
new file mode 100644
index 0000000000..971a338626
--- /dev/null
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-more-itertools
+#
+################################################################################
+
+PYTHON_MORE_ITERTOOLS_VERSION = 4.0.1
+PYTHON_MORE_ITERTOOLS_SOURCE = more-itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
+PYTHON_MORE_ITERTOOLS_SITE = https://pypi.python.org/packages/a2/28/d02c111c230a769a32fd97e9f6d42bfb0136da381f356b945db38367b3d3
+PYTHON_MORE_ITERTOOLS_SETUP_TYPE = setuptools
+PYTHON_MORE_ITERTOOLS_LICENSE = MIT
+PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
