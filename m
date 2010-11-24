From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Nov 2010 22:32:15 +0100
Subject: [Buildroot] [git commit master 1/1] lrzsz: remove unneeded strip
Message-ID: <20101124213307.C89558DEB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9c69033480b52d9fd93ab35172e23e78e19d683a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Is handled generically in target-finalize and shouldn't be done in the
build directory.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lrzsz/lrzsz.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 2fce39c..e9b975f 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -33,7 +33,6 @@ endef
 
 define LRZSZ_BUILD_HOOKS
 	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" prefix="$(TARGET_DIR)" -C $(@D)
-	$(STRIPCMD) $(@D)/src/lrz $(@D)/src/lsz
 endef
 
 define LRZSZ_INSTALL_TARGET_CMDS
-- 
1.7.2.2
