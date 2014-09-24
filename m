From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 24 Sep 2014 23:08:51 +0200
Subject: [Buildroot] [PATCH] util-linux: disable all programs for host build
Message-ID: <1411592931-8237-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable all programs for host build using '--disable-all-programs'
as suggested by Thomas Petazzoni ([1]).

Build libs before patch:
build/host-util-linux-2.25.1/.libs/libsmartcols.so
build/host-util-linux-2.25.1/.libs/libuuid.so
build/host-util-linux-2.25.1/.libs/libfdisk.a
build/host-util-linux-2.25.1/.libs/libcommon.a

Build libs after patch:
build/host-util-linux-2.25.1/.libs/libuuid.so
build/host-util-linux-2.25.1/.libs/libcommon.a

[1] http://lists.busybox.net/pipermail/buildroot/2014-September/106933.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/util-linux/util-linux.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 28c96a7..86770be 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -94,12 +94,8 @@ UTIL_LINUX_CONF_OPT += \
 # and none of the util-linux utilities, so we disable all of them.
 HOST_UTIL_LINUX_CONF_OPT += \
 	--enable-libuuid \
-	--disable-agetty --disable-cramfs --disable-fallocate \
-	--disable-fsck --disable-libblkid --disable-libmount \
-	--disable-login --disable-mount --disable-more --disable-partx \
-	--disable-pivot_root --disable-rename --disable-schedutils \
-	--disable-su --disable-switch_root --disable-unshare \
-	--disable-uuidd --disable-wall --without-ncurses
+	--disable-libblkid --disable-libmount \
+	--disable-all-programs --without-ncurses
 
 # Avoid building the tools if they are disabled since we can't install on
 # a per-directory basis.
-- 
1.8.1.4
