From: Grzegorz Blach <grzegorz@blach.pl>
Date: Fri, 18 Sep 2020 19:21:33 +0200
Subject: [Buildroot] [PATCH 2/2] package/graphicsmagick: remove redundant
 BR2_USE_WCHAR condition
In-Reply-To: <20200918172135.85009-1-grzegorz@blach.pl>
References: <20200918172135.85009-1-grzegorz@blach.pl>
Message-ID: <20200918172135.85009-2-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
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
 
-- 
2.28.0
