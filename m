From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Jun 2016 22:11:20 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/python: bump version to 2.7.12
Message-ID: <1467231081-11051-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased 011-remove-python-symlink.patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: fixed typo in hash file (Baruch)

 package/python/011-remove-python-symlink.patch | 12 +++++++-----
 package/python/python.hash                     |  6 +++---
 package/python/python.mk                       |  2 +-
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/python/011-remove-python-symlink.patch b/package/python/011-remove-python-symlink.patch
index b0548c3..fed46f0 100644
--- a/package/python/011-remove-python-symlink.patch
+++ b/package/python/011-remove-python-symlink.patch
@@ -5,20 +5,22 @@ Buildroot needs to control to what python interpreter (python2 or python3) the
 python symlink points to.
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(rebased against version 2.7.12)
 
 Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -890,17 +890,10 @@
- #  $(PYTHON) -> python2 -> python$(VERSION))
- # Also create equivalent chains for other installed files
- bininstall:	altbininstall
+@@ -974,17 +974,11 @@
+ 		echo "Creating directory $(LIBPC)"; \
+ 		$(INSTALL) -d -m $(DIRMODE) $(DESTDIR)$(LIBPC); \
+ 	fi
 -	-if test -f $(DESTDIR)$(BINDIR)/$(PYTHON) -o -h $(DESTDIR)$(BINDIR)/$(PYTHON); \
 -	then rm -f $(DESTDIR)$(BINDIR)/$(PYTHON); \
 -	else true; \
 -	fi
--	(cd $(DESTDIR)$(BINDIR); $(LN) -s python2$(EXE) $(PYTHON))
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s python2$(EXE) $(PYTHON))
  	-rm -f $(DESTDIR)$(BINDIR)/python2$(EXE)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)$(EXE) python2$(EXE))
  	-rm -f $(DESTDIR)$(BINDIR)/python2-config
diff --git a/package/python/python.hash b/package/python/python.hash
index d1cf1ba..b7d0036 100644
--- a/package/python/python.hash
+++ b/package/python/python.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-2711/
-md5	1dbcc848b4cd8399a8199d000f9f823c	Python-2.7.11.tar.xz
+# From https://www.python.org/downloads/release/python-2712/
+md5	57dffcee9cee8bb2ab5f82af1d8e9a69	Python-2.7.12.tar.xz
 # Locally calculated
-sha256	962b4c45af50124ea61f11a30deb4342fc0bc21126790fa1d7f6c79809413f46  Python-2.7.11.tar.xz
+sha256 d7837121dd5652a05fef807c361909d255d173280c4e1a4ded94d73d80a1f978  Python-2.7.12.tar.xz
diff --git a/package/python/python.mk b/package/python/python.mk
index 913dc2c..6117a6d 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).11
+PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).12
 PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE = http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE = Python software foundation license v2, others
-- 
2.8.1
