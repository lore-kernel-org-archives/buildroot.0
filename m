From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Feb 2014 21:10:27 +0100
Subject: [Buildroot] [git commit] sdl: add support for top-level parallel
	make
Message-ID: <20140228133413.14AA59BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f75b5de9f6f473a257c607e97419a2338d57333c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To be sure that host-autoconf dependency is already built move the
call to autogen.sh from SDL_POST_PATCH_HOOKS to SDL_PRE_CONFIGURE_HOOKS.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl/sdl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index ba5fbca..cf3366d 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -17,7 +17,7 @@ define SDL_RUN_AUTOGEN
 	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
 endef
 
-SDL_POST_PATCH_HOOKS += SDL_RUN_AUTOGEN
+SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
 SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
 
 
