From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2014 15:00:48 +0100
Subject: [Buildroot] [git commit] sdl: Fix missing autoconf
Message-ID: <20140110140059.D03E19C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=755bed66356d81974fdbd25ff15e80d270a45920
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixing an issue seen on the autobuilders with sdl failing to run the
autogen.sh script. Several of the autobuild issues are listed below.

http://autobuild.buildroot.net/results/7326631048bc9e15ffadc6f541f2235592b5259b/
http://autobuild.buildroot.net/results/0adf5ea64075323eba1183f93c16d2954673f3e1/

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl/sdl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
