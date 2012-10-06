From: Valentine Barshak <gvaxon@gmail.com>
Date: Sun,  7 Oct 2012 00:35:36 +0400
Subject: [Buildroot] [PATCH] gqview: Fix build failure due to missing -lm
Message-ID: <1349555736-10008-1-git-send-email-gvaxon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 package/gqview/gqview.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index 2f64cd0..7d09fda 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -7,6 +7,7 @@ GQVIEW_VERSION = 2.1.5
 GQVIEW_SOURCE = gqview-$(GQVIEW_VERSION).tar.gz
 GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
 GQVIEW_DEPENDENCIES = host-pkg-config libgtk2
+GQVIEW_CONF_ENV = LIBS="-lm"
 
 $(eval $(autotools-package))
 
-- 
1.7.11.4
