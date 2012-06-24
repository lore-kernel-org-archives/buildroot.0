From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jun 2012 11:10:47 +0200
Subject: [Buildroot] [git commit] toolchain/crosstool-ng: change use of
	BR2_JLEVEL to PARALLEL_JOBS
Message-ID: <20120624095658.5905188E1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6b26ea4251c7bcec36a26e7059832789a3f5938
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nathan Lynch <ntl@pobox.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 625796a..d18f5d5 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -81,7 +81,7 @@ $(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
 #       depending on the selected C library. Those deps are added later
 
 $(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/.config
-	$(Q)$(call ctng,build.$(BR2_JLEVEL))
+	$(Q)$(call ctng,build.$(PARALLEL_JOBS))
 	$(Q)printf "\n"
 	$(Q)touch $@
 
