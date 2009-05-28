From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 May 2009 14:24:20 +0200
Subject: [Buildroot] [git commit] target/ubifsroot: mark as broken
Message-ID: <20090528122651.DB23977839@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77fad2fd74867d6d6bf77a52a1fc41379fa803c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


It should get fixed to use mkfs.ubifs from mtd-utils, but that's
probably unrealistic before the 2009.05 release, so mark as broken
for now.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/ubifs/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/target/ubifs/Config.in b/target/ubifs/Config.in
index 90ebfd9..886c34b 100644
--- a/target/ubifs/Config.in
+++ b/target/ubifs/Config.in
@@ -1,5 +1,6 @@
 config BR2_TARGET_ROOTFS_UBIFS
 	bool "ubifs root filesystem"
+	depends on BROKEN # upstream git gone, should use mtd-utils
 	select BR2_HOST_FAKEROOT
 	help
 	  Build a ubifs root filesystem
-- 
1.6.0.6
