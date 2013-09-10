From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Sep 2013 16:26:14 -0300
Subject: [Buildroot] [PATCH 05/11] libnetfilter_conntrack: add patch for
	uclinux tuple
In-Reply-To: <1378841180-23467-1-git-send-email-gustavo@zacarias.com.ar>
References: <1378841180-23467-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1378841180-23467-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../libnetfilter-conntrack-01-uclinux.patch        | 26 ++++++++++++++++++++++
 .../libnetfilter-conntrack.mk                      |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 package/libnetfilter_conntrack/libnetfilter-conntrack-01-uclinux.patch

diff --git a/package/libnetfilter_conntrack/libnetfilter-conntrack-01-uclinux.patch b/package/libnetfilter_conntrack/libnetfilter-conntrack-01-uclinux.patch
new file mode 100644
index 0000000..ef79a80
--- /dev/null
+++ b/package/libnetfilter_conntrack/libnetfilter-conntrack-01-uclinux.patch
@@ -0,0 +1,26 @@
+From bdf4afdcb68f62fcd05536b8cb68478d3ea31c68 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 10 Sep 2013 15:46:19 -0300
+Subject: [PATCH] configure: uclinux is also linux
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 12e1d16..1edfd66 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -19,7 +19,7 @@ AC_PROG_INSTALL
+ AC_PROG_LN_S
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
diff --git a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
index 1db30a1..fc3462d 100644
--- a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
@@ -9,6 +9,7 @@ LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_
 LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
 LIBNETFILTER_CONNTRACK_DEPENDENCIES = host-pkgconf libnfnetlink libmnl
+LIBNETFILTER_CONNTRACK_AUTORECONF = YES
 LIBNETFILTER_CONNTRACK_LICENSE = GPLv2+
 LIBNETFILTER_CONNTRACK_LICENSE_FILES = COPYING
 
-- 
1.8.1.5
