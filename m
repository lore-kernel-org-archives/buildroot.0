From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Sep 2014 17:50:39 -0300
Subject: [Buildroot] [PATCH 4/7] radvd: bump to version 2.6
In-Reply-To: <1409863842-24226-1-git-send-email-gustavo@zacarias.com.ar>
References: <1409863842-24226-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1409863842-24226-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/radvd/radvd-01-drop-check.patch | 15 +++++++++------
 package/radvd/radvd.mk                  |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/radvd/radvd-01-drop-check.patch b/package/radvd/radvd-01-drop-check.patch
index 2b5d008..670d5b2 100644
--- a/package/radvd/radvd-01-drop-check.patch
+++ b/package/radvd/radvd-01-drop-check.patch
@@ -2,14 +2,17 @@ Drop check requirement, we don't do unit tests.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura radvd-2.1.orig/configure.ac radvd-2.1/configure.ac
---- radvd-2.1.orig/configure.ac	2014-07-22 08:23:12.642260069 -0300
-+++ radvd-2.1/configure.ac	2014-07-22 08:23:21.270552628 -0300
-@@ -49,7 +49,6 @@
- dnl Determine CC and preset CFLAGS
+diff -Nura radvd-2.6.orig/configure.ac radvd-2.6/configure.ac
+--- radvd-2.6.orig/configure.ac	2014-09-04 15:54:41.735038724 -0300
++++ radvd-2.6/configure.ac	2014-09-04 15:54:53.106431815 -0300
+@@ -50,10 +50,6 @@
  AC_PROG_CC_C99
  AC_PROG_RANLIB
--PKG_CHECK_MODULES([CHECK], [check >= 0.9.4])
  
+-if test "$arch" = "linux" ; then
+-PKG_CHECK_MODULES([CHECK], [check >= 0.9.4])
+-fi
+-
  dnl Determine of netlink is available
  AC_MSG_CHECKING(netlink)
+ AC_TRY_COMPILE([
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 6f83aff..4ce14da 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RADVD_VERSION = 2.5
+RADVD_VERSION = 2.6
 RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
-- 
1.8.5.5
