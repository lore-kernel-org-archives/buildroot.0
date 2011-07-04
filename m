From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon,  4 Jul 2011 15:54:43 +0200
Subject: [Buildroot] [PATCH 4/6] orc: new package
In-Reply-To: <1309787685-22269-1-git-send-email-s.neumann@raumfeld.com>
References: <1309787685-22269-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1309787685-22269-5-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Orc - the Oil Runtime Compiler - is the successor of liboil.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/Config.in     |    1 +
 package/orc/Config.in |    7 +++++++
 package/orc/orc.mk    |   12 ++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/orc/Config.in
 create mode 100644 package/orc/orc.mk

diff --git a/package/Config.in b/package/Config.in
index 1a4815a..e4356d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -340,6 +340,7 @@ source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
 source "package/liboil/Config.in"
 source "package/libsigc/Config.in"
+source "package/orc/Config.in"
 source "package/startup-notification/Config.in"
 endmenu
 
diff --git a/package/orc/Config.in b/package/orc/Config.in
new file mode 100644
index 0000000..3a5ca20
--- /dev/null
+++ b/package/orc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBORC
+	bool "liborc"
+	help
+	  Orc is a library and set of tools for compiling and executing
+          very simple programs that operate on arrays of data.
+
+          http://code.entropywave.com/projects/orc/
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
new file mode 100644
index 0000000..c1b4baa
--- /dev/null
+++ b/package/orc/orc.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# orc
+#
+#############################################################
+ORC_VERSION = 0.4.14
+ORC_SOURCE = orc-$(ORC_VERSION).tar.gz
+ORC_SITE = http://code.entropywave.com/download/orc/
+ORC_AUTORECONF = YES
+ORC_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,orc))
-- 
1.7.1
