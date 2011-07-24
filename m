From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jul 2011 23:44:01 +0200
Subject: [Buildroot] [git commit] orc: new package
Message-ID: <20110724214526.DD1AA8B496@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cf0114a41827ea80d4f70b3024a58f6eece4774c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Orc - the Oil Runtime Compiler - is the successor of liboil.
There's a runtime library that is installed in staging and target
and there's a host version that can be built if orcc, the ORC
compiler is needed at build time.

[Peter: minor tweaks]
Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in     |    1 +
 package/orc/Config.in |    7 +++++++
 package/orc/orc.mk    |   10 ++++++++++
 3 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/orc/Config.in
 create mode 100644 package/orc/orc.mk

diff --git a/package/Config.in b/package/Config.in
index b9bd529..28e5570 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -346,6 +346,7 @@ source "package/libglib2/Config.in"
 source "package/libnspr/Config.in"
 source "package/liboil/Config.in"
 source "package/libsigc/Config.in"
+source "package/orc/Config.in"
 source "package/startup-notification/Config.in"
 endmenu
 
diff --git a/package/orc/Config.in b/package/orc/Config.in
new file mode 100644
index 0000000..1de0f23
--- /dev/null
+++ b/package/orc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ORC
+	bool "orc"
+	help
+	  Orc is a library and set of tools for compiling and executing
+	  very simple programs that operate on arrays of data.
+
+	  http://code.entropywave.com/projects/orc/
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
new file mode 100644
index 0000000..f89d5cf
--- /dev/null
+++ b/package/orc/orc.mk
@@ -0,0 +1,10 @@
+#############################################################
+#
+# orc
+#
+#############################################################
+ORC_VERSION = 0.4.14
+ORC_SITE = http://code.entropywave.com/download/orc/
+ORC_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,orc))
-- 
1.7.3.4
