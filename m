From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 21:58:07 +0200
Subject: [Buildroot] [git commit] fbterm: uses fork(), needs mmu
Message-ID: <20160615195914.6352B80469@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa44cdb5cd9f07f6920fa1c206538ff1886c2d34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/7d7/7d7081e7ce6e2be71b8df3b6213142c5ceeeccce/
http://autobuild.buildroot.org/results/54c/54cc2f443eddc1459b2006683f001d473ba65924/

And at the same time, cleanup the 'depends on' lines.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fbterm/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/fbterm/Config.in b/package/fbterm/Config.in
index 2c9d6d4..3ab8bdb 100644
--- a/package/fbterm/Config.in
+++ b/package/fbterm/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_FBTERM
 	bool "fbterm"
-	depends on (BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_ENABLE_LOCALE
+	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_LIBERATION
 	help
@@ -10,4 +13,5 @@ config BR2_PACKAGE_FBTERM
 	  http://code.google.com/p/fbterm/
 
 comment "fbterm needs a toolchain w/ C++, wchar, locale"
+	depends on BR2_USE_MMU
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
