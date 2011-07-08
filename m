From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri,  8 Jul 2011 15:12:53 +0200
Subject: [Buildroot] [PATCH 1/6] orc: new package
In-Reply-To: <1310130778-6359-1-git-send-email-s.neumann@raumfeld.com>
References: <1310130778-6359-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1310130778-6359-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Orc - the Oil Runtime Compiler - is the successor of liboil.
There's a runtime library that is installed in staging and target
and there's a host version that can be built if orcc, the ORC
compiler is needed at build time.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/Config.in     |    1 +
 package/orc/Config.in |    7 +++++++
 package/orc/orc.mk    |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/orc/Config.in
 create mode 100644 package/orc/orc.mk

diff --git a/package/Config.in b/package/Config.in
index 09aa76a..c38090b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -341,6 +341,7 @@ source "package/libglib2/Config.in"
 source "package/libnspr/Config.in"
 source "package/liboil/Config.in"
 source "package/libsigc/Config.in"
+source "package/orc/Config.in"
 source "package/startup-notification/Config.in"
 endmenu
 
diff --git a/package/orc/Config.in b/package/orc/Config.in
new file mode 100644
index 0000000..3b3e059
--- /dev/null
+++ b/package/orc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ORC
+	bool "orc"
+	help
+	  Orc is a library and set of tools for compiling and executing
+          very simple programs that operate on arrays of data.
+
+          http://code.entropywave.com/projects/orc/
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
new file mode 100644
index 0000000..6844bc9
--- /dev/null
+++ b/package/orc/orc.mk
@@ -0,0 +1,13 @@
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
+$(eval $(call AUTOTARGETS,package,orc,host))
-- 
1.7.1
