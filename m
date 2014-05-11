From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 May 2014 10:51:28 +0200
Subject: [Buildroot] [git commit] fs: use our own tools when calling the
	fakerooted script
Message-ID: <20140511085201.8B6179CB0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89e16118b45c1bb8d112e8829d34e0883a6450be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

export PATH=$(BR_PATH) so that the fakerooted script uses our
own tools before any of the host-system ones.

Reported-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 47199c7..919db25 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -86,7 +86,7 @@ endif
 	PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
 	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
-	$$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
+	PATH=$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
