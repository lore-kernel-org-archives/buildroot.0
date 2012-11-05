From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 5 Nov 2012 16:55:26 +0000
Subject: [Buildroot] [PATCH] BR2_PREFER_STATIC_LIB and LDFLAGS+= -static
Message-ID: <F9C551623D2CBB4C9488801D14F864C628A986@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes LDFLAGS from += -static to += --static if building
with BR2_PREFER_STATIC_LIB so that various components actually build
statically.

Signed-off-by: Andy Kennedy <andy.kennedy@adtran.com>
---
diff -Naur a/package/Makefile.in b/package/Makefile.in
--- a/package/Makefile.in       2012-08-31 03:49:41.000000000 -0500
+++ b/package/Makefile.in       2012-11-05 10:45:45.000000000 -0600
@@ -299,7 +299,7 @@

 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
-TARGET_LDFLAGS += -static
+TARGET_LDFLAGS += --static
 else
 SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
 endif
 
