From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Mar 2019 17:18:20 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/gdb: disable
 inprocess-agent in static build
Message-ID: <20190313164839.506FD8ECA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8944d527dba2a897da276807f549a1eb222669b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Fixes:
 - http://autobuild.buildroot.org/results/b40bdbca6669a81301fca523e982dbc9584a4e65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2a01a328195090c45d2b2407680cbf567f547643)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
