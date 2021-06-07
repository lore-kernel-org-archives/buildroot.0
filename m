From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:33 -0000
Subject: [Buildroot] [git commit] package/rpcbind: bump version to 1.3.2
Message-ID: <20210607144652.98A8781191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d13b292cec8166c4712cf4a0defbeee827ffaf78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased yellow pages patch.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../rpcbind/0001-Remove-yellow-pages-support.patch | 22 +++++++---------------
 package/rpcbind/rpcbind.mk                         |  2 +-
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/package/rpcbind/0001-Remove-yellow-pages-support.patch b/package/rpcbind/0001-Remove-yellow-pages-support.patch
index 314e32e9c8..9303d71c96 100644
--- a/package/rpcbind/0001-Remove-yellow-pages-support.patch
+++ b/package/rpcbind/0001-Remove-yellow-pages-support.patch
@@ -8,25 +8,17 @@ available. As most Buildroot users are most likely never going to need
 such feature, get rid of it.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[ rebased for 1.3.2 ]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 ---
- src/security.c | 18 ------------------
- 1 file changed, 18 deletions(-)
+ src/security.c | 15 ---------------
+ 1 file changed, 15 deletions(-)
 
 diff --git a/src/security.c b/src/security.c
-index 0c9453f..abc81bb 100644
+index 38967dd..0a70635 100644
 --- a/src/security.c
 +++ b/src/security.c
-@@ -24,9 +24,6 @@
- #include <rpcsvc/mount.h>
- #include <rpcsvc/rquota.h>
- #include <rpcsvc/nfs_prot.h>
--#include <rpcsvc/yp.h>
--#include <rpcsvc/ypclnt.h>
--#include <rpcsvc/yppasswd.h>
- #else
- # define MOUNTPROC_MNT	1
- # define MOUNTPROC_UMNT	3
-@@ -325,24 +322,9 @@ check_callit(SVCXPRT *xprt, struct r_rmtcall_args *args, int versnum /*__unused*
+@@ -318,24 +318,9 @@ check_callit(SVCXPRT *xprt, struct r_rmtcall_args *args, int versnum /*__unused*
  		    args->rmt_proc != MOUNTPROC_UMNT)
  			break;
  		goto deny;
@@ -52,5 +44,5 @@ index 0c9453f..abc81bb 100644
  		break;
  	}
 -- 
-2.4.5
+2.31.1
 
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 25916f0b56..fea2103794 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPCBIND_VERSION = 1.2.5
+RPCBIND_VERSION = 1.3.2
 RPCBIND_SITE = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
 RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3-Clause
