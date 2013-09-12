From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 00:20:46 +0200
Subject: [Buildroot] [git commit] libnetfilter_queue: add patch for uclinux
	tuple
Message-ID: <20130912223325.C43229B295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bae789fe7b118da33994ceddefbb1d70196de741
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libnetfilter-queue-01-uclinux.patch            |   26 ++++++++++++++++++++
 package/libnetfilter_queue/libnetfilter-queue.mk   |    1 +
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/libnetfilter_queue/libnetfilter-queue-01-uclinux.patch b/package/libnetfilter_queue/libnetfilter-queue-01-uclinux.patch
new file mode 100644
index 0000000..21895d9
--- /dev/null
+++ b/package/libnetfilter_queue/libnetfilter-queue-01-uclinux.patch
@@ -0,0 +1,26 @@
+From 311b60655761f6f3c4fe44cf6eff63427283f25e Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 10 Sep 2013 16:13:58 -0300
+Subject: [PATCH] configure: uclinux is also linux
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 07747a6..289868f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -21,7 +21,7 @@ AC_PROG_INSTALL
+ CHECK_GCC_FVISIBILITY
+ 
+ case "$host" in
+-*-*-linux*) ;;
++*-*-linux* | *-*-uclinux*) ;;
+ *) AC_MSG_ERROR([Linux only, dude!]);;
+ esac
+ 
+-- 
+1.8.1.5
+
diff --git a/package/libnetfilter_queue/libnetfilter-queue.mk b/package/libnetfilter_queue/libnetfilter-queue.mk
index 7cd2bb7..66b102f 100644
--- a/package/libnetfilter_queue/libnetfilter-queue.mk
+++ b/package/libnetfilter_queue/libnetfilter-queue.mk
@@ -9,6 +9,7 @@ LIBNETFILTER_QUEUE_SOURCE = libnetfilter_queue-$(LIBNETFILTER_QUEUE_VERSION).tar
 LIBNETFILTER_QUEUE_SITE = http://www.netfilter.org/projects/libnetfilter_queue/files
 LIBNETFILTER_QUEUE_INSTALL_STAGING = YES
 LIBNETFILTER_QUEUE_DEPENDENCIES = host-pkgconf libnfnetlink libmnl
+LIBNETFILTER_QUEUE_AUTORECONF = YES
 LIBNETFILTER_QUEUE_LICENSE = GPLv2
 LIBNETFILTER_QUEUE_LICENSE_FILES = COPYING
 
