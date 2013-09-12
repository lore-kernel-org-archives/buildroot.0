From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 00:18:20 +0200
Subject: [Buildroot] [git commit] libmnl: add patch for uclinux tuple
Message-ID: <20130912223325.69A309B295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad434b3fe73af911d4eb38d71c816e3ca2195751
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmnl/libmnl-01-uclinux.patch |   26 ++++++++++++++++++++++++++
 package/libmnl/libmnl.mk               |    1 +
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/libmnl/libmnl-01-uclinux.patch b/package/libmnl/libmnl-01-uclinux.patch
new file mode 100644
index 0000000..e8f97c6
--- /dev/null
+++ b/package/libmnl/libmnl-01-uclinux.patch
@@ -0,0 +1,26 @@
+From ae2acfa7d287e3ffc0bb66091059b86f62775bd5 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 10 Sep 2013 15:24:47 -0300
+Subject: [PATCH] configure: uclinux is also linux
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index dcd3cf8..313a015 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -17,7 +17,7 @@ AC_DISABLE_STATIC
+ LT_INIT
+ CHECK_GCC_FVISIBILITY
+ case "$host" in
+-*-*-linux*) ;;
++*-*-linux* | *-*-uclinux*) ;;
+ *) AC_MSG_ERROR([Linux only, dude!]);;
+ esac
+ 
+-- 
+1.8.1.5
+
diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index c60c60c..b16c534 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -8,6 +8,7 @@ LIBMNL_VERSION = 1.0.3
 LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
 LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
 LIBMNL_INSTALL_STAGING = YES
+LIBMNL_AUTORECONF = YES
 LIBMNL_LICENSE = LGPLv2.1+
 LIBMNL_LICENSE_FILES = COPYING
 
