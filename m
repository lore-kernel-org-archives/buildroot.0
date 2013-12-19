From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 21:42:03 +0100
Subject: [Buildroot] [git commit] udev: add missing comment for toolchain
	option dependencies
Message-ID: <20131219204307.212269C0E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02dc29cbba8fe4c6657bedbecbdd0e65a3c31ff1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udev/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/udev/Config.in b/package/udev/Config.in
index 374a7bf..f4ffe98 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -43,3 +43,7 @@ endif
 comment "udev requires /dev mgmnt set to udev under System configuration"
 	depends on !BR2_avr32
 	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+
+comment "udev needs a toolchain w/ largefile, wchar, dynamic library"
+	depends on !BR2_avr32
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
