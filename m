From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:47 -0300
Subject: [Buildroot] [PATCH 60/93] ti-gfx: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-61-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.7.3
