From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Sep 2014 13:00:17 +0200
Subject: [Buildroot] [git commit] radvd: bump to version 2.6
Message-ID: <20140905110202.982049D5A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5140af6d50ea74b7145fe9ede5d3e559fa5bea6b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/radvd/radvd-01-drop-check.patch |   15 +++++++++------
 package/radvd/radvd.mk                  |    2 +-
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
