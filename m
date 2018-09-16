From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:53:54 +0200
Subject: [Buildroot] [git commit] botan: fix static build
Message-ID: <20180916135350.2646288301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f250324a28e839b5d2416f7b9aa2ba0457db3522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't pass crs in AR as it is now done by botan, see:
https://github.com/randombit/botan/commit/a9e4eede3942748234d705cc616ecc106e3767a6

Fixes:
 - http://autobuild.buildroot.org/results/5c15fe739cb1b6079dacf234699ee048924b74fb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/botan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 4788617d4a..59aa1f0803 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -87,7 +87,7 @@ define BOTAN_CONFIGURE_CMDS
 endef
 
 define BOTAN_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) AR="$(TARGET_AR) crs"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) AR="$(TARGET_AR)"
 endef
 
 define BOTAN_INSTALL_STAGING_CMDS
