From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 12 Sep 2018 21:14:33 +0200
Subject: [Buildroot] [PATCH 1/1] feh: Fix dependency name
Message-ID: <20180912191433.16266-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: de2fe74e2a feh: xinemara is optional not mandatory

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/feh/feh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 6cfa73b242..ff611924d9 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -19,7 +19,7 @@ FEH_MAKE_OPTS += curl=0
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
-FEH_DEPENDENCIES += xlib_libXinemara
+FEH_DEPENDENCIES += xlib_libXinerama
 FEH_MAKE_OPTS += xinerama=1
 else
 FEH_MAKE_OPTS += xinerama=0
-- 
2.19.0
