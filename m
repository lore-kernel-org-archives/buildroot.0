From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 20 Apr 2021 10:29:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-vpu: fix {EULA,
 COPYING} file hashes
Message-ID: <20210420082953.12107-1-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

make legal-info fails on imx-vpu package:

>>> imx-vpu 5.4.39.3 Collecting legal info
ERROR: EULA has wrong sha256 hash:
ERROR: expected: a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc
ERROR: got     : 7ffad92e72e5f6b23027e7cf93a770a4acef00a92dcf79f22701ed401c5478c0
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

ERROR: COPYING has wrong sha256 hash:
ERROR: expected: 69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2
ERROR: got     : 2ceab29de5ea533b86f570bcc4e9ddbfb5fe85a1da4978a8613ff3fd9bed781d
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Fix the hashes of these two files.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 package/freescale-imx/imx-vpu/imx-vpu.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-vpu/imx-vpu.hash b/package/freescale-imx/imx-vpu/imx-vpu.hash
index 6ab67510b0..e3a53e3fb6 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.hash
+++ b/package/freescale-imx/imx-vpu/imx-vpu.hash
@@ -1,4 +1,4 @@
 # Locally computed
 sha256  87cb799a57df654db29403cb74a75ca5185a1517022d3a4a16b8d69056c36127  imx-vpu-5.4.39.3.bin
-sha256  69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
-sha256  a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
+sha256  2ceab29de5ea533b86f570bcc4e9ddbfb5fe85a1da4978a8613ff3fd9bed781d  COPYING
+sha256  7ffad92e72e5f6b23027e7cf93a770a4acef00a92dcf79f22701ed401c5478c0  EULA
-- 
2.26.3
