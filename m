From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Dec 2015 21:31:05 +0100
Subject: [Buildroot] [git commit] directfb: disable for sparc
Message-ID: <20151204205652.A7C5881D36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3e53aca96153f74f0718818b5a270e8f889d23f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Requires atomic operations.
Fixes following autobuild failure:
http://autobuild.buildroot.net/results/8205100c166659c47daff66b1e63edc82eeb7930/

[Peter: also hide toolchain comment]
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 8c13d30..2d09460 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_DIRECTFB
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	depends on !BR2_TOOLCHAIN_USES_MUSL # sigval_t issue
+	depends on !BR2_sparc # needs atomic operation __sync_fetch_and_add
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_ZLIB
 	help
@@ -166,5 +167,6 @@ config BR2_PACKAGE_DIRECTFB_TESTS
 endif # BR2_PACKAGE_DIRECTFB
 
 comment "directfb needs a (e)glibc or uClibc toolchain w/ C++, threads, gcc >= 4.5"
+	depends on !BR2_sparc # needs atomic operation __sync_fetch_and_add
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || BR2_TOOLCHAIN_USES_MUSL
