From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  9 Jun 2015 15:15:24 +0300
Subject: [Buildroot] [PATCH] olsr: needs dynamic library support
Message-ID: <b84e74375866d7dd0a72e6f1d6fd9b2bbcdeb2f6.1433852124.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/08a/08a29bc48667f10d6dce4cb5cbb1ae6bec009e2c/
http://autobuild.buildroot.net/results/33e/33e69998d152f819176c7aa3028a962dd32c1daf/
http://autobuild.buildroot.net/results/e7a/e7aabfc9e80bd36958c6deeb5b02d5ef97629ae4/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/olsr/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/olsr/Config.in b/package/olsr/Config.in
index 70e5a4896331..a49c4e0f1085 100644
--- a/package/olsr/Config.in
+++ b/package/olsr/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OLSR
 	bool "olsrd"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	help
 	  The Optimized Link State Routing protocol (OLSR) is a
 	  routing protocol that is optimised for mobile ad-hoc
@@ -12,6 +13,6 @@ config BR2_PACKAGE_OLSR
 
 	  http://www.olsr.org/
 
-comment "olsr needs a toolchain w/ threads"
+comment "olsr needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.1.4
