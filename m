From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 23:45:31 +0100
Subject: [Buildroot] [git commit] package/spidermonkey: depends on host gcc
 >= 4.9
Message-ID: <20191206223708.6D6D888530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7d117a7b8169f28b91e662ecdd52231da04e5fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If GCC on the host is older than 4.9, during the configure stage an
error is thrown such as:

checking whether the host C compiler can be used... no
ERROR: Only GCC 4.9 or newer is supported (found version 4.8.2).

Depend on the host gcc version being >= 4.9

Fixes:
http://autobuild.buildroot.net/results/192661452fd522bf46b23d5a7a522eb853a984bf

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spidermonkey/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/spidermonkey/Config.in b/package/spidermonkey/Config.in
index 284502f618..5f12110626 100644
--- a/package/spidermonkey/Config.in
+++ b/package/spidermonkey/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_SPIDERMONKEY_JIT_ARCH_SUPPORTS
 
 config BR2_PACKAGE_SPIDERMONKEY
 	bool "spidermonkey"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
@@ -43,5 +44,6 @@ comment "spidermonkey needs a glibc or musl toolchain with C++, wchar, dynamic l
 		!BR2_INSTALL_LIBSTDCPP || \
 		BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_USE_WCHAR
