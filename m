From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 14:55:50 +0200
Subject: [Buildroot] [git commit] configs/bananapi_m64: needs host-openssl
Message-ID: <20190810131651.236CB7FAC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ffd019e01558fdadfc5f2a5b957d556794ab00a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel configuration used by the bananapi_m64_defconfig needs
host-openssl, otherwise it fails to build with:

  scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139123

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/bananapi_m64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
index ea01558973..5e56eaed85 100644
--- a/configs/bananapi_m64_defconfig
+++ b/configs/bananapi_m64_defconfig
@@ -36,6 +36,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-bananapi-m64"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M64"
