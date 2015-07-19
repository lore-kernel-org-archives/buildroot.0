From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
Date: Sun, 19 Jul 2015 23:02:38 +0200
Subject: [Buildroot] [PATCH 1/2] rpcbind: bump version 0.2.3
Message-ID: <1437339759-21456-1-git-send-email-aurelien@chabot.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Refreshed patch:
	0001-Remove-yellow-pages-support.patch

Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
---
 package/rpcbind/0001-Remove-yellow-pages-support.patch | 16 ++++++++--------
 package/rpcbind/rpcbind.hash                           |  2 +-
 package/rpcbind/rpcbind.mk                             |  3 ++-
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/package/rpcbind/0001-Remove-yellow-pages-support.patch b/package/rpcbind/0001-Remove-yellow-pages-support.patch
index e35828f..314e32e 100644
--- a/package/rpcbind/0001-Remove-yellow-pages-support.patch
+++ b/package/rpcbind/0001-Remove-yellow-pages-support.patch
@@ -1,4 +1,4 @@
-From 249e25c5cc675c212ca4e4a3342bff8f59285b1a Mon Sep 17 00:00:00 2001
+From 226b9c57ff403b407dbf1ff8a615da455a4cbd23 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 10 Nov 2012 22:03:43 +0100
 Subject: [PATCH] Remove yellow pages support
@@ -13,20 +13,20 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 18 deletions(-)
 
 diff --git a/src/security.c b/src/security.c
-index d272f74..8d5863c 100644
+index 0c9453f..abc81bb 100644
 --- a/src/security.c
 +++ b/src/security.c
-@@ -23,9 +23,6 @@
+@@ -24,9 +24,6 @@
  #include <rpcsvc/mount.h>
  #include <rpcsvc/rquota.h>
  #include <rpcsvc/nfs_prot.h>
 -#include <rpcsvc/yp.h>
 -#include <rpcsvc/ypclnt.h>
 -#include <rpcsvc/yppasswd.h>
- 
- #include "rpcbind.h"
- 
-@@ -308,24 +305,9 @@ check_callit(SVCXPRT *xprt, struct r_rmtcall_args *args, int versnum /*__unused*
+ #else
+ # define MOUNTPROC_MNT	1
+ # define MOUNTPROC_UMNT	3
+@@ -325,24 +322,9 @@ check_callit(SVCXPRT *xprt, struct r_rmtcall_args *args, int versnum /*__unused*
  		    args->rmt_proc != MOUNTPROC_UMNT)
  			break;
  		goto deny;
@@ -52,5 +52,5 @@ index d272f74..8d5863c 100644
  		break;
  	}
 -- 
-2.0.0
+2.4.5
 
diff --git a/package/rpcbind/rpcbind.hash b/package/rpcbind/rpcbind.hash
index 830ef55..5c9ecd1 100644
--- a/package/rpcbind/rpcbind.hash
+++ b/package/rpcbind/rpcbind.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  da169ff877a5a07581fad50a9a808ac6e96f0c277a3df49a7ef005778428496e  rpcbind-0.2.1.tar.bz2
+sha256 9897823a9d820ea011d9ea02054d5ab99469b9ca5346265fee380713c8fed27b  rpcbind-0.2.3.tar.bz2
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index b85d88e..d879de1 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPCBIND_VERSION = 0.2.1
+RPCBIND_VERSION = 0.2.3
 RPCBIND_SITE = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
 RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3c
@@ -14,6 +14,7 @@ RPCBIND_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
 RPCBIND_DEPENDENCIES += libtirpc host-pkgconf
 RPCBIND_CONF_OPTS += --with-rpcuser=root
+RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=no
 
 define RPCBIND_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
-- 
2.4.6
