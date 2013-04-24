From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Apr 2013 22:13:29 +0200
Subject: [Buildroot] [git commit] post-build: show each script filename
	before execution
Message-ID: <20130424201554.CDE2D9B765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b9b168562be3466cea2a2e31691c51223a7f88a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This also simplifies code by removing the ifneq/endif clauses.

[Peter: drop extra space]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 0a91658..e825bcd 100644
--- a/Makefile
+++ b/Makefile
@@ -509,11 +509,9 @@ endif
 			$${dir}/ $(TARGET_DIR); \
 	done
 
-ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
-	@$(call MESSAGE,"Executing post-build script\(s\)")
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
+		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(s) $(TARGET_DIR)$(sep))
-endif
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
