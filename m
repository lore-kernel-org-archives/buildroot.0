From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 10 Aug 2020 12:18:39 +0200
Subject: [Buildroot] [PATCH] package/lua-cqueues: bump to version 20200726
Message-ID: <20200810101839.3855928-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

supports Lua 5.4

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-cqueues/Config.in        | 5 ++---
 package/lua-cqueues/lua-cqueues.hash | 2 +-
 package/lua-cqueues/lua-cqueues.mk   | 2 +-
 package/lua-http/Config.in           | 5 ++---
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/lua-cqueues/Config.in b/package/lua-cqueues/Config.in
index c319fbdf4..60f022848 100644
--- a/package/lua-cqueues/Config.in
+++ b/package/lua-cqueues/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LUA_CQUEUES
 	bool "lua-cqueues"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_PACKAGE_LUA_5_4
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Continuation Queues: Embeddable asynchronous networking,
@@ -9,5 +8,5 @@ config BR2_PACKAGE_LUA_CQUEUES
 
 	  http://25thandclement.com/~william/projects/cqueues.html
 
-comment "lua-cqueues needs a toolchain w/ threads, Lua <= 5.3"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PACKAGE_LUA_5_4
+comment "lua-cqueues needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lua-cqueues/lua-cqueues.hash b/package/lua-cqueues/lua-cqueues.hash
index e12cdc642..5803a60d5 100644
--- a/package/lua-cqueues/lua-cqueues.hash
+++ b/package/lua-cqueues/lua-cqueues.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  45b4a0105c096eee5840b69e8e0078eb7b5d61a23aeca30db710f1caac3ec399  lua-cqueues-20200603.tar.gz
+sha256  9e112edd246da5cfca264314b70325a0b63665cb87a00e45ee3ae4f194000d52  lua-cqueues-20200726.tar.gz
 sha256  5f4b1f94047790eadf8fd0f9a8e3bd2895bea4c9a2c0f8bf7cd8c8e57caa5219  LICENSE
diff --git a/package/lua-cqueues/lua-cqueues.mk b/package/lua-cqueues/lua-cqueues.mk
index bfa1df744..6d842eca9 100644
--- a/package/lua-cqueues/lua-cqueues.mk
+++ b/package/lua-cqueues/lua-cqueues.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CQUEUES_VERSION = 20200603
+LUA_CQUEUES_VERSION = 20200726
 LUA_CQUEUES_SITE = $(call github,wahern,cqueues,rel-$(LUA_CQUEUES_VERSION))
 LUA_CQUEUES_LICENSE = MIT
 LUA_CQUEUES_LICENSE_FILES = LICENSE
diff --git a/package/lua-http/Config.in b/package/lua-http/Config.in
index 76eff7f29..8eefd481b 100644
--- a/package/lua-http/Config.in
+++ b/package/lua-http/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LUA_HTTP
 	bool "lua-http"
 	depends on BR2_TOOLCHAIN_HAS_THREADS    # luaossl & lua-cqueues
-	depends on !BR2_PACKAGE_LUA_5_4 # lua-cqueues
 	select BR2_PACKAGE_LPEG # runtime
 	select BR2_PACKAGE_LUA_BASEXX # runtime
 	select BR2_PACKAGE_LUA_BINARYHEAP # runtime
@@ -16,5 +15,5 @@ config BR2_PACKAGE_LUA_HTTP
 
 	  https://daurnimator.github.io/lua-http/
 
-comment "lua-http needs a toolchain w/ threads, Lua <= 5.3"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PACKAGE_LUA_5_4
+comment "lua-http needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.25.1
