From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 22 Feb 2019 10:50:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdb: disable inprocess-agent in
 static build
Message-ID: <20190222095044.32559-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/b40bdbca6669a81301fca523e982dbc9584a4e65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdb/gdb.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 062f3a730c..a926961372 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -139,6 +139,11 @@ ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 GDB_CONF_OPTS += --disable-build-with-cxx
 endif
 
+# inprocess-agent can't be built statically
+ifeq ($(BR2_STATIC_LIBS),y)
+GDB_CONF_OPTS += --disable-inprocess-agent
+endif
+
 ifeq ($(BR2_PACKAGE_GDB_TUI),y)
 GDB_CONF_OPTS += --enable-tui
 else
-- 
2.14.1
