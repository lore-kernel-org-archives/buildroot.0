From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 11:25:40 +0200
Subject: [Buildroot] [git commit] thrift: Add dependency on atomic intrinsics
Message-ID: <20140803093227.9AE2A9D226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ebdc64dcc687a95dd4fed7eda8ff811d2db0eaf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thrift requires GCC built-in atomic functions which are architecture specific
and may not be implemented.

[Thomas: remove incorrect empty newline at end of Config.in.]

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/thrift/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/thrift/Config.in b/package/thrift/Config.in
index ac99801..23b99e5 100644
--- a/package/thrift/Config.in
+++ b/package/thrift/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_THRIFT
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_arc # atomic builtins
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_OPENSSL
@@ -19,7 +19,7 @@ config BR2_PACKAGE_THRIFT
 
 	  http://thrift.apache.org/
 
-comment "thrift needs a toolchain w/ C++, largefile, wchar, threads"
+comment "thrift needs a toolchain w/ C++, largefile, wchar, threads, atomic intrinsics"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_arc
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
