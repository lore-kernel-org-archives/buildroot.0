From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 10:57:27 +0200
Subject: [Buildroot] [git commit] package/thrift: use the new
	ARCH_HAS_ATOMICS as dependency
Message-ID: <20140818090640.0D82D9D415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08a024b3ede7e2ce18204d8cab314b2ec6770b35
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/thrift/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/thrift/Config.in b/package/thrift/Config.in
index 23b99e5..7c7272a 100644
--- a/package/thrift/Config.in
+++ b/package/thrift/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_THRIFT
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+	depends on BR2_ARCH_HAS_ATOMICS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_OPENSSL
@@ -19,7 +19,7 @@ config BR2_PACKAGE_THRIFT
 
 	  http://thrift.apache.org/
 
-comment "thrift needs a toolchain w/ C++, largefile, wchar, threads, atomic intrinsics"
+comment "thrift needs a toolchain w/ C++, largefile, wchar, threads"
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
