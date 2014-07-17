From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 23:06:13 +0200
Subject: [Buildroot] [git commit] package/powerpc-utils: Add powerpc
	hardware utilities
Message-ID: <20140717210652.AAE169D268@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ef1fb88faa3839f2209a251894abee37dd53c71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change adds a package definition for the powerpc-utils project,
containing a set of powerpc-specific hardware management utilities.

We're using a git tag from upstream, which contains a few build-system
fixes.

[Thomas:
 - Add dependency on PowerPC architecture in Config.in.
 - Add homepage in Config.in help text.]

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/powerpc-utils/Config.in        |    8 ++++++++
 package/powerpc-utils/powerpc-utils.mk |   16 ++++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bc010fc..22ddea8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1144,6 +1144,7 @@ endif
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
+	source "package/powerpc-utils/Config.in"
 	source "package/polkit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/procps-ng/Config.in"
diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
new file mode 100644
index 0000000..eded41e
--- /dev/null
+++ b/package/powerpc-utils/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_POWERPC_UTILS
+	bool "powerpc-utils"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	select BR2_PACKAGE_ZLIB
+	help
+	  System utilities for PowerPC machines.
+
+	  http://sourceforge.net/projects/powerpc-utils/
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
