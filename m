From: Jeremy Kerr <jk@ozlabs.org>
Date: Tue, 17 Jun 2014 13:21:47 +0800
Subject: [Buildroot] [PATCH 4/7 v3] package/powerpc-utils: Add powerpc
	hardware utilities
In-Reply-To: <1402982507.183937.570365596242.0.gpush@pablo>
Message-ID: <1402982507.185290.70487867379.4.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change adds a package definition for the powerpc-utils project,
containing a set of powerpc-specific hardware management utilities.

We're using a git tag from upstream, which contains a few build-system
fixes.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/Config.in                      |    1 +
 package/powerpc-utils/Config.in        |    5 +++++
 package/powerpc-utils/powerpc-utils.mk |   16 ++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f43e985..125f3f0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1115,6 +1115,7 @@ endif
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
+	source "package/powerpc-utils/Config.in"
 	source "package/polkit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/procps-ng/Config.in"
diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
new file mode 100644
index 0000000..c919094
--- /dev/null
+++ b/package/powerpc-utils/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_POWERPC_UTILS
+	bool "powerpc-utils"
+	select BR2_PACKAGE_ZLIB
+	help
+	  System utilities for powerpc machines
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
new file mode 100644
index 0000000..c9cc096
--- /dev/null
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# powerpc-utils
+#
+################################################################################
+
+POWERPC_UTILS_VERSION = v1.4
+POWERPC_UTILS_SITE = git://git.code.sf.net/p/powerpc-utils/powerpc-utils
+POWERPC_UTILS_AUTORECONF = YES
+POWERPC_UTILS_DEPENDENCIES = zlib
+POWERPC_UTILS_LICENSE = Common Public License Version 1.0
+POWERPC_UTILS_LICENSE_FILES = COPYRIGHT
+
+POWERPC_UTILS_CONF_OPT = --without-librtas
+
+$(eval $(autotools-package))
