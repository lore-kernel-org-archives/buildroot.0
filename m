From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 22:05:08 +0100
Subject: [Buildroot] [git commit] imx-kobs: fix build for recent toolchains
Message-ID: <20160119210545.625F6827DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55e2b92b49b5adef2dc0706d0173a4345fbcb991
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with Linux 4.4 headers, mtd-user.h isn't including stdint.h any
more which breaks the build.

Fixes:

  http://autobuild.buildroot.net/results/05a/05a159c7f8382237d4c941b1bb6de7dad72708f3/

[Thomas:
 - fix minor typo in the patch description
 - add reference to the autobuilder failure, as suggested by Baruch.]

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-Fix-build-for-recent-toolchains.patch     | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/freescale-imx/imx-kobs/0002-Fix-build-for-recent-toolchains.patch b/package/freescale-imx/imx-kobs/0002-Fix-build-for-recent-toolchains.patch
new file mode 100644
index 0000000..c5cfb80
--- /dev/null
+++ b/package/freescale-imx/imx-kobs/0002-Fix-build-for-recent-toolchains.patch
@@ -0,0 +1,26 @@
+[PATCH] Fix build for recent toolchains
+
+Starting with Linux 4.4 headers, mtd-user.h isn't including stdint.h
+anymore which breaks the build.
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ src/BootControlBlocks.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/BootControlBlocks.h b/src/BootControlBlocks.h
+index 192eb61..aacdb64 100644
+--- a/src/BootControlBlocks.h
++++ b/src/BootControlBlocks.h
+@@ -20,6 +20,8 @@
+ #ifndef BOOTCONTROLBLOCKS_H_
+ #define BOOTCONTROLBLOCKS_H_
+ 
++#include <stdint.h>
++
+ #define NCB_FINGERPRINT1	0x504d5453	//!< 'STMP'
+ #define NCB_FINGERPRINT2	0x2042434e	//!< 'NCB<space>' - NAND Control Block
+ #define NCB_FINGERPRINT3	0x4e494252	//!< 'RBIN' - ROM Boot Image Block - N
+-- 
+2.6.4
+
