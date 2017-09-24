From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 12:51:08 +0200
Subject: [Buildroot] [git commit] orbit: mark as only with Lua 5.1
Message-ID: <20170924104359.32EEB80F7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c9c1240480a6cca361a47ee3baf07882be1b49a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/orbit/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/orbit/Config.in b/package/orbit/Config.in
index 2953499..c35c475 100644
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
