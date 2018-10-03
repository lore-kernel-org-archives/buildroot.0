From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Oct 2018 09:38:34 +0200
Subject: [Buildroot] [git commit] package/ghostscript: fix removal of
 included lcms2
Message-ID: <20181003074357.0ECBA8A460@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5f83cfc885c4a9ea6d35d38b7d5a8eaf725aee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ghostscript 9.24 changed the internal lcms2 version:
https://www.ghostscript.com/doc/9.24/News.htm

With this change the directory name was also changed which broke our
code to force the usage of the buildroot lcms2 package.

Fixes
http://autobuild.buildroot.net/results/d04/d04ad017bf06a442a7397f935959994ba72824e1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ghostscript/ghostscript.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 9b5e144888..b1f5e1edb1 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -27,8 +27,8 @@ GHOSTSCRIPT_DEPENDENCIES = \
 # Inspired by linuxfromscratch:
 # http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
 define GHOSTSCRIPT_REMOVE_LIBS
-	rm -rf $(@D)/freetype $(@D)/ijs $(@D)/jpeg $(@D)/lcms2 \
-		$(@D)/lcms2art $(@D)/libpng $(@D)/tiff $(@D)/zlib
+	rm -rf $(@D)/freetype $(@D)/ijs $(@D)/jpeg $(@D)/lcms2mt \
+		$(@D)/libpng $(@D)/tiff $(@D)/zlib
 endef
 GHOSTSCRIPT_POST_PATCH_HOOKS += GHOSTSCRIPT_REMOVE_LIBS
 
