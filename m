From: Ormund Williams <ormundw@panix.com>
Date: Thu, 24 Sep 2009 17:14:31 +0200
Subject: [Buildroot] [git commit master] Add i830 graphics driver to DirectFB
Message-ID: <20090924151918.3BC4D77780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1f09b42f504bfbfb0ce51a94f1033ce05d8d1f08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ormund Williams <ormundw@panix.com>[A
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/Config.in   |    5 +++++
 package/directfb/directfb.mk |    3 +++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 487faf4..0d1c49d 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -61,6 +61,11 @@ config BR2_PACKAGE_DIRECTFB_UNICHROME
 	depends on BR2_PACKAGE_DIRECTFB
 	depends on BR2_i386 || BR2_x86_64
 
+config BR2_PACKAGE_DIRECTFB_I830
+	bool "compile i830 graphics driver"
+	depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_i386 || BR2_x86_64
+
 config BR2_PACKAGE_DIRECTFB_LINUXINPUT
 	bool "compile /dev/input/eventX input driver"
 	default y
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 4212a4a..409f791 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -63,6 +63,9 @@ endif
 ifeq ($(BR2_PACKAGE_DIRECTFB_UNICHROME),y)
 DIRECTFB_GFX+= unichrome
 endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_I830),y)
+DIRECTFB_GFX+= i830
+endif
 ifeq ($(DIRECTFB_GFX),)
 DIRECTFB_GFX:=none
 else
-- 
1.6.3.3
