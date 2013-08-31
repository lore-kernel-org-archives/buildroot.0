From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:03 -0000
Subject: [Buildroot] [git commit] lua: remove built dependencies
Message-ID: <20130831213337.59A5F9B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96a1cf3838634737c60fc1d9c0e6577fee992175
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

runtime dependencies are handled in Config.in

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cgilua/Config.in     |    1 +
 package/cgilua/cgilua.mk     |    1 -
 package/copas/Config.in      |    1 +
 package/copas/copas.mk       |    1 -
 package/coxpcall/coxpcall.mk |    1 -
 package/wsapi/Config.in      |    1 +
 package/wsapi/wsapi.mk       |    1 -
 package/xavante/Config.in    |    1 +
 package/xavante/xavante.mk   |    1 -
 9 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/cgilua/Config.in b/package/cgilua/Config.in
index 01928f0..d1e7fbf 100644
--- a/package/cgilua/Config.in
+++ b/package/cgilua/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CGILUA
 	bool "cgilua"
+	# Runtime dependency only
 	select BR2_PACKAGE_LUAFILESYSTEM
 	help
 	  CGILua is a tool for creating dynamic HTML pages
diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index a9c8874..e327fed 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -6,7 +6,6 @@
 
 CGILUA_VERSION = 5.1.4
 CGILUA_SITE = http://github.com/downloads/keplerproject/cgilua
-CGILUA_DEPENDENCIES = luafilesystem
 CGILUA_LICENSE = MIT
 
 define CGILUA_INSTALL_TARGET_CMDS
diff --git a/package/copas/Config.in b/package/copas/Config.in
index 9969c8f..21dd0eb 100644
--- a/package/copas/Config.in
+++ b/package/copas/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_COPAS
 	bool "copas"
+	# Runtime dependency only
 	select BR2_PACKAGE_COXPCALL
 	select BR2_PACKAGE_LUASOCKET
 	help
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index 347b575..e100f49 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -6,7 +6,6 @@
 
 COPAS_VERSION = 1.1.6
 COPAS_SITE = http://github.com/downloads/keplerproject/copas
-COPAS_DEPENDENCIES = lua coxpcall luasocket
 COPAS_LICENSE = MIT
 
 define COPAS_INSTALL_TARGET_CMDS
diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index c3e4a7f..275dcde 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -6,7 +6,6 @@
 
 COXPCALL_VERSION = 1.13.0
 COXPCALL_SITE = http://luaforge.net/frs/download.php/3406
-COXPCALL_DEPENDENCIES = lua
 COXPCALL_LICENSE = MIT
 
 define COXPCALL_INSTALL_TARGET_CMDS
diff --git a/package/wsapi/Config.in b/package/wsapi/Config.in
index 3621648..348a040 100644
--- a/package/wsapi/Config.in
+++ b/package/wsapi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WSAPI
 	bool "wsapi"
+	# Runtime dependency only
 	select BR2_PACKAGE_COXPCALL
 	select BR2_PACKAGE_LUAFILESYSTEM
 	select BR2_PACKAGE_RINGS
diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index 4a64b94..c70502b 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -6,7 +6,6 @@
 
 WSAPI_VERSION = 1.5
 WSAPI_SITE = http://github.com/downloads/keplerproject/wsapi
-WSAPI_DEPENDENCIES = coxpcall luafilesystem rings
 WSAPI_LICENSE = MIT
 
 define WSAPI_INSTALL_TARGET_CMDS
diff --git a/package/xavante/Config.in b/package/xavante/Config.in
index db34d66..be8e6d9 100644
--- a/package/xavante/Config.in
+++ b/package/xavante/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAVANTE
 	bool "xavante"
+	# Runtime dependency only
 	select BR2_PACKAGE_CGILUA
 	select BR2_PACKAGE_COPAS
 	select BR2_PACKAGE_COXPCALL
diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index 7c7fdde..dd2a707 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -6,7 +6,6 @@
 
 XAVANTE_VERSION = 2.2.1
 XAVANTE_SITE = http://github.com/downloads/keplerproject/xavante
-XAVANTE_DEPENDENCIES = cgilua copas coxpcall lua luafilesystem luasocket wsapi
 XAVANTE_LICENSE = MIT
 
 define XAVANTE_INSTALL_TARGET_CMDS
