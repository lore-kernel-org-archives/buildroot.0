From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 23:34:19 +0200
Subject: [Buildroot] [git commit] package/gumbo-parser: new package
Message-ID: <20210720210408.E92148867D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=f6628763eb302f15f861e0ce7bfc44b34b066bea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gumbo is an implementation of the HTML5 parsing algorithm implemented
as a pure C99 library with no outside dependencies.

Signed-off-by: Rapha??l M??lotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/gumbo-parser/Config.in         | 10 ++++++++++
 package/gumbo-parser/gumbo-parser.hash |  5 +++++
 package/gumbo-parser/gumbo-parser.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1e1a30bac9..e77ceb2a95 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2255,6 +2255,7 @@ N:	Ramon Fried <rfried.dev@gmail.com>
 F:	package/bitwise/
 
 N:	Rapha??l M??lotte <raphael.melotte@mind.be>
+F:	package/gumbo-parser/
 F:	package/jbig2dec/
 F:	package/mupdf/
 F:	package/python-boto3/
diff --git a/package/Config.in b/package/Config.in
index de9378e11c..95ad1a29f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1903,6 +1903,7 @@ menu "Other"
 	source "package/gobject-introspection/Config.in"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
+	source "package/gumbo-parser/Config.in"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
 	source "package/libabseil-cpp/Config.in"
diff --git a/package/gumbo-parser/Config.in b/package/gumbo-parser/Config.in
new file mode 100644
index 0000000000..04bb2294bb
--- /dev/null
+++ b/package/gumbo-parser/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GUMBO_PARSER
+	bool "gumbo-parser"
+	help
+	  Gumbo is an implementation of the HTML5 parsing algorithm
+	  implemented as a pure C99 library with no outside
+	  dependencies. It's designed to serve as a building block for
+	  other tools and libraries such as linters, validators,
+	  templating languages, and refactoring and analysis tools.
+
+	  https://github.com/google/gumbo-parser
diff --git a/package/gumbo-parser/gumbo-parser.hash b/package/gumbo-parser/gumbo-parser.hash
new file mode 100644
index 0000000000..c4af33072c
--- /dev/null
+++ b/package/gumbo-parser/gumbo-parser.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  28463053d44a5dfbc4b77bcf49c8cee119338ffa636cc17fc3378421d714efad  gumbo-parser-0.10.1.tar.gz
+
+# Hash for license files:
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  COPYING
diff --git a/package/gumbo-parser/gumbo-parser.mk b/package/gumbo-parser/gumbo-parser.mk
new file mode 100644
index 0000000000..aedc56cef1
--- /dev/null
+++ b/package/gumbo-parser/gumbo-parser.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# gumbo-parser
+#
+################################################################################
+
+GUMBO_PARSER_VERSION = 0.10.1
+GUMBO_PARSER_SITE = $(call github,google,gumbo-parser,v$(GUMBO_PARSER_VERSION))
+GUMBO_PARSER_LICENSE = Apache-2.0
+GUMBO_PARSER_LICENSE_FILES = COPYING
+GUMBO_PARSER_INSTALL_STAGING = YES
+GUMBO_PARSER_AUTORECONF = YES
+
+$(eval $(autotools-package))
