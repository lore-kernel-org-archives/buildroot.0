From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:47:54 +0100
Subject: [Buildroot] [git commit] libz160: fix dependencies
Message-ID: <20141207214813.EA1C0800F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b9e234de7a32bf692228cdc9669dc7bb41af12a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libz160 is provided as binary. We need EABI toolchain with glibc to use
it.

[Thomas: adjust dependency comment according to Yann suggestions.]

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/libz160/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/freescale-imx/libz160/Config.in b/package/freescale-imx/libz160/Config.in
index f956cce..cfbfb79 100644
--- a/package/freescale-imx/libz160/Config.in
+++ b/package/freescale-imx/libz160/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_LIBZ160
 	bool "libz160"
+	depends on BR2_ARM_EABI
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  An API for user space programs to perform 2D accelerated graphics
 	  operations on AMD GPU (included for examples in iMX5x chipsets)
+
+comment "libz160 needs an EABI toolchain w/ (e)glibc"
+	depends on !BR2_ARM_EABI || !BR2_TOOLCHAIN_USES_GLIBC
