From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:38:04 +0200
Subject: [Buildroot] [PATCHv2 20/21] Makefile: implement the 'source' target
	using the package infrastructure
In-Reply-To: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1428856685-4403-21-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that all the bits are in place, switch the global 'source' target
to use the package infrastructure logic.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7d94ee8..06a9f05 100644
--- a/Makefile
+++ b/Makefile
@@ -610,7 +610,7 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
-source: $(PACKAGES_SOURCE) $(HOST_SOURCE)
+source: $(foreach p,$(PACKAGES),$(p)-all-source)
 
 _external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
 external-deps:
-- 
2.1.0
