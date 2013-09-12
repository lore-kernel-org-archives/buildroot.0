From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 00:19:37 +0200
Subject: [Buildroot] [git commit] libnetfilter_conntrack: add patch for
	uclinux tuple
Message-ID: <20130912223325.90AA89B295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=938ea47b28e78b20829955929c2c1ed185c908ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libnetfilter-conntrack-01-uclinux.patch        |   26 ++++++++++++++++++++
 .../libnetfilter-conntrack.mk                      |    1 +
 2 files changed, 27 insertions(+), 0 deletions(-)

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
 
