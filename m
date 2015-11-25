From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 21:38:44 +0100
Subject: [Buildroot] [git commit] iodine: use correct CFLAGS/LDFLAGS
Message-ID: <20151125210443.CA03581EAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc792014f6156cc98969755d21d39e4c2adde96c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The iodine build system correctly appends the needed CFLAGS/LDFLAGS to what
was passed in the environment, so use TARGET_CONFIGURE_OPTS to ensure our
flags are passed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iodine/iodine.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iodine/iodine.mk b/package/iodine/iodine.mk
index 57deb9e..3239249 100644
--- a/package/iodine/iodine.mk
+++ b/package/iodine/iodine.mk
@@ -11,7 +11,7 @@ IODINE_LICENSE = MIT
 IODINE_LICENSE_FILES = README
 
 define IODINE_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" ARCH=$(BR2_ARCH) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(BR2_ARCH) -C $(@D)
 endef
 
 define IODINE_INSTALL_TARGET_CMDS
