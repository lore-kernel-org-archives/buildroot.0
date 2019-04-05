From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  5 Apr 2019 18:03:21 +0200
Subject: [Buildroot] [PATCH] package/wsapi: update coxpcall dependency
Message-ID: <20190405160321.10629-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

since version 1.7, coxpcall is only required with Lua 5.1

see, https://github.com/keplerproject/wsapi/pull/41

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/wsapi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wsapi/Config.in b/package/wsapi/Config.in
index 60c029ddf..72e2dcd8e 100644
--- a/package/wsapi/Config.in
+++ b/package/wsapi/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_WSAPI
 	bool "wsapi"
-	select BR2_PACKAGE_COXPCALL # runtime
+	select BR2_PACKAGE_COXPCALL if BR2_PACKAGE_LUA_5_1 # runtime
 	select BR2_PACKAGE_LUAFILESYSTEM # runtime
 	select BR2_PACKAGE_RINGS # runtime
 	help
-- 
2.17.1
