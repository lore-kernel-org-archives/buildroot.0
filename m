From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Mar 2016 23:22:26 +0100
Subject: [Buildroot] [PATCH 7/8] boot/barebox: use the generic help rules
In-Reply-To: <cover.1457561521.git.yann.morin.1998@free.fr>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
Message-ID: <a5912926eaca571643ce6959d104322a434c69ce.1457561521.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                | 4 ----
 boot/barebox/barebox.mk | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 8973921..a9cfe03 100644
--- a/Makefile
+++ b/Makefile
@@ -933,10 +933,6 @@ help:
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
 	@$(call HELP_RULE,$(PACKAGE_HELP))
-ifeq ($(BR2_TARGET_BAREBOX),y)
-	@echo '  barebox-menuconfig     - Run barebox menuconfig'
-	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
-endif
 	@echo
 	@echo 'Documentation:'
 	@echo '  manual                 - build manual in all formats'
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 7715daf..32ecd76 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -6,6 +6,10 @@
 
 BAREBOX_VERSION = $(call qstrip,$(BR2_TARGET_BAREBOX_VERSION))
 
+BAREBOX_HELP = \
+	"barebox-menuconfig : Run barebox menuconfig" \
+	"barebox-savedefconfig : Run barebox savedefconfig"
+
 ifeq ($(BAREBOX_VERSION),custom)
 # Handle custom Barebox tarballs as specified by the configuration
 BAREBOX_TARBALL = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION))
-- 
1.9.1
