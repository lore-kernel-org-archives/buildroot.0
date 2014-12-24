From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Dec 2014 12:00:51 +0100
Subject: [Buildroot] [git commit] lua-coatpersistent: bump to version 0.2.1
Message-ID: <20141224111107.656F07FA48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aeb3f480c69e93b4ad2af6a172a0c554e4c67092
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-coatpersistent/Config.in             |    4 ++++
 package/lua-coatpersistent/lua-coatpersistent.mk |    8 ++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/lua-coatpersistent/Config.in b/package/lua-coatpersistent/Config.in
index 86cddda..a0f5bdc 100644
--- a/package/lua-coatpersistent/Config.in
+++ b/package/lua-coatpersistent/Config.in
@@ -3,7 +3,11 @@ config BR2_PACKAGE_LUA_COATPERSISTENT
 	# run-time dependencies
 	select BR2_PACKAGE_DADO
 	select BR2_PACKAGE_LUA_COAT
+	depends on BR2_PACKAGE_LSQLITE3 || BR2_PACKAGE_LUASQL_SQLITE3
 	help
 	  An ORM for lua-Coat.
 
 	  http://fperrad.github.io/lua-CoatPersistent/
+
+comment "lua-coatpersistent needs lsqlite3 or luasql-sqlite3"
+	depends on !BR2_PACKAGE_LSQLITE3 && !BR2_PACKAGE_LUASQL_SQLITE3
diff --git a/package/lua-coatpersistent/lua-coatpersistent.mk b/package/lua-coatpersistent/lua-coatpersistent.mk
index 35035e9..be8a4da 100644
--- a/package/lua-coatpersistent/lua-coatpersistent.mk
+++ b/package/lua-coatpersistent/lua-coatpersistent.mk
@@ -4,8 +4,12 @@
 #
 ################################################################################
 
-LUA_COATPERSISTENT_VERSION_UPSTREAM = 0.2.0
-LUA_COATPERSISTENT_VERSION = $(LUA_COATPERSISTENT_VERSION_UPSTREAM)-1
+LUA_COATPERSISTENT_VERSION_UPSTREAM = 0.2.1
+ifeq ($(BR2_PACKAGE_LSQLITE3),y)
+LUA_COATPERSISTENT_VERSION = lsqlite3-$(LUA_COATPERSISTENT_VERSION_UPSTREAM)-1
+else
+LUA_COATPERSISTENT_VERSION = luasql-$(LUA_COATPERSISTENT_VERSION_UPSTREAM)-1
+endif
 LUA_COATPERSISTENT_SUBDIR = lua-CoatPersistent-$(LUA_COATPERSISTENT_VERSION_UPSTREAM)
 LUA_COATPERSISTENT_LICENSE = MIT
 LUA_COATPERSISTENT_LICENSE_FILES = $(LUA_COATPERSISTENT_SUBDIR)/COPYRIGHT
