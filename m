From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 23:29:26 +0100
Subject: [Buildroot] [git commit] mplayer: use BR2_ARM_CPU_ARM* options
Message-ID: <20141106233446.49C3BB1487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6cf975c2fa068d9dbf35f4edb54fd225cf9912d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mplayer/Config.in  |    3 +--
 package/mplayer/mplayer.mk |    4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 978eefe..4cfa0bb 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -4,8 +4,7 @@ config BR2_PACKAGE_MPLAYER
 	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 		|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	# Broken support for <ARMv5
-	depends on !(BR2_arm920t || BR2_arm920t || BR2_arm922t || BR2_fa526 \
-		|| BR2_strongarm)
+	depends on !BR2_ARM_CPU_ARMV4
 	depends on BR2_LARGEFILE
 	help
 	  MPlayer is a movie player which runs on many systems and supports
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 0c216d7..ee023b4 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -105,11 +105,11 @@ MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBX11),xlib_libX11)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBXV),xlib_libXv)
 
 # ARM optimizations
-ifeq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),armv5te)
+ifeq ($(BR2_ARM_CPU_ARMV5),y)
 MPLAYER_CONF_OPTS += --enable-armv5te
 endif
 
-ifeq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),armv6j)
+ifeq ($(BR2_ARM_CPU_ARMV6),y)
 MPLAYER_CONF_OPTS += --enable-armv6
 endif
 
