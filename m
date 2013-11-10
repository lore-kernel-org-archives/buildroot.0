From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 00:15:01 +0100
Subject: [Buildroot] [git commit] infra: clean up 'Patching' message
Message-ID: <20131110231541.C84619BB0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b40341e14a770f4e0785a08338aa7cf1ade77e26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'Patching' message in the generic infrastructure prints not only the
package name, but also a reference to the assumed package directory, based
on FOO_DIR_PREFIX/FOO_RAWNAME. This doesn't really add value, as the name
of the package is already apparent from the message and its location should
be obvious. Hence, this patch simply reduces the print to "Patching".

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3b6bc76..75fda02 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -91,7 +91,7 @@ endif
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)
 $(BUILD_DIR)/%/.stamp_patched:
-	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
+	@$(call MESSAGE,"Patching")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(notdir $(p))$(sep))
 	$(Q)( \
