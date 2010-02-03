From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Feb 2010 15:14:43 +0100
Subject: [Buildroot] [git commit master] target/jffs2: Don't select
	BR2_PACKAGE_MTD
Message-ID: <20100203151851.1C94577761@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cb9da8512e94f14d5a6123ef6f3f9ba527a0d2e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mtd-utils on the target are not a requirement to using jffs2.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/jffs2/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/target/jffs2/Config.in b/target/jffs2/Config.in
index 108dfde..bcb4d51 100644
--- a/target/jffs2/Config.in
+++ b/target/jffs2/Config.in
@@ -1,7 +1,6 @@
 config BR2_TARGET_ROOTFS_JFFS2
 	bool "jffs2 root filesystem"
 	select BR2_HOST_FAKEROOT
-	select BR2_PACKAGE_MTD
 	help
 	  Build a jffs2 root filesystem
 
-- 
1.6.3.3
