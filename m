From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Nov 2019 17:33:23 +0100
Subject: [Buildroot] [git commit branch/next] package/python-bunch: new
 package
Message-ID: <20191119162601.744978F39E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f15dd35ef659cffa6e6d25cde38c9a0248f2b5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Thomas: add missing entry to DEVELOPERS file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/python-bunch/Config.in         |  6 ++++++
 package/python-bunch/python-bunch.hash |  5 +++++
 package/python-bunch/python-bunch.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b1a20eaebe..19ea83df3b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1591,6 +1591,7 @@ F:	package/policycoreutils/
 F:	package/proftpd/
 F:	package/protobuf-c/
 F:	package/protobuf/
+F:	package/python-bunch/
 F:	package/python-colorama/
 F:	package/python-flask-cors/
 F:	package/python-iptables/
diff --git a/package/python-bunch/Config.in b/package/python-bunch/Config.in
new file mode 100644
index 0000000000..89eae742b8
--- /dev/null
+++ b/package/python-bunch/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_BUNCH
+	bool "python-bunch"
+	help
+	  A dot-accessible dictionary (a la JavaScript objects).
+
+	  http://github.com/dsc/bunch
diff --git a/package/python-bunch/python-bunch.hash b/package/python-bunch/python-bunch.hash
new file mode 100644
index 0000000000..5cf2cece46
--- /dev/null
+++ b/package/python-bunch/python-bunch.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/bunch/json
+md5	0a829d64e95ed96defbcae2bf9061bb0  bunch-1.0.1.tar.gz
+sha256	50c77a0fc0cb372dfe48b5e11937d5f70e743adbf42683f3a6d2857645a76aaa  bunch-1.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256	57ca95c92059c8380625192462979bd32994aae3fcdf902ff6eb1e467eeb0469  LICENSE.txt
diff --git a/package/python-bunch/python-bunch.mk b/package/python-bunch/python-bunch.mk
new file mode 100644
index 0000000000..18fdc223bb
--- /dev/null
+++ b/package/python-bunch/python-bunch.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-bunch
+#
+################################################################################
+
+PYTHON_BUNCH_VERSION = 1.0.1
+PYTHON_BUNCH_SOURCE = bunch-$(PYTHON_BUNCH_VERSION).tar.gz
+PYTHON_BUNCH_SITE = https://files.pythonhosted.org/packages/ef/bf/a4cf1779a4ffb4f610903fa08e15d1f4a8a2f4e3353a02afbe097c5bf4a8
+PYTHON_BUNCH_SETUP_TYPE = setuptools
+PYTHON_BUNCH_LICENSE = MIT
+PYTHON_BUNCH_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
