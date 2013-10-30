From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Wed, 30 Oct 2013 22:20:08 +0200
Subject: [Buildroot] [PATCH 1/5] liburcu: bump to version 0.8.0
Message-ID: <1383164412-20657-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also added a patch to keep liburcu from trying to build examples in doc directory,
which breaks cross-compilation when enabled.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 .../liburcu/0001-Removed-Examples-from-doc.patch   | 22 ++++++++++++++++++++++
 package/liburcu/liburcu.mk                         |  3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 package/liburcu/0001-Removed-Examples-from-doc.patch

diff --git a/package/liburcu/0001-Removed-Examples-from-doc.patch b/package/liburcu/0001-Removed-Examples-from-doc.patch
new file mode 100644
index 0000000..7df05b8
--- /dev/null
+++ b/package/liburcu/0001-Removed-Examples-from-doc.patch
@@ -0,0 +1,22 @@
+From 3f8b92364d39df34b327f50e93ab9350a0adb981 Mon Sep 17 00:00:00 2001
+From: Olivier Schonken <olivier.schonken@gmail.com>
+Date: Wed, 9 Oct 2013 16:36:03 +0200
+Subject: [PATCH] Removed Examples subdir - breaks crosscompilation
+
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
+---
+ doc/Makefile.am |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index d98f16b..821cc19 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -1,3 +1,3 @@
+-SUBDIRS = examples
++SUBDIRS = 
+ 
+ dist_doc_DATA = rcu-api.txt cds-api.txt uatomic-api.txt
+-- 
+1.7.9.5
+
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index a586382..fa14a14 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.7.7
+LIBURCU_VERSION = 0.8.0
 LIBURCU_SITE    = http://lttng.org/files/urcu/
 LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE
 LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt LICENSE
 
 LIBURCU_INSTALL_STAGING = YES
+LIBURCU_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
1.8.3.2
