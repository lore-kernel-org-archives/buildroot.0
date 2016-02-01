From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 19:59:55 +0100
Subject: [Buildroot] [git commit] strongswan: unavailable for static builds
Message-ID: <20160201224714.3E2B07F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c42cb74b02b5ca4499db65072b8a5a880e9414ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Uses dlopen in plugin_loader (not optional), fixes:
http://autobuild.buildroot.net/results/601/601d8dc1654d8733db49b195139e12437663034c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/strongswan/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index b26f1c7..cada78b 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -1,11 +1,12 @@
-comment "strongswan needs a toolchain w/ threads"
+comment "strongswan needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 menuconfig BR2_PACKAGE_STRONGSWAN
 	bool "strongswan"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	help
 	  strongSwan is an OpenSource IPsec implementation for the
 	  Linux operating system. It is based on the discontinued
