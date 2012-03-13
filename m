From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 13 Mar 2012 14:17:09 +0100
Subject: [Buildroot] [git commit] lua: fix non-shared library build
Message-ID: <20120313131727.2ABC090D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d77ff16b11bde9832914224794ca07312711d0bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building without BR2_PACKAGE_LUA_SHARED_LIBRARY failed because of
missing -ldl.  dl is used by lua's dynamic module loading.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lua/lua.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 30e95b4..aa0b4bf 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -10,9 +10,10 @@ LUA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
 	LUA_MYCFLAGS += -fPIC
-	LUA_MYLIBS += -ldl
 endif
 
+LUA_MYLIBS += -ldl
+
 ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
 	LUA_DEPENDENCIES = readline ncurses
 	LUA_MYLIBS += -lreadline -lhistory -lncurses
