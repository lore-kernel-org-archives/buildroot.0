From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Mar 2019 17:47:56 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/gdb: disable
 inprocess-agent in static build
Message-ID: <20190313164834.6A7BC83F68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7eeed688129f4af68ca4de4043f06dd845da32ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

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
index 0981b6ef53..cfe79e2c52 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -128,6 +128,11 @@ ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
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
