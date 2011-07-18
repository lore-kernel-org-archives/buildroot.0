From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jul 2011 12:49:25 +0200
Subject: [Buildroot] [git commit] Makefile.package.in: use "" for MESSAGE
	arguments
Message-ID: <20110718105128.EB2F48AC58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=20d6fca6cd7c96d2a16e6ef80de453f69a5e3bc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise we get output like:

>>> host-pkg-config 0.25 'Installing to host directory'

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 74087cd..90530dc 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -292,21 +292,21 @@ $(BUILD_DIR)/%/.stamp_built::
 
 # Install to host dir
 $(BUILD_DIR)/%/.stamp_host_installed:
-	@$(call MESSAGE,'Installing to host directory')
+	@$(call MESSAGE,"Installing to host directory")
 	$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
 # Install to staging dir
 $(BUILD_DIR)/%/.stamp_staging_installed:
-	@$(call MESSAGE,'Installing to staging directory')
+	@$(call MESSAGE,"Installing to staging directory")
 	$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
 # Install to images dir
 $(BUILD_DIR)/%/.stamp_images_installed:
-	@$(call MESSAGE,'Installing to images directory')
+	@$(call MESSAGE,"Installing to images directory")
 	$($(PKG)_INSTALL_IMAGES_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
-- 
1.7.3.4
