From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Jan 2014 17:17:33 -0300
Subject: [Buildroot] [PATCH] libnl: bump to version 3.2.24
Message-ID: <1391026653-12208-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...-some-address-families-when-not-available.patch | 63 ----------------------
 package/libnl/libnl.mk                             |  2 +-
 2 files changed, 1 insertion(+), 64 deletions(-)
 delete mode 100644 package/libnl/libnl-0001-do-not-compile-some-address-families-when-not-available.patch

diff --git a/package/libnl/libnl-0001-do-not-compile-some-address-families-when-not-available.patch b/package/libnl/libnl-0001-do-not-compile-some-address-families-when-not-available.patch
deleted file mode 100644
index 1255041..0000000
--- a/package/libnl/libnl-0001-do-not-compile-some-address-families-when-not-available.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 4f075a4fd1a1d6cbbe81f02f25063a8197fef746 Mon Sep 17 00:00:00 2001
-From: Cong Wang <xiyou.wangcong@gmail.com>
-Date: Fri, 8 Nov 2013 11:32:13 -0800
-Subject: [PATCH] do not compile some address families when not available
-
-This fixes the following error while compiling libnl3 on CentOS5:
-
-addr.c:1027: error: 'AF_RDS' undeclared here (not in a function)
-addr.c:1033: error: 'AF_CAN' undeclared here (not in a function)
-addr.c:1034: error: 'AF_TIPC' undeclared here (not in a function)
-addr.c:1036: error: 'AF_IUCV' undeclared here (not in a function)
-addr.c:1037: error: 'AF_RXRPC' undeclared here (not in a function)
-addr.c:1038: error: 'AF_ISDN' undeclared here (not in a function)
-addr.c:1039: error: 'AF_PHONET' undeclared here (not in a function)
-make[2]: *** [addr.lo] Error 1
-
-Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
-Signed-off-by: Thomas Graf <tgraf@suug.ch>
----
- lib/addr.c | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/lib/addr.c b/lib/addr.c
-index 86e7e58..54d2b1d 100644
---- a/lib/addr.c
-+++ b/lib/addr.c
-@@ -1024,19 +1024,33 @@ static const struct trans_tbl afs[] = {
- 	__ADD(AF_ASH,ash)
- 	__ADD(AF_ECONET,econet)
- 	__ADD(AF_ATMSVC,atmsvc)
-+#ifdef AF_RDS
- 	__ADD(AF_RDS,rds)
-+#endif
- 	__ADD(AF_SNA,sna)
- 	__ADD(AF_IRDA,irda)
- 	__ADD(AF_PPPOX,pppox)
- 	__ADD(AF_WANPIPE,wanpipe)
- 	__ADD(AF_LLC,llc)
-+#ifdef AF_CAN
- 	__ADD(AF_CAN,can)
-+#endif
-+#ifdef AF_TIPC
- 	__ADD(AF_TIPC,tipc)
-+#endif
- 	__ADD(AF_BLUETOOTH,bluetooth)
-+#ifdef AF_IUCV
- 	__ADD(AF_IUCV,iucv)
-+#endif
-+#ifdef AF_RXRPC
- 	__ADD(AF_RXRPC,rxrpc)
-+#endif
-+#ifdef AF_ISDN
- 	__ADD(AF_ISDN,isdn)
-+#endif
-+#ifdef AF_PHONET
- 	__ADD(AF_PHONET,phonet)
-+#endif
- #ifdef AF_IEEE802154
- 	__ADD(AF_IEEE802154,ieee802154)
- #endif
---
-1.8.3.2
-
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 7d8ba65..c6d9b3e 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.2.23
+LIBNL_VERSION = 3.2.24
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
 LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
-- 
1.8.3.2
