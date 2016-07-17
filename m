From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jul 2016 15:06:17 +0200
Subject: [Buildroot] [git commit] directfb: depends on NPTL threading
Message-ID: <20160717130659.D1C0F81D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e27ade8e27b0a7e4dddef6000fb6a6d66f3f9d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes following autobuild failure:
http://autobuild.buildroot.net/results/162db0d62075a16c7abae1229676e2cdb29fe953/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas: as noticed yb Romain, propagate the new dependency to the
Config.in comment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index f0bcaaa..b552164 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_DIRECTFB
 	bool "directfb"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	depends on !BR2_TOOLCHAIN_USES_MUSL # sigval_t issue
@@ -161,7 +161,7 @@ config BR2_PACKAGE_DIRECTFB_TESTS
 
 endif # BR2_PACKAGE_DIRECTFB
 
-comment "directfb needs a glibc or uClibc toolchain w/ C++, threads, gcc >= 4.5"
+comment "directfb needs a glibc or uClibc toolchain w/ C++, NPTL, gcc >= 4.5"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || BR2_TOOLCHAIN_USES_MUSL
