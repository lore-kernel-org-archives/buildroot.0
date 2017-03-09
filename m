From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:28:38 +0100
Subject: [Buildroot] [git commit] libplayer: remove broken Python bindings
Message-ID: <20170309212905.33751801E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f5b3d0fd8199332beb5032d6838ccb64f8786ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option has been marked as broken since 2011. No need for legacy
handling.

And anyway, nowadays we use automatic dependencies for bindings.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libplayer/Config.in    | 6 ------
 package/libplayer/libplayer.mk | 5 -----
 2 files changed, 11 deletions(-)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 37fbb26..89809eb 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -26,11 +26,5 @@ comment "gstreamer backend needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_LIBPLAYER_PYTHON
-	depends on BR2_PACKAGE_PYTHON
-	depends on BROKEN # player_init params, builds for host
-	bool "Libplayer python bindings"
-endif
-
 comment "libplayer needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
index ee5362d..ace1891 100644
--- a/package/libplayer/libplayer.mk
+++ b/package/libplayer/libplayer.mk
@@ -39,9 +39,4 @@ else
 LIBPLAYER_CONF_OPTS += --disable-gstreamer
 endif
 
-ifeq ($(BR2_PACKAGE_LIBPLAYER_PYTHON),y)
-LIBPLAYER_DEPENDENCIES += python
-LIBPLAYER_CONF_OPTS += --enable-binding-python
-endif
-
 $(eval $(autotools-package))
