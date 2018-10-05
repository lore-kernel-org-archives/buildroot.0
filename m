From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 21:22:46 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] ghostscript: don't use
 lcms2art
Message-ID: <20181005192304.307988D4CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f8142b0e282bc89b7e209fb7a7a2049ca7e6921
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Delete lcsm2art directory to use the buildroot lcms2 library

Fixes:
 - http://autobuild.buildroot.net/results/cda9c22bf29278cc24ab852094df19b773d0f151

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b0bf1f5888eac726368c264c588ad5be33421efd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ghostscript/ghostscript.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 6ac8dc6a43..8ea6610be5 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -27,7 +27,8 @@ GHOSTSCRIPT_DEPENDENCIES = \
 # Inspired by linuxfromscratch:
 # http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
 define GHOSTSCRIPT_REMOVE_LIBS
-	rm -rf $(@D)/freetype $(@D)/ijs $(@D)/jpeg $(@D)/lcms2 $(@D)/libpng $(@D)/tiff $(@D)/zlib
+	rm -rf $(@D)/freetype $(@D)/ijs $(@D)/jpeg $(@D)/lcms2 \
+		$(@D)/lcms2art $(@D)/libpng $(@D)/tiff $(@D)/zlib
 endef
 GHOSTSCRIPT_POST_PATCH_HOOKS += GHOSTSCRIPT_REMOVE_LIBS
 
