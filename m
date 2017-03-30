From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Mar 2017 23:11:43 +0200
Subject: [Buildroot] [PATCH] package/coreutils: remove legacy comment
Message-ID: <20170330211143.6645-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This comment was added in 2007 (e4c6340a: cleanup and fixes), back when
removing a package was (seemingly) supported.

This ability was lost when coreutils was converted to autotarget in 2010
(386183f: coreutils: convert to autotarget), but the comment stuck.

Get rid of it: it nowadays does not make sense and is a bit confusing.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/coreutils/coreutils.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 409089c..3f3f8c4 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -123,7 +123,4 @@ endef
 
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP
 
-# If both coreutils and busybox are selected, the corresponding applets
-# may need to be reinstated by the clean targets.
-
 $(eval $(autotools-package))
-- 
2.9.3
