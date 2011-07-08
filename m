From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 8 Jul 2011 14:19:36 +0200
Subject: [Buildroot] [git commit] libgtk2: fix host build after 7a41cbf938d
	(fix patching procedure for host packages)
Message-ID: <20110708122845.682778A41D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c94224930cbb2dd4377f9c0a061828fcc637b0e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NOHOSTPKG is no more, use RAWNAME instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libgtk2/libgtk2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 33ed727..be4531e 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -139,7 +139,7 @@ HOST_LIBGTK2_CONF_OPT = \
 		--disable-debug
 
 define HOST_LIBGTK2_PATCH_REDUCE_DEPENDENCIES_HOOK
- toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME) host-*.patch
+ toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) host-*.patch
 endef
 
 HOST_LIBGTK2_POST_PATCH_HOOKS += HOST_LIBGTK2_PATCH_REDUCE_DEPENDENCIES_HOOK
-- 
1.7.3.4
