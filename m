From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 22:01:43 +0200
Subject: [Buildroot] [git commit] package/graphicsmagick: remove
 BR2_USE_WCHAR condition for C++ support
Message-ID: <20200922195250.7DD2A8AA9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=894116a6e07541c654810ed042fc03ad3d04959e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While the imagemagick C++ support requires wchar, it is not the case
for the graphicsmagick C++ support, so we can drop the BR2_USE_WCHAR
condition when deciding whether or not GraphicsMagick++-config should
be tweaked.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/graphicsmagick/graphicsmagick.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index ab00ee2c9e..7e71870482 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -16,7 +16,7 @@ GRAPHICSMAGICK_CONFIG_SCRIPTS = GraphicsMagick-config GraphicsMagickWand-config
 # 0001-MNG-Fix-small-heap-overwrite-or-assertion.patch
 GRAPHICSMAGICK_IGNORE_CVES += CVE-2020-12672
 
-ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_USE_WCHAR),yy)
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GRAPHICSMAGICK_CONFIG_SCRIPTS += GraphicsMagick++-config
 endif
 
