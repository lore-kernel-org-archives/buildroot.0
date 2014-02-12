From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 12 Feb 2014 10:19:11 +0100
Subject: [Buildroot] [PATCH v12 7/7] sdl: add support for top-level parallel
	make
In-Reply-To: <1392196751-23485-1-git-send-email-fabio.porcedda@gmail.com>
References: <1392196751-23485-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1392196751-23485-8-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add host-autoconf as a dependency of the sdl-patch target because is
used by it.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/sdl/sdl.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index ba5fbca..701022b 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -80,3 +80,6 @@ endef
 SDL_POST_INSTALL_STAGING_HOOKS += SDL_FIXUP_SDL_CONFIG
 
 $(eval $(autotools-package))
+
+# autoconf is used in the sdl-patch target
+$(SDL_TARGET_PATCH): | host-autoconf
-- 
1.8.5.4
