From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 23:20:16 +0200
Subject: [Buildroot] [git commit] package/kodi: remove
	BR2_PACKAGE_BOOST_ARCH_SUPPORTS option, 2nd try
Message-ID: <20160606212027.66F5C81D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=220c50c2213e343a2d2ac7e82f9a4f422891b820
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For whatever reason this commit
https://git.busybox.net/buildroot/commit/package/kodi?id=668ce456448d671f30bf98c4d4819a88b0bf9f4e
did not make it into the master branch preventing to select the Kodi
package in menuconfig.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index d9760ca..a44ef5a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
 		&& BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
-		&& BR2_PACKAGE_BOOST_ARCH_SUPPORTS \
 		&& BR2_TOOLCHAIN_HAS_SYNC_8
 
 comment "kodi needs a uClibc or (e)glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7, host gcc >= 4.6"
