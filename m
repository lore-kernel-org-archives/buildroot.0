From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 20:53:05 +0200
Subject: [Buildroot] [git commit] fs: define per-rootfs directory
Message-ID: <20180331185351.DAAAD84BF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c7adf75d2220a1a762cf3b031e9efa7e5b431cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will serve in future commits to store pre-rootfs files, like
fakeroot script...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 19a975aa47..1915fbbe9b 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -39,6 +39,8 @@ ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 # all variable references except the arguments must be $$-quoted.
 define inner-rootfs
 
+ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
+
 # extra deps
 ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
 	$$(if $$(PACKAGES_USERS)$$(ROOTFS_USERS_TABLES),host-mkpasswd)
