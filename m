From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 May 2014 23:18:59 +0200
Subject: [Buildroot] [git commit] thrift: disable for ARC
Message-ID: <20140529212159.4C3909CE3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1aaa14d84f1c920423ed0286b78f64a2b4b2b575
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

thrift uses the __sync_fetch_and_add() atomic primitive that is not available
for ARC.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/thrift/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/thrift/Config.in b/package/thrift/Config.in
index a7f3479..ac99801 100644
--- a/package/thrift/Config.in
+++ b/package/thrift/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_THRIFT
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_arc # atomic builtins
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_OPENSSL
@@ -21,3 +22,4 @@ config BR2_PACKAGE_THRIFT
 comment "thrift needs a toolchain w/ C++, largefile, wchar, threads"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_arc
