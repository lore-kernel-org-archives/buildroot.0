From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 May 2014 21:19:18 +0200
Subject: [Buildroot] [git commit] libnss: Disable for MIPS64 n32 platforms
Message-ID: <20140516191946.435A79CC33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73e6ae0fe6a69f88183ae33401f2314088b5f799
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package fails to compile for MIPS64 n32 platforms. We are in
conversations with upstream to fix this problem. Meanwhile we disable
this package until we fix it.

Fixes:
   http://autobuild.buildroot.net/results/0e3/0e3f1482d6f2f9bddc53d4e78b575120a2729e1d/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ecryptfs-utils/Config.in |    1 +
 package/libnss/Config.in         |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

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
index 690f928..9a1668c 100644
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
@@ -18,3 +19,4 @@ config BR2_PACKAGE_LIBNSS
 comment "libnss needs a toolchain w/ largefile, threads"
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_MIPS_NABI32
