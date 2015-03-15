From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 21:17:40 +0100
Subject: [Buildroot] [git commit] gnuradio: needs NPTL threads
Message-ID: <20150315201813.57C2E80455@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=917d11bae4822b149a0b04d121df5dc4904436df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/699/6994610a3283975064fae98e965954b3825ce694/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuradio/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 0bdc108..274afaa 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -1,7 +1,7 @@
-comment "gnuradio needs a toolchain w/ C++, IPV6, threads, largefile, wchar"
+comment "gnuradio needs a toolchain w/ C++, IPV6, NPTL, largefile, wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_LARGEFILE || \
 		!BR2_INET_IPV6
 
 config BR2_PACKAGE_GNURADIO
@@ -9,7 +9,7 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_INET_IPV6 # boost
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE # boost
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
 	select BR2_PACKAGE_BOOST
