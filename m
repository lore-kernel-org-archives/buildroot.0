From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Apr 2017 23:44:51 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/tyrian: fixes
	compilation with static libs
Message-ID: <20170404214919.588EE826DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c61338a628879610671826f0aa766473023c8219
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Has been tested with: "./support/scripts/test-pkg -c tyrian.cfg -p opentyrian"
Fixes: http://autobuild.buildroot.net/results/0e2345db82b33f591958fc0f72ad914adafe0522
and some similar previous build failure.

Thanks Thomas for the tip ;-).

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit dd99f2cb7d10f20568cab22c498a9e1831b5a351)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opentyrian/opentyrian.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
index 6efbe4e..c6b19d2 100644
--- a/package/opentyrian/opentyrian.mk
+++ b/package/opentyrian/opentyrian.mk
@@ -24,7 +24,7 @@ define OPENTYRIAN_BUILD_CMDS
 		CC="$(TARGET_CC)" \
 		STRIP="/bin/true" \
 		SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
-		LDFLAGS="-lm" \
+		LDFLAGS="$(TARGET_LDFLAGS) -lm" \
 		WITH_NETWORK="$(OPENTYRIAN_NETWORK)" \
 		-C $(@D) release
 endef
