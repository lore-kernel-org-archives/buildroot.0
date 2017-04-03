From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 14:32:40 +0200
Subject: [Buildroot] [git commit] package/tyrian: fixes compilation with
	static libs
Message-ID: <20170403123257.006E7826E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd99f2cb7d10f20568cab22c498a9e1831b5a351
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Has been tested with: "./support/scripts/test-pkg -c tyrian.cfg -p opentyrian"
Fixes: http://autobuild.buildroot.net/results/0e2345db82b33f591958fc0f72ad914adafe0522
and some similar previous build failure.

Thanks Thomas for the tip ;-).

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opentyrian/opentyrian.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
index 4417512..12e41ad 100644
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
