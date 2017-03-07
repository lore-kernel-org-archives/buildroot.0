From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 8 Mar 2017 00:50:52 +0100
Subject: [Buildroot] [PATCH 4/6] libplayer: remove broken Python bindings
In-Reply-To: <20170307235054.25149-1-arnout@mind.be>
References: <20170307235054.25149-1-arnout@mind.be>
Message-ID: <20170307235054.25149-4-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option has been marked as broken since 2011. No need for legacy
handling.

And anyway, nowadays we use automatic dependencies for bindings.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libplayer/Config.in    | 6 ------
 package/libplayer/libplayer.mk | 5 -----
 2 files changed, 11 deletions(-)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 37fbb26c5b..89809ebcfa 100644
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
index ee5362dc46..ace189180f 100644
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
-- 
2.11.0
