From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 20 Aug 2018 15:09:06 +0200
Subject: [Buildroot] [[PATCH v2 06/14] package/mender: select
 BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
In-Reply-To: <20180820130914.22377-1-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
Message-ID: <20180820130914.22377-7-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Mender client uses fw_printenv/fw_setenv to manipulate the U-boot
environment, e.g to change the boot candidate after a update has been
done.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---

Changes in V2:
- Added #runtime to hint that this not a build dependency

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
--
2.11.0
