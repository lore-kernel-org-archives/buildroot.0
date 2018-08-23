From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 22:10:55 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] ghostscript: set correct
 font path on target
Message-ID: <20180823200352.E9D588E44F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af0d7b3ebaec2d217d85db749196fe5de033bd0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

GHOSTSCRIPT_FONTS_TARGET_DIR is set to $(TARGET_DIR)/usr/share/fonts/gs
in ghostscript-fonts.mk. If we pass this full path to ghostscript, it
will look for fonts in $(TARGET_DIR), which doesn't exist on the
target.

Instead of /usr/share/fonts/gs, use /usr/share/fonts so ghostscript can
also access other fonts than the ones installed by ghostscript-fonts.

Signed-off-by: Thomas Ehrhardt <tehrhardt@innovaphone.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a76eab228f0bde8597bb6431733e3e1a8d25f806)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ghostscript/ghostscript.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index fcfb8d7058..8ea6610be5 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -40,7 +40,7 @@ GHOSTSCRIPT_CONF_OPTS = \
 	--disable-compile-inits \
 	--disable-cups \
 	--enable-fontconfig \
-	--with-fontpath=$(GHOSTSCRIPT_FONTS_TARGET_DIR) \
+	--with-fontpath=/usr/share/fonts \
 	--enable-freetype \
 	--disable-gtk \
 	--without-jbig2dec \
