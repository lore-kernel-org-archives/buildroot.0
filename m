From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 00:19:52 +0200
Subject: [Buildroot] [git commit] libnetfilter_log: add patch for uclinux
	tuple
Message-ID: <20130912223325.99EE89B295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd8d9a3c670955e85e9ed3481cfe24368e594d2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libnetfilter-log-01-uclinux.patch              |   26 ++++++++++++++++++++
 package/libnetfilter_log/libnetfilter-log.mk       |    1 +
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/libnetfilter_log/libnetfilter-log-01-uclinux.patch b/package/libnetfilter_log/libnetfilter-log-01-uclinux.patch
new file mode 100644
index 0000000..75d4a1e
--- /dev/null
+++ b/package/libnetfilter_log/libnetfilter-log-01-uclinux.patch
@@ -0,0 +1,26 @@
+From e36a2377e7ec50f6f675eb41f79edcda6ddebe5c Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 10 Sep 2013 15:48:50 -0300
+Subject: [PATCH] configure: uclinux is also linux
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e6e1317..189a753 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -20,7 +20,7 @@ AC_PROG_INSTALL
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
diff --git a/package/libnetfilter_log/libnetfilter-log.mk b/package/libnetfilter_log/libnetfilter-log.mk
index 74a32d7..8a2c513 100644
--- a/package/libnetfilter_log/libnetfilter-log.mk
+++ b/package/libnetfilter_log/libnetfilter-log.mk
@@ -9,6 +9,7 @@ LIBNETFILTER_LOG_SOURCE = libnetfilter_log-$(LIBNETFILTER_LOG_VERSION).tar.bz2
 LIBNETFILTER_LOG_SITE = http://www.netfilter.org/projects/libnetfilter_log/files
 LIBNETFILTER_LOG_INSTALL_STAGING = YES
 LIBNETFILTER_LOG_DEPENDENCIES = host-pkgconf libnfnetlink
+LIBNETFILTER_LOG_AUTORECONF = YES
 LIBNETFILTER_LOG_LICENSE = GPLv2
 LIBNETFILTER_LOG_LICENSE_FILES = COPYING
 
