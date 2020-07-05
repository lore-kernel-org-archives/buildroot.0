From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jul 2020 23:01:47 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/upx: use
 HOST_CONFIGURE_OPTS
Message-ID: <20200705205908.8211881917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a059cf04f2453350d5005666d6a6ebef5829405d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Use HOST_CONFIGURE_OPTS to pass CPPFLAGS and LDFLAGS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1e0c0055d77fdc6cd3655dbe88bd18c3231b5694)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upx/upx.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index 1fe7162c21..c554553ce9 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -15,10 +15,8 @@ HOST_UPX_DEPENDENCIES = host-ucl host-zlib
 # We need to specify all, otherwise the default target only prints a message
 # stating to "please choose a target for 'make'"... :-(
 define HOST_UPX_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) CPPFLAGS="$(HOST_CPPFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" UPX_UCLDIR=$(HOST_DIR) \
-		CXXFLAGS_WERROR= \
-		-C $(@D) all
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		UPX_UCLDIR=$(HOST_DIR) CXXFLAGS_WERROR= -C $(@D) all
 endef
 
 # UPX has no install procedure, so install it manually.
