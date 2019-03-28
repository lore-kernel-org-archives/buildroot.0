From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 28 Mar 2019 18:20:46 +0100
Subject: [Buildroot] [PATCH 2/4] package/lua-http: bump to version 0.3
In-Reply-To: <20190328172048.30238-1-francois.perrad@gadz.org>
References: <20190328172048.30238-1-francois.perrad@gadz.org>
Message-ID: <20190328172048.30238-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-http/Config.in     | 1 +
 package/lua-http/lua-http.hash | 4 ++--
 package/lua-http/lua-http.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lua-http/Config.in b/package/lua-http/Config.in
index 8aaec69ef..cbf71563b 100644
--- a/package/lua-http/Config.in
+++ b/package/lua-http/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LUA_HTTP
 	depends on BR2_TOOLCHAIN_HAS_THREADS    # luaossl & lua-cqueues
 	select BR2_PACKAGE_LPEG # runtime
 	select BR2_PACKAGE_LUA_BASEXX # runtime
+	select BR2_PACKAGE_LUA_BINARYHEAP # runtime
 	select BR2_PACKAGE_LUA_COMPAT53 if !BR2_PACKAGE_LUA_5_3 # runtime
 	select BR2_PACKAGE_LUA_CQUEUES # runtime
 	select BR2_PACKAGE_LUA_FIFO # runtime
diff --git a/package/lua-http/lua-http.hash b/package/lua-http/lua-http.hash
index 3c7bcebd3..d41b494e9 100644
--- a/package/lua-http/lua-http.hash
+++ b/package/lua-http/lua-http.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 d68591eeeeb60c4187469eae89f5bad02d753a8c0adaa460d453b0734222645a  http-0.2-0.src.rock
-sha256 10650e71ba335c76955bbbec2b1f5b9d5655f2e0fdc6c7cecae5bd28a376302c  lua-http-0.2/LICENSE.md
+sha256 98318213be7b5ca60780c39f4736d5a3328631bc2c5dbfb8949b0db80e32746f  http-0.3-0.src.rock
+sha256 817cdf831c9d7cd1a2706b4b99dcc6f61a7a2345b7c9d39ed99e87d36338f4c8  lua-http-0.3/LICENSE.md
diff --git a/package/lua-http/lua-http.mk b/package/lua-http/lua-http.mk
index 9bc416b8a..00dcefa0d 100644
--- a/package/lua-http/lua-http.mk
+++ b/package/lua-http/lua-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_HTTP_VERSION_UPSTREAM = 0.2
+LUA_HTTP_VERSION_UPSTREAM = 0.3
 LUA_HTTP_VERSION = $(LUA_HTTP_VERSION_UPSTREAM)-0
 LUA_HTTP_NAME_UPSTREAM = http
 LUA_HTTP_SUBDIR = lua-http-$(LUA_HTTP_VERSION_UPSTREAM)
-- 
2.17.1
