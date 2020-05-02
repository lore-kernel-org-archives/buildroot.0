From: Baruch Siach <baruch@tkos.co.il>
Date: Sat,  2 May 2020 23:53:46 +0300
Subject: [Buildroot] [PATCH] package/ne10: correct cpu feature comment
 dependency
Message-ID: <77367b20073754b0d2f7e9bfd7e0ecab44922ef8.1588452826.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit e845f9364c2b8 ("ne10: bump to v1.2.1") removed arm arch
dependency from the comment. This comment is only relevant to arm.
Restore the arm arch dependency.

Cc: Cody Guldner <cody.guldner@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ne10/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ne10/Config.in b/package/ne10/Config.in
index 68cb7f4cb389..0e5a595dbed2 100644
--- a/package/ne10/Config.in
+++ b/package/ne10/Config.in
@@ -17,4 +17,5 @@ config BR2_PACKAGE_NE10
 	  http://projectne10.github.io/Ne10/
 
 comment "ne10 needs a toolchain w/ neon"
+	depends on BR2_arm
 	depends on !BR2_PACKAGE_NE10_ARCH_SUPPORTS
-- 
2.26.2
