From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Mon,  3 Aug 2015 12:16:03 +0300
Subject: [Buildroot] [PATCH v2 1/1] dawgdic: new package
Message-ID: <1438593363-32653-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

The dawgdic package provides object files and utilities for building and
accessing directed acyclical word graph (DAWG) dictionaries.

This version of the patch uses the updated GitHub dawgdic repo instead of the
Google Code repo used in the previous version of this patch.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/Config.in          |    1 +
 package/dawgdic/Config.in  |   13 +++++++++++++
 package/dawgdic/dawgdic.mk |   17 +++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/dawgdic/Config.in
 create mode 100644 package/dawgdic/dawgdic.mk

diff --git a/package/Config.in b/package/Config.in
index 1e39c74..ef257c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1041,6 +1041,7 @@ menu "Other"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cppcms/Config.in"
+	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
diff --git a/package/dawgdic/Config.in b/package/dawgdic/Config.in
new file mode 100644
index 0000000..209f11a
--- /dev/null
+++ b/package/dawgdic/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_DAWGDIC
+	bool "dawgdic"
+	help
+	  dawgdic provides a library for building and accessing
+	  dictionaries implemented with directed acyclic word graphs
+	  (DAWG). A dawg is constructed by minimizing a trie as a
+	  deterministic finite automaton (DFA), and thus the dawg has
+	  an advantage in memory usage. In addition, dawgdic uses a
+	  double-array as a base data structure, so its retrieval
+	  speed is as fast as that of Darts, a library for building
+	  and accessing double-array tries.
+
+	  https://github.com/stil/dawgdic
diff --git a/package/dawgdic/dawgdic.mk b/package/dawgdic/dawgdic.mk
new file mode 100644
index 0000000..f9b468e
--- /dev/null
+++ b/package/dawgdic/dawgdic.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# dawgdic
+#
+################################################################################
+
+#DAWGDIC_SITE = http://dawgdic.googlecode.com/svn/trunk
+DAWGDIC_SITE = https://github.com/stil/dawgdic.git
+DAWGDIC_SITE_METHOD = git
+DAWGDIC_VERSION = 16ac537ba9883ff01b63b6d1fdc3072150c68fee
+DAWGDIC_LICENSE = GPLv3
+DAWGDIC_LICENSE_FILES = COPYING
+
+DAWGDIC_AUTORECONF = YES
+DAWGDIC_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.9.5
