From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 23:00:27 +0100
Subject: [Buildroot] [git commit] rpcbind: convert to git patch
Message-ID: <20121114220322.81B8599FD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bff62a2a8783d9f65e05586ff61e7229c8cab357
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...rpcbind-0001-Remove-yellow-pages-support.patch} |   18 ++++++++++++++----
 1 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/package/rpcbind/rpcbind-01-no-yp-support.patch b/package/rpcbind/rpcbind-0001-Remove-yellow-pages-support.patch
similarity index 65%
rename from package/rpcbind/rpcbind-01-no-yp-support.patch
rename to package/rpcbind/rpcbind-0001-Remove-yellow-pages-support.patch
index e9e6c9d..eba17bf 100644
--- a/package/rpcbind/rpcbind-01-no-yp-support.patch
+++ b/package/rpcbind/rpcbind-0001-Remove-yellow-pages-support.patch
@@ -1,12 +1,19 @@
-Remove yellow pages support
+From 6b5db966ae01c0bdaa7b3b90d9332394af6ea0be Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 10 Nov 2012 22:03:43 +0100
+Subject: [PATCH] Remove yellow pages support
 
 This support requires yellow pages support in libtirpc, which isn't
 available. As most Buildroot users are most likely never going to need
 such feature, get rid of it.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Index: b/src/security.c
-===================================================================
+---
+ src/security.c |   18 ------------------
+ 1 file changed, 18 deletions(-)
+
+diff --git a/src/security.c b/src/security.c
+index 0edeac6..c6c977f 100644
 --- a/src/security.c
 +++ b/src/security.c
 @@ -23,9 +23,6 @@
@@ -19,7 +26,7 @@ Index: b/src/security.c
  
  #include "rpcbind.h"
  
-@@ -322,24 +319,9 @@
+@@ -322,24 +319,9 @@ check_callit(SVCXPRT *xprt, struct r_rmtcall_args *args, int versnum /*__unused*
  		    args->rmt_proc != MOUNTPROC_UMNT)
  			break;
  		goto deny;
@@ -44,3 +51,6 @@ Index: b/src/security.c
  	default:
  		break;
  	}
+-- 
+1.7.9.5
+
