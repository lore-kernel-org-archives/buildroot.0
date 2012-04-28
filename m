From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 28 Apr 2012 18:50:44 +0200
Subject: [Buildroot] [PATCH resend] directfb: add support for davinci gfx
	driver
Message-ID: <1335631844-15681-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/directfb/Config.in   |    4 ++++
 package/directfb/directfb.mk |    3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

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
-- 
tg: (524a8ab..) t/directfb-davinci (depends on: master)
