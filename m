From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:36:38 +0200
Subject: [Buildroot] [git commit] Revert "lmbench: fix build for xtensa"
Message-ID: <20140403193845.3D3A59A856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a91ba98811c479309fa218b2637059b096f2ae8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 7c04932603476f3adf474f3bc47c35bdb59d947a.
Now that -mtext-section-literals is specified in the xtensa ABI this fix
is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lmbench/lmbench.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 529026f..c3a6c09 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -19,10 +19,6 @@ LMBENCH_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
 LMBENCH_LDFLAGS += -ltirpc
 endif
 
-ifeq ($(BR2_xtensa),y)
-LMBENCH_CFLAGS += -mtext-section-literals
-endif
-
 define LMBENCH_CONFIGURE_CMDS
 	$(call CONFIG_UPDATE,$(@D))
 	sed -i 's/CFLAGS=/CFLAGS+=/g' $(@D)/src/Makefile
