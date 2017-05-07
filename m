From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 May 2017 21:53:39 +0200
Subject: [Buildroot] [git commit] rpi-firmware: extend vcdbg architecture
	dependency comment
Message-ID: <20170507195639.BB03B82856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04829295c78bd49f4d6238f2ffdb03d744202932
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The main reason why vcdbg is only available on ARM is the fact that this is
a prebuilt ARM binary rather than the rpi-userland dependency, so adjust the
comment to clarify.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index a7fa1c3..da32b8e 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -67,7 +67,7 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
 	bool "vcdbg"
-	depends on BR2_arm # rpi-userland
+	depends on BR2_arm # prebuilt arm binary, rpi-userland
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_INSTALL_LIBSTDCPP # rpi-userland
 	select BR2_PACKAGE_RPI_USERLAND
