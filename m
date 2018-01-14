From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 14 Jan 2018 18:53:06 +0100
Subject: [Buildroot] [PATCH] swupdate: remove empty line
Message-ID: <20180114175306.18388-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported by Yann E. Morin running:

```
    $ ./utils/check-package package/swupdate/swupdate.mk
    package/swupdate/swupdate.mk:42: consecutive empty lines
    140 lines processed
    1 warnings generated
```

Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/swupdate/swupdate.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index d1afbc4882..aa232e5837 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -39,7 +39,6 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
 endif
 
-
 ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
 SWUPDATE_DEPENDENCIES += luainterpreter host-pkgconf
 # defines the base name for the pkg-config file ("lua" or "luajit")
-- 
2.15.1
