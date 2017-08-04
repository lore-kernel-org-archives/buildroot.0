From: Adam Duskett <aduskett@gmail.com>
Date: Thu,  3 Aug 2017 21:25:34 -0400
Subject: [Buildroot] [PATCH 1/1] netatalk: bump to version 3.1.9
Message-ID: <20170804012534.28582-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/netatalk/0002-no-acl.patch | 15 ---------------
 package/netatalk/netatalk.hash     |  6 +++---
 package/netatalk/netatalk.mk       |  2 +-
 3 files changed, 4 insertions(+), 19 deletions(-)
 delete mode 100644 package/netatalk/0002-no-acl.patch

diff --git a/package/netatalk/0002-no-acl.patch b/package/netatalk/0002-no-acl.patch
deleted file mode 100644
index 165141b47..000000000
--- a/package/netatalk/0002-no-acl.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Fix builds without acl, from http://sourceforge.net/p/netatalk/bugs/574/
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura netatalk-3.1.7.orig/include/atalk/acl.h netatalk-3.1.7/include/atalk/acl.h
---- netatalk-3.1.7.orig/include/atalk/acl.h	2014-12-03 17:34:49.895524464 -0300
-+++ netatalk-3.1.7/include/atalk/acl.h	2014-12-03 17:34:58.735243283 -0300
-@@ -61,6 +61,7 @@
- #else /* HAVE_ACLS=no */
- 
- #define O_NETATALK_ACL 0
-+#define O_IGNORE 0
- #define chmod_acl chmod
- 
- #endif /* HAVE_ACLS */
diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
index 955ffd401..1b974f5b6 100644
--- a/package/netatalk/netatalk.hash
+++ b/package/netatalk/netatalk.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.8/
-md5	9cab934ca32b8979f389da52d44c69c2	netatalk-3.1.8.tar.bz2
-sha1	00518461a311e6c17c95738ac214c8f06f863b4b	netatalk-3.1.8.tar.bz2
+# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.9/
+md5	d1d385ae6c3dc45eef4c923472f8fa5f	netatalk-3.1.9.tar.bz2
+sha1	ac746efc00e8cfbe5042a7835b27480bb83505cd	netatalk-3.1.9.tar.bz2
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 8e661a04a..e0085db74 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.1.8
+NETATALK_VERSION = 3.1.9
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 # For 0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
-- 
2.13.3
