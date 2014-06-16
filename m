From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Mon, 16 Jun 2014 09:01:52 +0200
Subject: [Buildroot] [PATCH] imagemagick: Enable for host
Message-ID: <1402902112-12487-1-git-send-email-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows to use e.g. convert to generate files at build time.

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
---
 package/imagemagick/imagemagick.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index a6f3f45..ae191f1 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -119,3 +119,4 @@ IMAGEMAGICK_CONF_OPT += --without-bzlib
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.0.0
