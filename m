From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  2 Jul 2020 22:22:27 +0200
Subject: [Buildroot] [PATCH 08/11] package/lua-cqueues: temporarily disabled
 with Lua 5.4
In-Reply-To: <20200702202230.1531929-1-francois.perrad@gadz.org>
References: <20200702202230.1531929-1-francois.perrad@gadz.org>
Message-ID: <20200702202230.1531929-9-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

and its reverse dependency

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-cqueues/Config.in | 1 +
 package/lua-http/Config.in    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/lua-cqueues/Config.in b/package/lua-cqueues/Config.in
index 60f022848..de2aa4692 100644
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
diff --git a/package/lua-http/Config.in b/package/lua-http/Config.in
index 19a77f107..bf1129901 100644
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
-- 
2.25.1
