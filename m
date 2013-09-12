From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 00:19:21 +0200
Subject: [Buildroot] [git commit] libnetfilter_acct: add patch for uclinux
	tuple
Message-ID: <20130912223325.7D0279B295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25bb35ef10385c5c84c66d413cfda25aa9e3eb01
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libnetfilter-acct-01-uclinux.patch             |   26 ++++++++++++++++++++
 package/libnetfilter_acct/libnetfilter-acct.mk     |    1 +
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/libnetfilter_acct/libnetfilter-acct-01-uclinux.patch b/package/libnetfilter_acct/libnetfilter-acct-01-uclinux.patch
new file mode 100644
index 0000000..070f02c
--- /dev/null
+++ b/package/libnetfilter_acct/libnetfilter-acct-01-uclinux.patch
@@ -0,0 +1,26 @@
+From bfcaf00a8c972e2c10412d917f08626eb05079c7 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 10 Sep 2013 15:32:03 -0300
+Subject: [PATCH] configure: uclinux is also linux
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index ad1bef8..24a7bb9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,7 +22,7 @@ AC_DISABLE_STATIC
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
diff --git a/package/libnetfilter_acct/libnetfilter-acct.mk b/package/libnetfilter_acct/libnetfilter-acct.mk
index c89c5ed..615d46e 100644
--- a/package/libnetfilter_acct/libnetfilter-acct.mk
+++ b/package/libnetfilter_acct/libnetfilter-acct.mk
@@ -9,6 +9,7 @@ LIBNETFILTER_ACCT_SOURCE = libnetfilter_acct-$(LIBNETFILTER_ACCT_VERSION).tar.bz
 LIBNETFILTER_ACCT_SITE = http://www.netfilter.org/projects/libnetfilter_acct/files
 LIBNETFILTER_ACCT_INSTALL_STAGING = YES
 LIBNETFILTER_ACCT_DEPENDENCIES = host-pkgconf libmnl
+LIBNETFILTER_ACCT_AUTORECONF = YES
 LIBNETFILTER_ACCT_LICENSE = LGPLv2.1+
 LIBNETFILTER_ACCT_LICENSE_FILES = COPYING
 
