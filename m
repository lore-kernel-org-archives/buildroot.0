From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 30 Dec 2015 15:08:32 +0100
Subject: [Buildroot] [PATCH 2/2] sshfs: use SSHFS_VERSION variable in URL
In-Reply-To: <1451484512-28872-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1451484512-28872-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1451484512-28872-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/sshfs/sshfs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 93f2522..f59f7ea 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SSHFS_VERSION = 2.5
-SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs_2_5
+SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs_$(subst .,_,$(SSHFS_VERSION))
 SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
 SSHFS_LICENSE = GPLv2
 SSHFS_LICENSE_FILES = COPYING
-- 
1.9.1
