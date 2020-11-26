From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2020 17:10:02 +0100
Subject: [Buildroot] [git commit] package/efl: fix build with wepb
Message-ID: <20201126155846.5E43F87349@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=854ea9a98eebeedb9b2c05460994f29c0c9cea9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

webpdemux support in webp is mandatory since version 1.25.0 and
https://github.com/Enlightenment/efl/commit/df06418b6f39f3b8d73631bda33308b67736bb9d

Fixes:
 - http://autobuild.buildroot.org/results/736357e669c35bd56e818c0c7fabd1b455f40a5f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index e4e4c72161..d4a8762de0 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -256,6 +256,7 @@ config BR2_PACKAGE_EFL_TIFF
 config BR2_PACKAGE_EFL_WEBP
 	bool "libevas webp image loader"
 	select BR2_PACKAGE_WEBP
+	select BR2_PACKAGE_WEBP_DEMUX
 	help
 	  This enables the loader code that loads images using WebP.
 
