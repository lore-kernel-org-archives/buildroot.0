From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 19 Feb 2012 23:05:34 +0100
Subject: [Buildroot] [git commit] Print a message before executing the
	post-build script
Message-ID: <20120301130635.E2B8890BF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb8fad28055b94906e0690f4ae789fbd30bafd17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 8a8b676..d5cd8f0 100644
--- a/Makefile
+++ b/Makefile
@@ -486,6 +486,7 @@ endif
 	) >  $(TARGET_DIR)/etc/os-release
 
 ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
+	@$(call MESSAGE,"Executing post-build script")
 	$(BR2_ROOTFS_POST_BUILD_SCRIPT) $(TARGET_DIR)
 endif
 
