From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 22:38:07 +0200
Subject: [Buildroot] [git commit] package/cwiid: wmgui needs gcc >= 4.8
Message-ID: <20190811210019.5D7728859D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ca090b5f684e7041fc209a1de0b35350a0e1446
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the harfbuzz bump to version 2.5.2 wmgui needs gcc >= 4.8.

Fixed typo in BR2_TOOLCHAIN_HAS_SYNC_4 comment.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cwiid/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 50c05ebd91..7ee8117355 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -14,7 +14,8 @@ config BR2_PACKAGE_CWIID
 if BR2_PACKAGE_CWIID
 config BR2_PACKAGE_CWIID_WMGUI
 	bool "wmgui"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_PACKAGE_XORG7 # libgtk2
 	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
