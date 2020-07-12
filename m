From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 10:16:47 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: drop legacy handling for
 BR2_PACKAGE_FIRMWARE_DDRFW_* options
Message-ID: <20200712081442.2EEC685B4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bd36489f3821a5326921cfb7011acb04f16fea1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These options were only added in commit
6bb7f3b81092e7005470c7d689a566dbc1d059c6, which was made after the
2020.05 release. So they are not part of any release at this point,
which makes legacy handling unnecessary.

Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8be7a9df91..7a5435188b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,20 +146,6 @@ endif
 
 comment "Legacy options removed in 2020.08"
 
-config BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4
-	bool "i.MX LPDDR4 option renamed"
-	select BR2_LEGACY
-	help
-	  The option BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4 was renamed to
-	  BR2_PACKAGE_FIRMWARE_IMX_LPDDR4.
-
-config BR2_PACKAGE_FIRMWARE_DDRFW_DDR4
-	bool "i.MX DDR4 option renamed"
-	select BR2_LEGACY
-	help
-	  The option BR2_PACKAGE_FIRMWARE_DDRFW_DDR4 was renamed to
-	  BR2_PACKAGE_FIRMWARE_IMX_DDR4.
-
 config BR2_BINUTILS_VERSION_2_31_X
 	bool "binutils version 2.31.1 support removed"
 	select BR2_LEGACY
