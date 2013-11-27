From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 27 Nov 2013 07:37:53 +0200
Subject: [Buildroot] [PATCH] ecryptfs-utils: add a dependencies comment
Message-ID: <3a62ae6540e9a7763aa40489a1265d014f1e567c.1385530673.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ecryptfs-utils/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 4d00069..5c39013 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -21,3 +21,8 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	  for another method.
 
 	  http://ecryptfs.org
+
+comment "ecryptfs-utils needs a toolchain w/ largefile, threads"
+	depends on !BR2_avr32 && !BR2_microblaze && !BR2_arc && !BR2_xtensa
+	depends on BR2_USE_MMU
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.4.3
