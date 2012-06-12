From: Nathan Lynch <ntl@pobox.com>
Date: Mon, 11 Jun 2012 21:09:42 -0500
Subject: [Buildroot] [PATCH 6/7] toolchain/crosstool-ng: change use of
 BR2_JLEVEL to PARALLEL_JOBS
In-Reply-To: <1339466983-19786-1-git-send-email-ntl@pobox.com>
References: <1339466983-19786-1-git-send-email-ntl@pobox.com>
Message-ID: <1339466983-19786-7-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 25d2a16..c3a8a01 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -81,7 +81,7 @@ $(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
 #       depending on the selected C library. Those deps are added later
 
 $(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/.config
-	$(Q)$(call ctng,build.$(BR2_JLEVEL))
+	$(Q)$(call ctng,build.$(PARALLEL_JOBS))
 	$(Q)printf "\n"
 	$(Q)touch $@
 
-- 
1.7.6.5
