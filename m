From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 22:12:08 +0200
Subject: [Buildroot] [git commit] boot/barebox: use the generic help rules
Message-ID: <20160607201335.C8C2A8074E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77f4c205b9c2b6346b479c6ed29ead74fe9637cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Thomas: don't use the helper.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
index 6a5a80d..39afb0f 100644
--- a/boot/barebox/barebox/barebox.mk
+++ b/boot/barebox/barebox/barebox.mk
@@ -4,5 +4,10 @@
 #
 ################################################################################
 
+define BAREBOX_HELP_CMDS
+	@echo '  barebox-menuconfig     - Run barebox menuconfig'
+	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
+endef
+
 # Instantiate the barebox package
 $(eval $(barebox-package))
