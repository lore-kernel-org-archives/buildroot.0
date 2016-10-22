From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] ti-gfx: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132038.BB301819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f3bbbc5b114ad082b06e8d01d6c72782b503a4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ti-gfx/ti-gfx.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index 47eb474..428878a 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -101,7 +101,7 @@ define TI_GFX_EXTRACT_CMDS
 endef
 
 define TI_GFX_BUILD_KM_CMDS
-	$(MAKE) $(TI_GFX_KM_MAKE_OPTS) -C $(@D)/GFX_Linux_KM all
+	$(TARGET_MAKE_ENV) $(MAKE) $(TI_GFX_KM_MAKE_OPTS) -C $(@D)/GFX_Linux_KM all
 endef
 
 ifeq ($(BR2_PACKAGE_TI_GFX_DEMOS),y)
@@ -156,7 +156,7 @@ define TI_GFX_INSTALL_STAGING_CMDS
 endef
 
 define TI_GFX_INSTALL_KM_CMDS
-	$(MAKE) $(TI_GFX_KM_MAKE_OPTS) -C $(@D)/GFX_Linux_KM install
+	$(TARGET_MAKE_ENV) $(MAKE) $(TI_GFX_KM_MAKE_OPTS) -C $(@D)/GFX_Linux_KM install
 endef
 
 define TI_GFX_INSTALL_BINS_CMDS
