From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Dec 2015 21:48:41 +0100
Subject: [Buildroot] [git commit] libgudev: remove systemd dependency
Message-ID: <20151208210009.4D22481DDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6cfa5de33e71b46e9ae668550dc77aacabbde663
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 3.1.3 eudev doesn't provide internal libgudev,
so this package can now be used as an ordinary stand-alone
package.

[Peter: add BR2_PACKAGE_HAS_UDEV dependency]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgudev/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgudev/Config.in b/package/libgudev/Config.in
index 9b64ffc..ecaacf5 100644
--- a/package/libgudev/Config.in
+++ b/package/libgudev/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBGUDEV
 	bool "libgudev"
-	depends on BR2_INIT_SYSTEMD
+	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
@@ -16,7 +16,7 @@ config BR2_PACKAGE_LIBGUDEV
 
 	  https://wiki.gnome.org/Projects/libgudev
 
-comment "libgudev needs a toolchain w/ wchar, threads"
+comment "libgudev needs udev /dev handling and a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on BR2_INIT_SYSTEMD
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_PACKAGE_HAS_UDEV
