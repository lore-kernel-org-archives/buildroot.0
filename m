From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 24 Sep 2017 09:59:30 +0200
Subject: [Buildroot] [PATCH 7/9] orbit: mark as only with Lua 5.1
In-Reply-To: <20170924075932.5990-1-francois.perrad@gadz.org>
References: <20170924075932.5990-1-francois.perrad@gadz.org>
Message-ID: <20170924075932.5990-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/orbit/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/orbit/Config.in b/package/orbit/Config.in
index 2953499e7..c35c475e8 100644
--- a/package/orbit/Config.in
+++ b/package/orbit/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ORBIT
 	bool "orbit"
+	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
 	# These are runtime dependencies
 	select BR2_PACKAGE_LPEG
 	select BR2_PACKAGE_LUAFILESYSTEM
@@ -9,3 +10,7 @@ config BR2_PACKAGE_ORBIT
 	  Ruby frameworks such as Camping
 
 	  http://keplerproject.github.com/orbit
+
+comment "orbit needs a Lua 5.1 interpreter"
+	depends on !BR2_PACKAGE_LUA_5_1
+	depends on !BR2_PACKAGE_LUAJIT
-- 
2.11.0
