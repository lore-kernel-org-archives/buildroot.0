From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 22:34:59 +0200
Subject: [Buildroot] [git commit] luajit: bump to version 2.0.5
Message-ID: <20170502203512.6CF5A82868@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62bf7468a4043bf2e205ebd582f551c66c1c66d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajit/0001-no-bin-symlink.patch | 10 +++++-----
 package/luajit/0003-install-so.patch     | 22 ----------------------
 package/luajit/luajit.hash               |  2 +-
 package/luajit/luajit.mk                 |  2 +-
 4 files changed, 7 insertions(+), 29 deletions(-)

diff --git a/package/luajit/0001-no-bin-symlink.patch b/package/luajit/0001-no-bin-symlink.patch
index 37298dd..dd1dfd8 100644
--- a/package/luajit/0001-no-bin-symlink.patch
+++ b/package/luajit/0001-no-bin-symlink.patch
@@ -14,11 +14,11 @@ Index: b/Makefile
 -INSTALL_TSYMNAME= luajit
 +INSTALL_TNAME= luajit
  INSTALL_ANAME= libluajit-$(ABIVER).a
- INSTALL_SONAME= libluajit-$(ABIVER).so.$(MAJVER).$(MINVER).$(RELVER)
- INSTALL_SOSHORT= libluajit-$(ABIVER).so
-@@ -58,7 +57,6 @@
- INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
- INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
+ INSTALL_SOSHORT1= libluajit-$(ABIVER).so
+ INSTALL_SOSHORT2= libluajit-$(ABIVER).so.$(MAJVER)
+@@ -59,7 +58,6 @@
+ INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT1)
+ INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT2)
  INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
 -INSTALL_TSYM= $(INSTALL_BIN)/$(INSTALL_TSYMNAME)
  INSTALL_PC= $(INSTALL_PKGCONFIG)/$(INSTALL_PCNAME)
diff --git a/package/luajit/0003-install-so.patch b/package/luajit/0003-install-so.patch
deleted file mode 100644
index 5929595..0000000
--- a/package/luajit/0003-install-so.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-fix the following runtime error :
-    luajit: error while loading shared libraries: libluajit-5.1.so.2: cannot open shared object file: No such file or directory
-
-by creating two symbolic links:
-    libluajit-5.1.so -> libluajit-5.1.so.2.0.3
-    libluajit-5.1.so.2 -> libluajit-5.1.so.2.0.3
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -55,7 +55,7 @@
- INSTALL_STATIC= $(INSTALL_LIB)/$(INSTALL_ANAME)
- INSTALL_DYN= $(INSTALL_LIB)/$(INSTALL_SONAME)
- INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
--INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
-+INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT).$(MAJVER)
- INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
- INSTALL_PC= $(INSTALL_PKGCONFIG)/$(INSTALL_PCNAME)
- 
diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 086bef0..2081d12 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,2 +1,2 @@
 # Hashes from: http://luajit.org/download.html
-md5 dd9c38307f2223a504cbfb96e477eca0    LuaJIT-2.0.4.tar.gz
+md5 48353202cbcacab84ee41a5a70ea0a2c    LuaJIT-2.0.5.tar.gz
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index d3ef3b7..300e6db 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 2.0.4
+LUAJIT_VERSION = 2.0.5
 LUAJIT_SOURCE = LuaJIT-$(LUAJIT_VERSION).tar.gz
 LUAJIT_SITE = http://luajit.org/download
 LUAJIT_LICENSE = MIT
