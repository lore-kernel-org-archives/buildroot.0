From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Jun 2014 08:02:05 -0700
Subject: [Buildroot] [PATCH 2/3] tclap: new package
In-Reply-To: <1402412526-24844-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1402412526-24844-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1402412526-24844-3-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in       |    1 +
 package/tclap/Config.in |   12 ++++++++++++
 package/tclap/tclap.mk  |   16 ++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/tclap/Config.in
 create mode 100644 package/tclap/tclap.mk

diff --git a/package/Config.in b/package/Config.in
index 60118ea..ac3af6b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -856,6 +856,7 @@ source "package/pcre/Config.in"
 source "package/popt/Config.in"
 source "package/readline/Config.in"
 source "package/slang/Config.in"
+source "package/tclap/Config.in"
 endmenu
 
 endmenu
diff --git a/package/tclap/Config.in b/package/tclap/Config.in
new file mode 100644
index 0000000..e50704b
--- /dev/null
+++ b/package/tclap/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_TCLAP
+	bool "tclap"
+	help
+	  This is a small, flexible library that provides a simple interface for
+	  defining and accessing command line arguments. It was intially inspired
+	  by the user friendly CLAP libary. The difference is that this library is
+	  templatized, so the argument class is type independent. Type independence
+	  avoids identical-except-for-type objects, such as IntArg, FloatArg, and
+	  StringArg. While the library is not strictly compliant with the GNU or
+	  POSIX standards, it is close.
+
+	  http://tclap.sourceforge.net/
diff --git a/package/tclap/tclap.mk b/package/tclap/tclap.mk
new file mode 100644
index 0000000..268b90b
--- /dev/null
+++ b/package/tclap/tclap.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# tclap
+#
+################################################################################
+
+TCLAP_VERSION = 1.2.1
+TCLAP_SITE = http://downloads.sourceforge.net/project/tclap
+TCLAP_SOURCE = tclap-$(TCLAP_VERSION).tar.gz
+TCLAP_LICENSE = MIT
+TCLAP_LICENSE_FILES = COPYING
+
+TCLAP_INSTALL_STAGING = YES
+TCLAP_INSTALL_TARGET = NO
+
+$(eval $(autotools-package))
-- 
1.7.9.5
