From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu,  6 Aug 2009 18:25:37 +0200
Subject: [Buildroot] [PATCH] directfb: remove unnecessary dependency on
	libungif
Message-ID: <1249575937-6824-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The GIF image provider in DirectFB is self-contained and doesn't
need libungif.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/directfb/Config.in   |    1 -
 package/directfb/directfb.mk |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index e616314..487faf4 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -92,7 +92,6 @@ config BR2_PACKAGE_DIRECTFB_GIF
 	bool "enable GIF support"
 	default y
 	depends on BR2_PACKAGE_DIRECTFB
-	select BR2_PACKAGE_LIBUNGIF
 
 config BR2_PACKAGE_DIRECTFB_JPEG
 	bool "enable JPEG support"
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index b3af0ed..5fc8868 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -94,7 +94,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_GIF),y)
 DIRECTFB_GIF:=--enable-gif
-DIRECTFB_DEP+= libungif
 else
 DIRECTFB_GIF:=--disable-gif
 endif
-- 
1.6.0.4
