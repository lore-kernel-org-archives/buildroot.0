From: Patrick Williams <patrick@stwcx.xyz>
Date: Wed, 18 May 2016 14:25:29 -0500
Subject: [Buildroot] [PATCH 5/6] Makefile: Add merged defconfigs to
	list-defconfigs.
In-Reply-To: <1463599530-28752-1-git-send-email-patrick@stwcx.xyz>
References: <1463599530-28752-1-git-send-email-patrick@stwcx.xyz>
Message-ID: <1463599530-28752-6-git-send-email-patrick@stwcx.xyz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 8a9bb2b..2694339 100644
--- a/Makefile
+++ b/Makefile
@@ -988,12 +988,12 @@ endif
 
 list-defconfigs:
 	@echo 'Built-in configs:'
-	@$(foreach b, $(sort $(notdir $(foreach path,$(BR2_DEFCONFIG_PATHS_LOCAL),$(wildcard $(path)/*_defconfig)))), \
+	@$(foreach b, $(sort $(notdir $(foreach path,$(BR2_DEFCONFIG_PATHS_LOCAL),$(basename $(wildcard $(path)/*_defconfig $(path)/*_defconfig.merge))))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)
 	@echo
 	@echo 'User-provided configs:'
-	@$(foreach b, $(sort $(notdir $(foreach path,$(BR2_DEFCONFIG_PATHS_USER),$(wildcard $(path)/*_defconfig)))), \
+	@$(foreach b, $(sort $(notdir $(foreach path,$(BR2_DEFCONFIG_PATHS_USER),$(basename $(wildcard $(path)/*_defconfig $(path)/*_defconfig.merge))))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 endif
 	@echo
-- 
2.6.3
