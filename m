From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 20:57:34 +0200
Subject: [Buildroot] [git commit] package/lua-gd: compile with -fPIC
Message-ID: <20190331185400.BB2B8884A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b952a57ae977ab306fef5a3e1d91c31edc1de3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/756c20a09e3c1bd5295416894e4fbe0ca0db5328

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-gd/lua-gd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-gd/lua-gd.mk b/package/lua-gd/lua-gd.mk
index 361929ffa2..e9a51a1677 100644
--- a/package/lua-gd/lua-gd.mk
+++ b/package/lua-gd/lua-gd.mk
@@ -16,7 +16,7 @@ define LUA_GD_BUILD_CMDS
 	$(MAKE) -C $(@D) gd.so \
 		GDLIBCONFIG="$(STAGING_DIR)/usr/bin/gdlib-config" \
 		CC=$(TARGET_CC) \
-		CFLAGS="$(TARGET_CFLAGS) -DVERSION=\\\"$(GD_VERSION)r3\\\"" \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC -DVERSION=\\\"$(GD_VERSION)r3\\\"" \
 		LFLAGS="-shared -lgd"
 endef
 
