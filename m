From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 22:43:39 +0200
Subject: [Buildroot] [git commit] system: default to devtmpfs for /dev
Message-ID: <20130915204538.C6FD09B766@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f1f9185e7bf5badca554c362ab8a37f04caff5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed on the list, devtmpfs is quite a bit nicer default than
the old static /dev, so change it.

Notice that you NEED to enable CONFIG_DEVTMPFS / CONFIG_DEVTMPFS_MOUNT
in the kernel configuration if you manually build a kernel outside
buildroot, otherwise the rootfs won't work.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 system/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 73986fb..9d4e837 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -68,7 +68,7 @@ config BR2_TARGET_GENERIC_PASSWD_METHOD
 
 choice
 	prompt "/dev management"
-	default BR2_ROOTFS_DEVICE_CREATION_STATIC
+	default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
 
 config BR2_ROOTFS_DEVICE_CREATION_STATIC
 	bool "Static using device table"
