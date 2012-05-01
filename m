From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 22:02:14 +0200
Subject: [Buildroot] [git commit] directfb: add support for davinci gfx
	driver
Message-ID: <20120501200543.8B6A696C3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df39ffe7f437f62d7c0eb6d73bdb86b2d09a8c8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/Config.in   |    4 ++++
 package/directfb/directfb.mk |    3 ++-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 47f9fea..26f5091 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -53,6 +53,10 @@ config BR2_PACKAGE_DIRECTFB_EP9X
 	bool "compile ep9x graphics driver"
 	depends on BR2_arm
 
+config BR2_PACKAGE_DIRECTFB_DAVINCI
+	bool "compile TI DaVinci graphics driver"
+	depends on BR2_arm
+
 config BR2_PACKAGE_DIRECTFB_UNICHROME
 	bool "compile unichrome graphics driver"
 	default y
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 071cdf4..7aa0398 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -58,7 +58,8 @@ DIRECTFB_GFX := \
 	$(if $(BR2_PACKAGE_DIRECTFB_PXA3XX),pxa3xx) \
 	$(if $(BR2_PACKAGE_DIRECTFB_UNICHROME),unichrome) \
 	$(if $(BR2_PACKAGE_DIRECTFB_I830),i830)	\
-	$(if $(BR2_PACKAGE_DIRECTFB_EP9X),ep9x)
+	$(if $(BR2_PACKAGE_DIRECTFB_EP9X),ep9x) \
+	$(if $(BR2_PACKAGE_DIRECTFB_DAVINCI),davinci)
 
 ifeq ($(strip $(DIRECTFB_GFX)),)
 DIRECTFB_GFX:=none
