From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue, 28 Apr 2020 13:01:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/luajit: bump to version 2.2.0
Message-ID: <20200428110101.11716-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 2.2.0 introduces Lua 5.3 and extends Lua 5.2 extensions, see
https://github.com/moonjit/moonjit/releases/tag/2.2.0

Moonjit 2.2.0 replaced references to "LuaJIT" by "moonjit", which
introduces some changes in the Makefile and COPYRIGHT.

Also update the hash file to the new 2 spaces convention

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/luajit/0001-no-bin-symlink.patch | 6 ++++--
 package/luajit/0002-install-inc.patch    | 6 ++++--
 package/luajit/luajit.hash               | 4 ++--
 package/luajit/luajit.mk                 | 2 +-
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/luajit/0001-no-bin-symlink.patch b/package/luajit/0001-no-bin-symlink.patch
index d32ec5ad60..3d45d51bb3 100644
--- a/package/luajit/0001-no-bin-symlink.patch
+++ b/package/luajit/0001-no-bin-symlink.patch
@@ -1,6 +1,8 @@
 Do not use a symlink for the binary, simply name it luajit
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Titouan: update for 2.2.0]
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
 
 Index: b/Makefile
 ===================================================================
@@ -10,13 +12,13 @@ Index: b/Makefile
  INSTALL_MAN= $(INSTALL_SHARE)/man/man1
  INSTALL_PKGCONFIG= $(INSTALL_LIB)/pkgconfig
  
--INSTALL_TNAME= luajit-$(VERSION)
+-INSTALL_TNAME= moonjit-$(VERSION)
 -INSTALL_TSYMNAME= luajit
 +INSTALL_TNAME= luajit
  INSTALL_ANAME= libluajit-$(ABIVER).a
  INSTALL_SOSHORT1= libluajit-$(ABIVER).so
  INSTALL_SOSHORT2= libluajit-$(ABIVER).so.$(MAJVER)
-@@ -60,7 +59,6 @@
+@@ -60,7 +59,6 @@ INSTALL_DYN= $(INSTALL_LIB)/$(INSTALL_SONAME)
  INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT1)
  INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT2)
  INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
diff --git a/package/luajit/0002-install-inc.patch b/package/luajit/0002-install-inc.patch
index 5f6547fc3f..d3c9f9431f 100644
--- a/package/luajit/0002-install-inc.patch
+++ b/package/luajit/0002-install-inc.patch
@@ -1,6 +1,8 @@
 Install includes like lua's ones
 
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+[Titouan: update for 2.2.0]
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
 
 Index: b/Makefile
 ===================================================================
@@ -10,8 +12,8 @@ Index: b/Makefile
  INSTALL_BIN=   $(DPREFIX)/bin
  INSTALL_LIB=   $(DPREFIX)/$(MULTILIB)
  INSTALL_SHARE= $(DPREFIX)/share
--INSTALL_INC=   $(DPREFIX)/include/luajit-$(MAJVER).$(MINVER)
+-INSTALL_INC=   $(DPREFIX)/include/moonjit-$(MAJVER).$(MINVER)
 +INSTALL_INC=   $(DPREFIX)/include
  
- INSTALL_LJLIBD= $(INSTALL_SHARE)/luajit-$(VERSION)
+ INSTALL_LJLIBD= $(INSTALL_SHARE)/moonjit-$(VERSION)
  INSTALL_JITLIB= $(INSTALL_LJLIBD)/jit
diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 532ec0b294..9d41b85ef8 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 c3de8e29aa617fc594c043f57636ab9ad71af2b4a3a513932b05f5cdaa4320b2  luajit-2.1.2.tar.gz
+sha256  83deb2c880488dfe7dd8ebf09e3b1e7613ef4b8420de53de6f712f01aabca2b6  luajit-2.2.0.tar.gz
 
 # Locally calculated
-sha256 aa64a7706ded773011b933f4230d7b35ba662598197f82ac2c7bca62abdaa4d7  COPYRIGHT
+sha256  8773ee802066bf8559b5d101cc096c1aff363cf9c53a1117268fe90eb09a16fb  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 68e6af4f5e..569f9e446d 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 2.1.2
+LUAJIT_VERSION = 2.2.0
 LUAJIT_SITE = $(call github,moonjit,moonjit,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
-- 
2.25.3
