From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 May 2014 23:25:19 +0200
Subject: [Buildroot] [git commit] zyre: propagate missing BR2_USE_MMU
	dependency
Message-ID: <20140517213137.1D3309C7C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07882dc3eacbc1cd3613676dc4c5ca8787dbfa17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zyre selects filemq, and filemq 'depends on BR2_USE_MMU', but this
dependency was not propagated to zyre. This commit fixes that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zyre/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/zyre/Config.in b/package/zyre/Config.in
index 5833ccc..31e1d6f 100644
--- a/package/zyre/Config.in
+++ b/package/zyre/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_ZYRE
 	depends on BR2_LARGEFILE # filemq
 	depends on BR2_USE_WCHAR # filemq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # filemq
+	depends on BR2_USE_MMU # filemq -> czmq
 	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
 	# support, needed by filemq -> czmq
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
@@ -17,6 +18,7 @@ config BR2_PACKAGE_ZYRE
 	  http://zyre.org
 
 comment "zyre needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
 		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
