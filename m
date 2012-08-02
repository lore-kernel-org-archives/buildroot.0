From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:32 -0000
Subject: [Buildroot] [git commit branch/next] Revert "directfb: add support
	for davinci gfx driver"
Message-ID: <20120802195232.0D07596AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1abaa98d9242799605fc8d91e238fc1e929b6414
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This reverts commit df39ffe7f437f62d7c0eb6d73bdb86b2d09a8c8a.

It's broken and Arnout no longer has the hardware to fix/test.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/Config.in   |    4 ----
 package/directfb/directfb.mk |    3 +--
 2 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 26f5091..47f9fea 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -53,10 +53,6 @@ config BR2_PACKAGE_DIRECTFB_EP9X
 	bool "compile ep9x graphics driver"
 	depends on BR2_arm
 
-config BR2_PACKAGE_DIRECTFB_DAVINCI
-	bool "compile TI DaVinci graphics driver"
-	depends on BR2_arm
-
 config BR2_PACKAGE_DIRECTFB_UNICHROME
 	bool "compile unichrome graphics driver"
 	default y
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 7aa0398..071cdf4 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -58,8 +58,7 @@ DIRECTFB_GFX := \
 	$(if $(BR2_PACKAGE_DIRECTFB_PXA3XX),pxa3xx) \
 	$(if $(BR2_PACKAGE_DIRECTFB_UNICHROME),unichrome) \
 	$(if $(BR2_PACKAGE_DIRECTFB_I830),i830)	\
-	$(if $(BR2_PACKAGE_DIRECTFB_EP9X),ep9x) \
-	$(if $(BR2_PACKAGE_DIRECTFB_DAVINCI),davinci)
+	$(if $(BR2_PACKAGE_DIRECTFB_EP9X),ep9x)
 
 ifeq ($(strip $(DIRECTFB_GFX)),)
 DIRECTFB_GFX:=none
