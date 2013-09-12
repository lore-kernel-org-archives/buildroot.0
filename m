From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 00:20:38 +0200
Subject: [Buildroot] [git commit] libnetfilter_cttimeout: add patch for
	uclinux tuple
Message-ID: <20130912223325.B4DC09B295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d61de618fca4a1586c18583c84f2aa139da8a32b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libnetfilter-cttimeout-01-uclinux.patch        |   26 ++++++++++++++++++++
 .../libnetfilter-cttimeout.mk                      |    1 +
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/libnetfilter_cttimeout/libnetfilter-cttimeout-01-uclinux.patch b/package/libnetfilter_cttimeout/libnetfilter-cttimeout-01-uclinux.patch
new file mode 100644
index 0000000..5d462d8
--- /dev/null
+++ b/package/libnetfilter_cttimeout/libnetfilter-cttimeout-01-uclinux.patch
@@ -0,0 +1,26 @@
+From d8d2ec14bc192f998afae2b71c69248e73518ddf Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 10 Sep 2013 16:09:14 -0300
+Subject: [PATCH] configure: uclinux is also linux
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d79e941..aeb6ad0 100644
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
diff --git a/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk b/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
index d751c3b..c1f1016 100644
--- a/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
+++ b/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
@@ -9,6 +9,7 @@ LIBNETFILTER_CTTIMEOUT_SOURCE = libnetfilter_cttimeout-$(LIBNETFILTER_CTTIMEOUT_
 LIBNETFILTER_CTTIMEOUT_SITE = http://www.netfilter.org/projects/libnetfilter_cttimeout/files
 LIBNETFILTER_CTTIMEOUT_INSTALL_STAGING = YES
 LIBNETFILTER_CTTIMEOUT_DEPENDENCIES = host-pkgconf libmnl
+LIBNETFILTER_CTTIMEOUT_AUTORECONF = YES
 LIBNETFILTER_CTTIMEOUT_LICENSE = GPLv2
 LIBNETFILTER_CTTIMEOUT_LICENSE_FILES = COPYING
 
