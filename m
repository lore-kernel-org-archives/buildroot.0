From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Sep 2013 16:26:20 -0300
Subject: [Buildroot] [PATCH 11/11] nfacct: add patch for uclinux tuple
In-Reply-To: <1378841180-23467-1-git-send-email-gustavo@zacarias.com.ar>
References: <1378841180-23467-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1378841180-23467-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nfacct/nfacct-01-uclinux.patch | 26 ++++++++++++++++++++++++++
 package/nfacct/nfacct.mk               |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 package/nfacct/nfacct-01-uclinux.patch

diff --git a/package/nfacct/nfacct-01-uclinux.patch b/package/nfacct/nfacct-01-uclinux.patch
new file mode 100644
index 0000000..295a370
--- /dev/null
+++ b/package/nfacct/nfacct-01-uclinux.patch
@@ -0,0 +1,26 @@
+From da1a0c186232d1bca9c723bd47d11a6e3807ae29 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 10 Sep 2013 16:16:48 -0300
+Subject: [PATCH] configure: uclinux is also linux
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9679112..9a34bdc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -15,7 +15,7 @@ AC_PROG_INSTALL
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
diff --git a/package/nfacct/nfacct.mk b/package/nfacct/nfacct.mk
index 48f73e9..7e42160 100644
--- a/package/nfacct/nfacct.mk
+++ b/package/nfacct/nfacct.mk
@@ -9,6 +9,7 @@ NFACCT_SOURCE = nfacct-$(NFACCT_VERSION).tar.bz2
 NFACCT_SITE = http://www.netfilter.org/projects/nfacct/files
 NFACCT_DEPENDENCIES = host-pkgconf \
 	libnetfilter_acct
+NFACCT_AUTORECONF = YES
 NFACCT_LICENSE = GPLv2
 NFACCT_LICENSE_FILES = COPYING
 
-- 
1.8.1.5
