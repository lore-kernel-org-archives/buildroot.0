From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  3 Dec 2014 17:53:48 -0300
Subject: [Buildroot] [PATCH] netatalk: bump to version 3.1.7
Message-ID: <1417640028-26379-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename patch to new standard and add hash file as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...1-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch} |  0
 package/netatalk/0002-no-acl.patch                        | 15 +++++++++++++++
 package/netatalk/netatalk.hash                            |  3 +++
 package/netatalk/netatalk.mk                              |  3 ++-
 4 files changed, 20 insertions(+), 1 deletion(-)
 rename package/netatalk/{netatalk-0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch => 0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch} (100%)
 create mode 100644 package/netatalk/0002-no-acl.patch
 create mode 100644 package/netatalk/netatalk.hash

diff --git a/package/netatalk/netatalk-0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch b/package/netatalk/0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
similarity index 100%
rename from package/netatalk/netatalk-0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
rename to package/netatalk/0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
diff --git a/package/netatalk/0002-no-acl.patch b/package/netatalk/0002-no-acl.patch
new file mode 100644
index 0000000..165141b
--- /dev/null
+++ b/package/netatalk/0002-no-acl.patch
@@ -0,0 +1,15 @@
+Fix builds without acl, from http://sourceforge.net/p/netatalk/bugs/574/
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura netatalk-3.1.7.orig/include/atalk/acl.h netatalk-3.1.7/include/atalk/acl.h
+--- netatalk-3.1.7.orig/include/atalk/acl.h	2014-12-03 17:34:49.895524464 -0300
++++ netatalk-3.1.7/include/atalk/acl.h	2014-12-03 17:34:58.735243283 -0300
+@@ -61,6 +61,7 @@
+ #else /* HAVE_ACLS=no */
+ 
+ #define O_NETATALK_ACL 0
++#define O_IGNORE 0
+ #define chmod_acl chmod
+ 
+ #endif /* HAVE_ACLS */
diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
new file mode 100644
index 0000000..e201ae6
--- /dev/null
+++ b/package/netatalk/netatalk.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.7/
+md5	831ec8bf9e084b64f965d16c528af299	netatalk-3.1.7.tar.bz2
+sha1	d4077a9496beae766ab1e4f28afa22e5c96514f0	netatalk-3.1.7.tar.bz2
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 6c1b640..725c33f 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.1.2
+NETATALK_VERSION = 3.1.7
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
+# For 0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
 NETATALK_AUTORECONF = YES
 NETATALK_CONFIG_SCRIPTS = netatalk-config
 NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error \
-- 
2.0.4
