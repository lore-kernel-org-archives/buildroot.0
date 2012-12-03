From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  3 Dec 2012 17:12:12 +0100
Subject: [Buildroot] [PATCH 2/4] luajit: bump to version 2.0.0
In-Reply-To: <1354551135-30056-1-git-send-email-francois.perrad@gadz.org>
References: <1354551135-30056-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1354551135-30056-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit-01-root-path.patch      |    2 +-
 package/luajit/luajit-04-no-bin-symlink.patch |   18 ++----------------
 package/luajit/luajit.mk                      |    2 +-
 3 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/package/luajit/luajit-01-root-path.patch b/package/luajit/luajit-01-root-path.patch
index 80ad1e9..cc2f04f 100644
--- a/package/luajit/luajit-01-root-path.patch
+++ b/package/luajit/luajit-01-root-path.patch
@@ -18,5 +18,5 @@ Index: b/src/luaconf.h
 +#define LUA_LDIR	LUA_ROOT "share/lua/"
 +#define LUA_CDIR	LUA_ROOT "lib/lua/"
  #ifdef LUA_XROOT
- #define LUA_JDIR	LUA_XROOT "share/luajit-2.0.0-beta11/"
+ #define LUA_JDIR	LUA_XROOT "share/luajit-2.0.0/"
  #define LUA_XPATH \
diff --git a/package/luajit/luajit-04-no-bin-symlink.patch b/package/luajit/luajit-04-no-bin-symlink.patch
index 91a470a..0de3162 100644
--- a/package/luajit/luajit-04-no-bin-symlink.patch
+++ b/package/luajit/luajit-04-no-bin-symlink.patch
@@ -6,7 +6,7 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -43,8 +43,7 @@
+@@ -42,8 +42,7 @@
  INSTALL_MAN= $(INSTALL_SHARE)/man/man1
  INSTALL_PKGCONFIG= $(INSTALL_LIB)/pkgconfig
  
@@ -16,7 +16,7 @@ Index: b/Makefile
  INSTALL_ANAME= libluajit-$(ABIVER).a
  INSTALL_SONAME= libluajit-$(ABIVER).so.$(MAJVER).$(MINVER).$(RELVER)
  INSTALL_SOSHORT= libluajit-$(ABIVER).so
-@@ -58,7 +57,6 @@
+@@ -57,7 +56,6 @@
  INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
  INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
  INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
@@ -24,17 +24,3 @@ Index: b/Makefile
  INSTALL_PC= $(INSTALL_PKGCONFIG)/$(INSTALL_PCNAME)
  
  INSTALL_DIRS= $(INSTALL_BIN) $(INSTALL_LIB) $(INSTALL_INC) $(INSTALL_MAN) \
-@@ -120,13 +118,6 @@
- 	  $(RM) $(FILE_PC).tmp
- 	cd src && $(INSTALL_F) $(FILES_INC) $(INSTALL_INC)
- 	cd src/jit && $(INSTALL_F) $(FILES_JITLIB) $(INSTALL_JITLIB)
--	@echo "==== Successfully installed LuaJIT $(VERSION) to $(PREFIX) ===="
--	@echo ""
--	@echo "Note: the beta releases deliberately do NOT install a symlink for luajit"
--	@echo "You can do this now by running this command (with sudo):"
--	@echo ""
--	@echo "  $(SYMLINK) $(INSTALL_TNAME) $(INSTALL_TSYM)"
--	@echo ""
- 
- uninstall:
- 	@echo "==== Uninstalling LuaJIT $(VERSION) from $(PREFIX) ===="
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 2583f92..844122e 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LUAJIT_VERSION = 2.0.0-beta11
+LUAJIT_VERSION = 2.0.0
 LUAJIT_SOURCE  = LuaJIT-$(LUAJIT_VERSION).tar.gz
 LUAJIT_SITE    = http://luajit.org/download
 LUAJIT_LICENSE = MIT
-- 
1.7.9.5
