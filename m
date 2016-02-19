From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 22:22:00 +0100
Subject: [Buildroot] [git commit] python-pytrie: new package
Message-ID: <20160302202753.23B617FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3116fd4797d5dc63c5529a4cd2f85e51adfbfc66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/python-pytrie/Config.in          |  6 ++++++
 package/python-pytrie/python-pytrie.hash |  3 +++
 package/python-pytrie/python-pytrie.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ca3d063..32bf4dd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -700,6 +700,7 @@ menu "External python modules"
 	source "package/python-pysnmp/Config.in"
 	source "package/python-pysnmp-apps/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
+	source "package/python-pytrie/Config.in"
 	source "package/python-pyudev/Config.in"
 	source "package/python-pyusb/Config.in"
 	source "package/python-pyxb/Config.in"
diff --git a/package/python-pytrie/Config.in b/package/python-pytrie/Config.in
new file mode 100644
index 0000000..fb1df41
--- /dev/null
+++ b/package/python-pytrie/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYTRIE
+	bool "python-pytrie"
+	help
+	  A pure Python implementation of the trie data structure.
+
+	  https://pypi.python.org/pypi/PyTrie
diff --git a/package/python-pytrie/python-pytrie.hash b/package/python-pytrie/python-pytrie.hash
new file mode 100644
index 0000000..88d2542
--- /dev/null
+++ b/package/python-pytrie/python-pytrie.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=5997b46c854a68bc588f4527c987663a, sha256 locally computed.
+md5	5997b46c854a68bc588f4527c987663a  PyTrie-0.2.tar.gz
+sha256	b272021351efadc6757591aac03ed4794bdfd091122204a4673e94bfb66cc500  PyTrie-0.2.tar.gz
diff --git a/package/python-pytrie/python-pytrie.mk b/package/python-pytrie/python-pytrie.mk
new file mode 100644
index 0000000..e3bea4f
--- /dev/null
+++ b/package/python-pytrie/python-pytrie.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pytrie
+#
+################################################################################
+
+PYTHON_PYTRIE_VERSION = 0.2
+PYTHON_PYTRIE_SITE = http://pypi.python.org/packages/source/P/PyTrie
+PYTHON_PYTRIE_SOURCE = PyTrie-$(PYTHON_PYTRIE_VERSION).tar.gz
+PYTHON_PYTRIE_LICENSE = BSD-3c
+PYTHON_PYTRIE_LICENSE_FILES = LICENSE
+PYTHON_PYTRIE_SETUP_TYPE = distutils
+
+$(eval $(python-package))
