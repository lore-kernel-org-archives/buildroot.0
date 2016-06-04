From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Jun 2016 18:30:53 +0200
Subject: [Buildroot] [PATCH 7/8 v3] boot/barebox: use the generic help rules
In-Reply-To: <cover.1465056706.git.yann.morin.1998@free.fr>
References: <cover.1465056706.git.yann.morin.1998@free.fr>
Message-ID: <2152b56432f325a69800fa0b560a83e76c90a5f8.1465056706.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                        | 4 ----
 boot/barebox/barebox/barebox.mk | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index f007db2..3f5c3d3 100644
--- a/Makefile
+++ b/Makefile
@@ -941,10 +941,6 @@ help:
 		@echo $(sep) \
 		@echo '$($(p)_NAME):' $(sep) \
 		$($(p)_HELP_CMDS)$(sep))
-ifeq ($(BR2_TARGET_BAREBOX),y)
-	@echo '  barebox-menuconfig     - Run barebox menuconfig'
-	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
-endif
 	@echo
 	@echo 'Documentation:'
 	@echo '  manual                 - build manual in all formats'
diff --git a/boot/barebox/barebox/barebox.mk b/boot/barebox/barebox/barebox.mk
index 6a5a80d..9359ddd 100644
--- a/boot/barebox/barebox/barebox.mk
+++ b/boot/barebox/barebox/barebox.mk
@@ -4,5 +4,10 @@
 #
 ################################################################################
 
+define BAREBOX_HELP_CMDS
+	$(call print-help,barebox-menuconfig,Run barebox menuconfig)
+	$(call print-help,barebox-savedefconfig,Run barebox savedefconfig)
+endef
+
 # Instantiate the barebox package
 $(eval $(barebox-package))
-- 
2.7.4
