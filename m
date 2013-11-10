From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 00:53:35 +0100
Subject: [Buildroot] [git commit] ipset: bump to version 6.20.1
Message-ID: <20131111001017.DB9FA9A131@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26baab06ad46ec51aa6e965fc6a0af5d2ddaabe1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipset/ipset-01-uclinux.patch |   26 --------------------------
 package/ipset/ipset.mk               |    2 +-
 2 files changed, 1 insertions(+), 27 deletions(-)

diff --git a/package/ipset/ipset-01-uclinux.patch b/package/ipset/ipset-01-uclinux.patch
deleted file mode 100644
index db8e3fe..0000000
--- a/package/ipset/ipset-01-uclinux.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 8ec2a85a29817f5aa3f6fb680753d331e2af3591 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 10 Sep 2013 15:28:49 -0300
-Subject: [PATCH] configure: uclinux is also linux
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6b64576..6d06ef5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -14,7 +14,7 @@ LTDL_INIT([nonrecursive])
- 
- dnl Shortcut: Linux supported alone
- case "$host" in
--*-*-linux*) ;;
-+*-*-linux* | *-*-uclinux*) ;;
- *) AC_MSG_ERROR([Linux systems supported exclusively!]);;
- esac
- 
--- 
-1.8.1.5
-
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index d55d81d..b075a53 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 6.19
+IPSET_VERSION = 6.20.1
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
