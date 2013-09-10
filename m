From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Sep 2013 16:26:19 -0300
Subject: [Buildroot] [PATCH 10/11] libnetfilter_queue: add patch for uclinux
	tuple
In-Reply-To: <1378841180-23467-1-git-send-email-gustavo@zacarias.com.ar>
References: <1378841180-23467-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1378841180-23467-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../libnetfilter-queue-01-uclinux.patch            | 26 ++++++++++++++++++++++
 package/libnetfilter_queue/libnetfilter-queue.mk   |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 package/libnetfilter_queue/libnetfilter-queue-01-uclinux.patch

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
 
-- 
1.8.1.5
