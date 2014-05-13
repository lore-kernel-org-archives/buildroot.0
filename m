From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 13 May 2014 09:22:03 +0100
Subject: [Buildroot] [PATCH] libnss: Disable for MIPS64 n32 platforms
Message-ID: <1399969323-9290-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package fails to compile for MIPS64 n32 platforms. We are in
conversations with upstream to fix this problem. Meanwhile we disable
this package until we fix it.

Fixes:
   http://autobuild.buildroot.net/results/0e3/0e3f1482d6f2f9bddc53d4e78b575120a2729e1d/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ecryptfs-utils/Config.in |    1 +
 package/libnss/Config.in         |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 62cf6c8..076e1d4 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	depends on BR2_LARGEFILE # libnss
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
+	depends on !BR2_MIPS_NABI32 # libnss
 	help
 	  eCryptfs is a POSIX-compliant enterprise cryptographic
 	  filesystem for Linux. It is stacked on top of any other
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 690f928..4e7db5c 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBNSS
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
+	depends on !BR2_MIPS_NABI32
 	help
 	  Network Security Services (NSS) is a set of libraries designed
 	  to support development of security-enabled client and server
-- 
1.7.1
