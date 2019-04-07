From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Apr 2019 10:38:24 +0200
Subject: [Buildroot] [git commit] package/wsapi: update coxpcall dependency
Message-ID: <20190407084214.5378683F9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7b8a7f3ac2c32d6fde841795ac09b7b9f296219
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

since version 1.7, coxpcall is only required with Lua 5.1

see, https://github.com/keplerproject/wsapi/pull/41

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wsapi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wsapi/Config.in b/package/wsapi/Config.in
index 60c029ddf6..72e2dcd8e0 100644
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
