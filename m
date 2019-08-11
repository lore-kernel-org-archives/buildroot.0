From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 22:47:04 +0200
Subject: [Buildroot] [git commit] package/pcmanfm: needs gcc >= 4.8
Message-ID: <20190811210019.8AF4B8E897@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c99369deee02f550bd08faf136c031d77ad828c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the harfbuzz bump to version 2.5.2 we need gcc >= 4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcmanfm/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 69ddf00232..f281599637 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PCMANFM
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBFM
 	select BR2_PACKAGE_MENU_CACHE
 	select BR2_PACKAGE_LIBGLIB2
@@ -17,9 +18,10 @@ config BR2_PACKAGE_PCMANFM
 
 	  http://wiki.lxde.org/en/PCManFM
 
-comment "pcmanfm needs a toolchain w/ wchar, threads, C++"
+comment "pcmanfm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
