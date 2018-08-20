From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:52:33 +0200
Subject: [Buildroot] [git commit] package/mender: select
 BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
Message-ID: <20180820144519.8468E8DE63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c60fa9f88ed20c98819dc777ef0e2ae09d7874b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Mender client uses fw_printenv/fw_setenv to manipulate the U-boot
environment, e.g to change the boot candidate after a update has been
done.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index e461857486..aeb0b2694f 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_UBOOT_TOOLS # runtime
+	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV # runtime
 	help
 	  Mender is an open source over-the-air (OTA) software updater
 	  for embedded Linux devices. Mender comprises a client
