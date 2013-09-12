From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 00:20:32 +0200
Subject: [Buildroot] [git commit] libnetfilter_cthelper: add patch for
	uclinux tuple
Message-ID: <20130912223325.AC58E9B295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87bd0ef26e37654ecc8b0c93cbd4bb60754d8c00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libnetfilter-cthelper-01-uclinux.patch         |   26 ++++++++++++++++++++
 .../libnetfilter_cthelper/libnetfilter-cthelper.mk |    1 +
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/libnetfilter_cthelper/libnetfilter-cthelper-01-uclinux.patch b/package/libnetfilter_cthelper/libnetfilter-cthelper-01-uclinux.patch
new file mode 100644
index 0000000..7a6ca70
--- /dev/null
+++ b/package/libnetfilter_cthelper/libnetfilter-cthelper-01-uclinux.patch
@@ -0,0 +1,26 @@
+From d028334281b218209412ec6e1dba56ca96320bd9 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 10 Sep 2013 16:08:29 -0300
+Subject: [PATCH] configure: uclinux is also linux
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d52b1ce..9389b70 100644
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
diff --git a/package/libnetfilter_cthelper/libnetfilter-cthelper.mk b/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
index 11f7e69..f3e892b 100644
--- a/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
+++ b/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
@@ -9,6 +9,7 @@ LIBNETFILTER_CTHELPER_SOURCE = libnetfilter_cthelper-$(LIBNETFILTER_CTHELPER_VER
 LIBNETFILTER_CTHELPER_SITE = http://www.netfilter.org/projects/libnetfilter_cthelper/files
 LIBNETFILTER_CTHELPER_INSTALL_STAGING = YES
 LIBNETFILTER_CTHELPER_DEPENDENCIES = host-pkgconf libmnl
+LIBNETFILTER_CTHELPER_AUTORECONF = YES
 LIBNETFILTER_CTHELPER_LICENSE = GPLv2
 LIBNETFILTER_CTHELPER_LICENSE_FILES = COPYING
 
