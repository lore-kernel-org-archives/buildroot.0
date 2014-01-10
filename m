From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Fri, 10 Jan 2014 07:38:43 -0600
Subject: [Buildroot] [PATCH] sdl: Fix missing autoconf
Message-ID: <1389361123-2369-1-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixing an issue seen on the autobuilders with sdl failing to run the
autogen.sh script. Several of the autobuild issues are listed below.

http://autobuild.buildroot.net/results/7326631048bc9e15ffadc6f541f2235592b5259b/
http://autobuild.buildroot.net/results/0adf5ea64075323eba1183f93c16d2954673f3e1/

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/sdl/sdl.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index a30a31e..ba5fbca 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -14,7 +14,7 @@ SDL_INSTALL_STAGING = YES
 # we're patching configure.in, but package cannot autoreconf with our version of
 # autotools, so we have to do it manually instead of setting SD_AUTORECONF = YES
 define SDL_RUN_AUTOGEN
-	cd $(@D) && ./autogen.sh
+	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
 endef
 
 SDL_POST_PATCH_HOOKS += SDL_RUN_AUTOGEN
-- 
1.7.9.5
