From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 21:00:08 +0100
Subject: [Buildroot] [git commit] ulogd: bump to version 2.0.2
Message-ID: <20130304200438.BA31A9AEAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=530ba040554b2964ddc2078decac3df7c1235d04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ulogd/ulogd-fix-libpcap-conditional.patch |   29 ---------------------
 package/ulogd/ulogd.mk                            |    2 +-
 2 files changed, 1 insertions(+), 30 deletions(-)

diff --git a/package/ulogd/ulogd-fix-libpcap-conditional.patch b/package/ulogd/ulogd-fix-libpcap-conditional.patch
deleted file mode 100644
index 3d73d37..0000000
--- a/package/ulogd/ulogd-fix-libpcap-conditional.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 08387386821f356834bac14c7c5ea7296fb0f428 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 9 Oct 2012 16:23:12 -0300
-Subject: [PATCH] autoconf/ulogd: fix broken libpcap AM_CONDITIONAL
-
-The AM_CONDITIONAL lacks the opening bracket, hence it always evaluates
-as true, even if there's no libpcap found thus causing build breakage.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 10b6e1f..57c596c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -21,7 +21,7 @@ AC_SEARCH_LIBS([dlopen], [dl], [libdl_LIBS="$LIBS"; LIBS=""])
- AC_SUBST([libdl_LIBS])
- AC_SEARCH_LIBS([pcap_close], [pcap], [libpcap_LIBS="-lpcap"; LIBS=""])
- AC_SUBST([libpcap_LIBS])
--AM_CONDITIONAL([HAVE_PCAP], test -n "$libpcap_LIBS"])
-+AM_CONDITIONAL([HAVE_PCAP],[test -n "$libpcap_LIBS"])
- 
- dnl Checks for header files.
- AC_HEADER_DIRENT
--- 
-1.7.8.6
-
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 34d8665..9425ac5 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ULOGD_VERSION = 2.0.1
+ULOGD_VERSION = 2.0.2
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
 ULOGD_CONF_OPT = --with-dbi=no --with-pgsql=no
