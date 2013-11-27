From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 27 Nov 2013 17:48:40 +0200
Subject: [Buildroot] [PATCH v3 2/2] ecryptfs-utils: add a dependencies
	comment
In-Reply-To: <3b85e7b21185d25eb6f40c25ac1402aa08b1bfeb.1385567320.git.baruch@tkos.co.il>
References: <3b85e7b21185d25eb6f40c25ac1402aa08b1bfeb.1385567320.git.baruch@tkos.co.il>
Message-ID: <06a33527176c557d461215dbc3f7318b7c433070.1385567320.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---

v3: depend on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT for libnspr arch dependencies
---
 package/ecryptfs-utils/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 4b34e0f..62cf6c8 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -21,3 +21,9 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	  for another method.
 
 	  http://ecryptfs.org
+
+comment "ecryptfs-utils needs a toolchain w/ largefile, threads"
+	depends on !BR2_avr32 && !BR2_microblaze
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
+	depends on BR2_USE_MMU
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.4.3
