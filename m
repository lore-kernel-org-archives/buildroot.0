From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 21:19:37 -0500
Subject: [Buildroot] [PATCH] package/aircrack-ng: powerpc arch requires
 altivec
Message-ID: <20180814021937.22330-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The powerpc support in this package requires an arch with altivec
accelerator support.  The package is currently just building powerpc
assuming a Power8\Altivec.

Fixes
http://autobuild.buildroot.net/results/87e82a5e8d0b1c1ff10ec3e59d25bcd56b329075

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/aircrack-ng/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index f3e2bc4ef1..48e743a174 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_AIRCRACK_NG
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_POWERPC_CPU_HAS_ALTIVEC  || \
+		!(BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le)
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
 	help
 	  A set of tools for auditing wireless networks
-- 
2.17.0
