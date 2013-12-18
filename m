From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Dec 2013 21:29:13 +0100
Subject: [Buildroot] [PATCH 5 of 6] udev: add missing comment for toolchain
 option dependencies
In-Reply-To: <patchbomb.1387398548@argentina>
References: <patchbomb.1387398548@argentina>
Message-ID: <75ed1479936b65a8dac9.1387398553@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/udev/Config.in |  4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/udev/Config.in b/package/udev/Config.in
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
