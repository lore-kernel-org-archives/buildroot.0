From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 28 Jul 2018 23:57:10 +0200
Subject: [Buildroot] [git commit] ghostscript: set correct font path on
 target
Message-ID: <20180728215530.1578D8A5E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a76eab228f0bde8597bb6431733e3e1a8d25f806
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GHOSTSCRIPT_FONTS_TARGET_DIR is set to $(TARGET_DIR)/usr/share/fonts/gs
in ghostscript-fonts.mk. If we pass this full path to ghostscript, it
will look for fonts in $(TARGET_DIR), which doesn't exist on the
target.

Instead of /usr/share/fonts/gs, use /usr/share/fonts so ghostscript can
also access other fonts than the ones installed by ghostscript-fonts.

Signed-off-by: Thomas Ehrhardt <tehrhardt@innovaphone.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
