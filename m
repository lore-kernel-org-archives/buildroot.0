From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 17:56:04 +0100
Subject: [Buildroot] [git commit] Makefile: also use ignore-times argument
	to rsync when copying rootfs overlays
Message-ID: <20140204165635.14DE69C7D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99e82b0d4c6d8f10560a8dd5377b244b344963ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Missed from previous patch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 9775397..dec0694 100644
--- a/Makefile
+++ b/Makefile
@@ -548,7 +548,7 @@ endif
 
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
-		rsync -a $(RSYNC_VCS_EXCLUSIONS) \
+		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
 			--chmod=Du+w --exclude .empty --exclude '*~' \
 			$(d)/ $(TARGET_DIR)$(sep))
 
