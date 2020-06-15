From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 15 Jun 2020 09:20:54 +0200
Subject: [Buildroot] [PATCH v2 14/14] systemd: remove util-linux dependencies
In-Reply-To: <20200615072055.2083-1-nolange79@gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
Message-ID: <20200615072055.2083-15-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd used only a small part of the util-linux binaries.
definitely needed are mount and umount from coreutils,
the rest of the tools could be provided by busybox aswell.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index a7f41d2a38..0fbc1de432 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -29,10 +29,8 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
-	select BR2_PACKAGE_UTIL_LINUX_BINARIES
 	select BR2_PACKAGE_UTIL_LINUX_AGETTY
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
-	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
 	select BR2_PACKAGE_UTIL_LINUX_FSCK
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
-- 
2.27.0
