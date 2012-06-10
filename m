From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Jun 2012 22:47:44 +0200
Subject: [Buildroot] [git commit] synergy: fix comment dependencies
Message-ID: <20120611053107.DBEA596ED0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=036377c954e68eb76e31f787074c6ab8c4fd9817
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Show comment if either C++ or wchar isn't available, not only if both
aren't.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/synergy/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index 7d8c54e..04351b7 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_SYNERGY
 	  http://synergy2.sourceforge.net/
 
 comment "synergy requires a toolchain with C++ and WCHAR support enabled"
-	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_XORG7 && !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
