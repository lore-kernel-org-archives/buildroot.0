From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 15 Sep 2016 08:39:57 +0200
Subject: [Buildroot] [PATCH v2 2/6] package/upmpdcli: requires GCC 4.7
In-Reply-To: <20160915064001.8684-1-joerg.krause@embedded.rocks>
References: <20160915064001.8684-1-joerg.krause@embedded.rocks>
Message-ID: <20160915064001.8684-3-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

upmpdcli now uses C++11 features, meaning the minimum usable GCC version
is 4.7.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/upmpdcli/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index e17330c..b075d7a 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_UPMPDCLI
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp -> libupnp
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	select BR2_PACKAGE_LIBMPDCLIENT
 	select BR2_PACKAGE_LIBUPNPP
 	help
@@ -13,6 +13,6 @@ config BR2_PACKAGE_UPMPDCLI
 
 	  http://www.lesbonscomptes.com/upmpdcli/
 
-comment "upmpdcli needs a toolchain w/ C++, threads, gcc >= 4.6"
+comment "upmpdcli needs a toolchain w/ C++, threads, gcc >= 4.7"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-- 
2.9.3
