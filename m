From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Feb 2014 19:40:03 +0100
Subject: [Buildroot] [PATCH] package/ti-gfx: do not forcefully remove source
	dir on extract
Message-ID: <1393440003-29380-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

ti-gfx uses custom extract commands, which first and foremost removes
the source dir unconditionally.

Thee side-effect of this is that make will re-extract, re-patch and
probably re-build ti-gfx at each run.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Spenser Gilliland <spenser@gillilanding.com>
---
 package/ti-gfx/ti-gfx.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index 5ea6b92..e48715d 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -90,7 +90,6 @@ TI_GFX_HDR_DIRS = OGLES2/EGL OGLES2/EWS OGLES2/GLES2 OGLES2/KHR \
 	OGLES/GLES bufferclass_ti/ pvr2d/ wsegl/
 
 define TI_GFX_EXTRACT_CMDS
-	$(RM) -rf $(TI_GFX_DIR)
 	chmod +x $(DL_DIR)/$(TI_GFX_SOURCE)
 	printf "Y\nY\n qY\n\n" | $(DL_DIR)/$(TI_GFX_SOURCE) \
 		--prefix $(@D) \
-- 
1.8.3.2
