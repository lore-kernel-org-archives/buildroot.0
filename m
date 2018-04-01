From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  1 Apr 2018 19:27:39 +0200
Subject: [Buildroot] [PATCH] package/snort: select libdnet package
Message-ID: <20180401172739.31509-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"libdnet is in the dependency chain of snort that has added it to its
_DEPENDENCIES variable without selecting it or depending on it from
Config.in"

Fixes:
http://autobuild.buildroot.net/results/9cf/9cf5883d1ed95d3d76d529a9a25f0e600adf25cd

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/snort/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/snort/Config.in b/package/snort/Config.in
index d1a59d5050..7d2c52c3f3 100644
--- a/package/snort/Config.in
+++ b/package/snort/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_SNORT
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # daq
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	select BR2_PACKAGE_LIBDNET
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_DAQ
 	select BR2_PACKAGE_PCRE
-- 
2.14.3
