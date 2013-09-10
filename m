From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Sep 2013 16:26:13 -0300
Subject: [Buildroot] [PATCH 04/11] libnfnetlink: add patch for uclinux tuple
In-Reply-To: <1378841180-23467-1-git-send-email-gustavo@zacarias.com.ar>
References: <1378841180-23467-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1378841180-23467-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnfnetlink/libnfnetlink-01-uclinux.patch | 26 ++++++++++++++++++++++
 package/libnfnetlink/libnfnetlink.mk               |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 package/libnfnetlink/libnfnetlink-01-uclinux.patch

diff --git a/package/libnfnetlink/libnfnetlink-01-uclinux.patch b/package/libnfnetlink/libnfnetlink-01-uclinux.patch
new file mode 100644
index 0000000..b152012
--- /dev/null
+++ b/package/libnfnetlink/libnfnetlink-01-uclinux.patch
@@ -0,0 +1,26 @@
+From 8e5a9d8f32c9646d01d8c84e979892dfd28a7f7c Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 10 Sep 2013 15:35:22 -0300
+Subject: [PATCH] configure: uclinux is also linux
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0926a1c..b979772 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -18,7 +18,7 @@ AC_DISABLE_STATIC
+ AM_PROG_LIBTOOL
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
diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
index 192fa8f..de5a9d8 100644
--- a/package/libnfnetlink/libnfnetlink.mk
+++ b/package/libnfnetlink/libnfnetlink.mk
@@ -7,6 +7,7 @@
 LIBNFNETLINK_VERSION = 1.0.1
 LIBNFNETLINK_SOURCE = libnfnetlink-$(LIBNFNETLINK_VERSION).tar.bz2
 LIBNFNETLINK_SITE = http://www.netfilter.org/projects/libnfnetlink/files
+LIBNFNETLINK_AUTORECONF = YES
 LIBNFNETLINK_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.8.1.5
