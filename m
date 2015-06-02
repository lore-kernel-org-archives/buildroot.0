From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  2 Jun 2015 18:32:59 +0200
Subject: [Buildroot] [PATCH 5/5] luajit: clean fuzz/offset in patches
In-Reply-To: <1433262779-20797-1-git-send-email-francois.perrad@gadz.org>
References: <1433262779-20797-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1433262779-20797-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/0001-no-bin-symlink.patch | 4 ++--
 package/luajit/0002-install-inc.patch    | 4 ++--
 package/luajit/0003-install-so.patch     | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/luajit/0001-no-bin-symlink.patch b/package/luajit/0001-no-bin-symlink.patch
index 6391f39..37298dd 100644
--- a/package/luajit/0001-no-bin-symlink.patch
+++ b/package/luajit/0001-no-bin-symlink.patch
@@ -6,7 +6,7 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -42,8 +42,7 @@
+@@ -43,8 +43,7 @@
  INSTALL_MAN= $(INSTALL_SHARE)/man/man1
  INSTALL_PKGCONFIG= $(INSTALL_LIB)/pkgconfig
  
@@ -16,7 +16,7 @@ Index: b/Makefile
  INSTALL_ANAME= libluajit-$(ABIVER).a
  INSTALL_SONAME= libluajit-$(ABIVER).so.$(MAJVER).$(MINVER).$(RELVER)
  INSTALL_SOSHORT= libluajit-$(ABIVER).so
-@@ -57,7 +56,6 @@
+@@ -58,7 +57,6 @@
  INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
  INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
  INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
diff --git a/package/luajit/0002-install-inc.patch b/package/luajit/0002-install-inc.patch
index 1fd11b1..86b766d 100644
--- a/package/luajit/0002-install-inc.patch
+++ b/package/luajit/0002-install-inc.patch
@@ -6,9 +6,9 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -31,7 +31,7 @@ DPREFIX= $(DESTDIR)$(PREFIX)
+@@ -32,7 +32,7 @@
  INSTALL_BIN=   $(DPREFIX)/bin
- INSTALL_LIB=   $(DPREFIX)/lib
+ INSTALL_LIB=   $(DPREFIX)/$(MULTILIB)
  INSTALL_SHARE= $(DPREFIX)/share
 -INSTALL_INC=   $(DPREFIX)/include/luajit-$(MAJVER).$(MINVER)
 +INSTALL_INC=   $(DPREFIX)/include
diff --git a/package/luajit/0003-install-so.patch b/package/luajit/0003-install-so.patch
index 738ec07..5929595 100644
--- a/package/luajit/0003-install-so.patch
+++ b/package/luajit/0003-install-so.patch
@@ -11,12 +11,12 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -56,7 +56,7 @@
+@@ -55,7 +55,7 @@
  INSTALL_STATIC= $(INSTALL_LIB)/$(INSTALL_ANAME)
  INSTALL_DYN= $(INSTALL_LIB)/$(INSTALL_SONAME)
  INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
 -INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
 +INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT).$(MAJVER)
  INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
- INSTALL_TSYM= $(INSTALL_BIN)/$(INSTALL_TSYMNAME)
  INSTALL_PC= $(INSTALL_PKGCONFIG)/$(INSTALL_PCNAME)
+ 
-- 
2.1.4
