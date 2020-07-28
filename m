From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 28 Jul 2020 14:56:08 +0200
Subject: [Buildroot] [PATCH v2 06/10] package/lua-cqueues: temporarily
 disabled with Lua 5.4
In-Reply-To: <20200728125613.3153975-1-francois.perrad@gadz.org>
References: <20200728125613.3153975-1-francois.perrad@gadz.org>
Message-ID: <20200728125613.3153975-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

and its reverse dependency

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-cqueues/Config.in | 5 +++--
 package/lua-http/Config.in    | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/lua-cqueues/Config.in b/package/lua-cqueues/Config.in
index 60f022848..c319fbdf4 100644
--- a/package/lua-cqueues/Config.in
+++ b/package/lua-cqueues/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUA_CQUEUES
 	bool "lua-cqueues"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_LUA_5_4
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Continuation Queues: Embeddable asynchronous networking,
@@ -8,5 +9,5 @@ config BR2_PACKAGE_LUA_CQUEUES
 
 	  http://25thandclement.com/~william/projects/cqueues.html
 
-comment "lua-cqueues needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "lua-cqueues needs a toolchain w/ threads, Lua <= 5.3"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PACKAGE_LUA_5_4
diff --git a/package/lua-http/Config.in b/package/lua-http/Config.in
index 19a77f107..3b92ed8e3 100644
--- a/package/lua-http/Config.in
+++ b/package/lua-http/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUA_HTTP
 	bool "lua-http"
 	depends on BR2_TOOLCHAIN_HAS_THREADS    # luaossl & lua-cqueues
+	depends on !BR2_PACKAGE_LUA_5_4 # lua-cqueues
 	select BR2_PACKAGE_LPEG # runtime
 	select BR2_PACKAGE_LUA_BASEXX # runtime
 	select BR2_PACKAGE_LUA_BINARYHEAP # runtime
@@ -15,5 +16,5 @@ config BR2_PACKAGE_LUA_HTTP
 
 	  https://daurnimator.github.io/lua-http/
 
-comment "lua-http needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "lua-http needs a toolchain w/ threads, Lua <= 5.3"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PACKAGE_LUA_5_4
-- 
2.25.1
