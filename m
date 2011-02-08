From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Feb 2011 08:46:28 +0100
Subject: [Buildroot] [PATCH 1/1] Add support for DirectFB EP9x driver
In-Reply-To: <cover.1297151183.git.thomas.petazzoni@free-electrons.com>
References: <cover.1297151183.git.thomas.petazzoni@free-electrons.com>
Message-ID: <627c4a60156d98de9fcfde8d7db595e902271b80.1297151183.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/Config.in   |    4 ++++
 package/directfb/directfb.mk |    3 ++-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 1dedb8f..47f9fea 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -49,6 +49,10 @@ config BR2_PACKAGE_DIRECTFB_PXA3XX
 	bool "compile pxa3xx graphics driver"
 	depends on BR2_arm
 
+config BR2_PACKAGE_DIRECTFB_EP9X
+	bool "compile ep9x graphics driver"
+	depends on BR2_arm
+
 config BR2_PACKAGE_DIRECTFB_UNICHROME
 	bool "compile unichrome graphics driver"
 	default y
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index ca0f8e4..36b1c0a 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -60,7 +60,8 @@ DIRECTFB_GFX := \
 	$(if $(BR2_PACKAGE_DIRECTFB_MATROX),matrox) \
 	$(if $(BR2_PACKAGE_DIRECTFB_PXA3XX),pxa3xx) \
 	$(if $(BR2_PACKAGE_DIRECTFB_UNICHROME),unichrome) \
-	$(if $(BR2_PACKAGE_DIRECTFB_I830),i830)
+	$(if $(BR2_PACKAGE_DIRECTFB_I830),i830)	\
+	$(if $(BR2_PACKAGE_DIRECTFB_EP9X),ep9x)
 
 ifeq ($(strip $(DIRECTFB_GFX)),)
 DIRECTFB_GFX:=none
-- 
1.7.0.4
