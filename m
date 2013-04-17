From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Apr 2013 21:51:11 +0200
Subject: [Buildroot] [git commit] busybox: don't disable static option
Message-ID: <20130417195410.38EE69B71F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79154f49f5c6fa15e5500df048ff829f25e6d3f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't change the busybox STATIC option if buildroots PREFER_STATIC_LIB option
is not set. Not to prefer static linking doesn't imply prefer dynamic linking
for all packages.

Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 900896f..985203c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -106,10 +106,6 @@ ifeq ($(BR2_PREFER_STATIC_LIB),y)
 define BUSYBOX_PREFER_STATIC
 	$(call KCONFIG_ENABLE_OPT,CONFIG_STATIC,$(BUSYBOX_BUILD_CONFIG))
 endef
-else
-define BUSYBOX_PREFER_STATIC
-	$(call KCONFIG_DISABLE_OPT,CONFIG_STATIC,$(BUSYBOX_BUILD_CONFIG))
-endef
 endif
 
 # Disable usage of inetd if netkit-base package is selected
