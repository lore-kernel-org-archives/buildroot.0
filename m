From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:09 +0200
Subject: [Buildroot] [git commit] opentyrian: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.9AC2D81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c877270a5094eee9b2f483839a8ec428f49a381
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opentyrian/opentyrian.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
index b74e4cf..6efbe4e 100644
--- a/package/opentyrian/opentyrian.mk
+++ b/package/opentyrian/opentyrian.mk
@@ -20,7 +20,7 @@ OPENTYRIAN_NETWORK = false
 endif
 
 define OPENTYRIAN_BUILD_CMDS
-	$(MAKE) PLATFORM=UNIX \
+	$(TARGET_MAKE_ENV) $(MAKE) PLATFORM=UNIX \
 		CC="$(TARGET_CC)" \
 		STRIP="/bin/true" \
 		SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
