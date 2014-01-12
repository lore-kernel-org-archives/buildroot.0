From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jan 2014 18:53:26 +0100
Subject: [Buildroot] [PATCH 12/14] sdl: add host version
In-Reply-To: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1389549208-19078-13-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host version is needed to build xbmc

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/sdl/sdl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index ba5fbca..0972acb 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -18,6 +18,7 @@ define SDL_RUN_AUTOGEN
 endef
 
 SDL_POST_PATCH_HOOKS += SDL_RUN_AUTOGEN
+HOST_SDL_POST_PATCH_HOOKS += SDL_RUN_AUTOGEN
 SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
 
 
@@ -80,3 +81,4 @@ endef
 SDL_POST_INSTALL_STAGING_HOOKS += SDL_FIXUP_SDL_CONFIG
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.5.2
