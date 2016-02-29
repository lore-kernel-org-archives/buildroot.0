From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:45:16 +0100
Subject: [Buildroot] [git commit branch/next] package/kodi: enable samba
	support with uClibc toolchain
Message-ID: <20160229224522.DD24881836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89a195e6c701b4e9ec9bfab5aaa352d87cb0e6be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 09bd0cd..23468cc 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -191,12 +191,13 @@ config BR2_PACKAGE_KODI_LIBSHAIRPLAY
 comment "shairport support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
-comment "samba support needs an (e)glibc toolchain w/ RPC"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+comment "samba support needs a (e)glibc or uClibc toolchain w/ RPC"
+	depends on (!BR2_TOOLCHAIN_USES_GLIBC && \
+		!BR2_TOOLCHAIN_USES_UCLIBC) || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 
 config BR2_PACKAGE_KODI_LIBSMBCLIENT
 	bool "samba"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_SAMBA4
