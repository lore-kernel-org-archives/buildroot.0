From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 24 Aug 2009 22:28:47 +0200
Subject: [Buildroot] [git commit master] directfb: remove unnecessary
	dependency on libungif
Message-ID: <20090824202956.C1FB1775A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7ad7a89244366bd05452689088269a2068b45023
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The GIF image provider in DirectFB is self-contained and doesn't
need libungif.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/directfb/Config.in   |    1 -
 package/directfb/directfb.mk |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 5e847ed..bb35530 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -87,7 +87,6 @@ config BR2_PACKAGE_DIRECTFB_GIF
 	bool "enable GIF support"
 	default y
 	depends on BR2_PACKAGE_DIRECTFB
-	select BR2_PACKAGE_LIBUNGIF
 
 config BR2_PACKAGE_DIRECTFB_JPEG
 	bool "enable JPEG support"
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 2407743..1c3b78a 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -91,7 +91,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_GIF),y)
 DIRECTFB_GIF:=--enable-gif
-DIRECTFB_DEP+= libungif
 else
 DIRECTFB_GIF:=--disable-gif
 endif
-- 
1.6.3.3
