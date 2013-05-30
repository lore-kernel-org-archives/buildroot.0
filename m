From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 May 2013 21:52:01 +0200
Subject: [Buildroot] [git commit] libgtk2: remove useless post-patch hook
Message-ID: <20130602212114.5C8AC9A6A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4378648aaff35fffb04dc44b0cd5caf762c73737
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There used to be a post-patch hook to apply a patch only on the host
variant of libgtk2. However, after the reorganization of the patch
naming policy, this was no longer working properly, so
dd1848bc73ee9dfe211ca3ed3a233707e3bc5955 changed this by a patch that
works on both the target and host variants.

We can therefore get rid of the useless post-patch hook.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libgtk2/libgtk2.mk |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index b1ce99a..5881ea7 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -175,12 +175,6 @@ HOST_LIBGTK2_CONF_OPT = \
 		--disable-cups \
 		--disable-debug
 
-define HOST_LIBGTK2_PATCH_REDUCE_DEPENDENCIES_HOOK
- support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) host-*.patch
-endef
-
-HOST_LIBGTK2_POST_PATCH_HOOKS += HOST_LIBGTK2_PATCH_REDUCE_DEPENDENCIES_HOOK
-
 define HOST_LIBGTK2_BUILD_CMDS
  $(HOST_MAKE_ENV) make -C $(@D)/gtk gtk-update-icon-cache
 endef
