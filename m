From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 14:31:17 +0200
Subject: [Buildroot] [git commit] package/libtorrent: requires RC4 support
 in openssl
Message-ID: <20210612120122.669B881205@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18b4b23a45550e50b60cc53504909e2788812f8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable RC4 in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/c909fedb5f59d8a434a3bde469155ff550615e3c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libtorrent/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
index 4787f9c60d..de6487a758 100644
--- a/package/libtorrent/Config.in
+++ b/package/libtorrent/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBTORRENT
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  BitTorrent library written in C++ for *nix
 
