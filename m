From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 20:57:11 +0200
Subject: [Buildroot] [git commit] package/coreutils: rename
 COREUTILS_CLEANUP_BIN to a more sensible name
Message-ID: <20190620192137.C6C5D82283@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14644a66b60a4115f20f101f08966414852e446c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

COREUTILS_CLEANUP_BIN doesn't mean much, what it really does is fixing
the location of binaries, so let's rename to a more sensible name.

This is done in preparation to the introduction of support for
building coreutils as individual binaries.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coreutils/coreutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 8e5518f638..5e7e0c6ea0 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -96,14 +96,14 @@ COREUTILS_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),)
-define COREUTILS_CLEANUP_BIN
+define COREUTILS_FIX_BIN_LOCATION
 	# some things go in /bin rather than /usr/bin
 	$(foreach f,$(COREUTILS_BIN_PROGS), \
 		rm -f $(TARGET_DIR)/usr/bin/$(f) && \
 		ln -sf ../usr/bin/coreutils $(TARGET_DIR)/bin/$(f)
 	)
 endef
-COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP_BIN
+COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_FIX_BIN_LOCATION
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
