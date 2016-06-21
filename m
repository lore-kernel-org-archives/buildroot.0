From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 21 Jun 2016 14:56:45 +1000
Subject: [Buildroot] [PATCH v2 5/5] Makefile: Add merged defconfigs to
	list-defconfigs.
In-Reply-To: <cover.1466484997.git.sam.bobroff@au1.ibm.com>
References: <cover.1466484997.git.sam.bobroff@au1.ibm.com>
Message-ID: <137e3d0955ba942850055c54255894d920d0d17a.1466484997.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Patrick Williams <patrick@stwcx.xyz>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index cd94f52..461066f 100644
--- a/Makefile
+++ b/Makefile
@@ -1011,12 +1011,12 @@ help:
 
 list-defconfigs:
 	@echo 'Built-in configs:'
-	@$(foreach b, $(sort $(notdir $(foreach path,$(BR2_DEFCONFIG_PATHS_LOCAL),$(wildcard $(path)/*_defconfig)))), \
+	@$(foreach b, $(sort $(notdir $(foreach path,$(BR2_DEFCONFIG_PATHS_LOCAL),$(basename $(wildcard $(path)/*_defconfig $(path)/*_defconfig.mk))))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)
 	@echo
 	@echo 'User-provided configs:'
-	@$(foreach b, $(sort $(notdir $(foreach path,$(BR2_DEFCONFIG_PATHS_USER),$(wildcard $(path)/*_defconfig)))), \
+	@$(foreach b, $(sort $(notdir $(foreach path,$(BR2_DEFCONFIG_PATHS_USER),$(basename $(wildcard $(path)/*_defconfig $(path)/*_defconfig.mk))))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 endif
 	@echo
-- 
2.1.0
