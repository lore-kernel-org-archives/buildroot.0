From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Wed, 11 Nov 2015 20:40:26 +0100
Subject: [Buildroot] [PATCH] wine: Update download location
Message-ID: <564399AA.8030005@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---

Wine will soon switch away from Sourceforge and also will release 1.8 this year.
So to prepare for all that we should switch to the new Wine mirror on their own site.

 package/wine/wine.hash | 5 ++---
 package/wine/wine.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 71d633c..d1e3494 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,3 +1,2 @@
-# From http://sourceforge.net/projects/wine/files/Source/
-md5	0f6c56f86befe38e219090915f81f48a	wine-1.6.2.tar.bz2
-sha1	574b9ccedbf213622b7ee55f715764673fc27692	wine-1.6.2.tar.bz2
+# Locally calculated after checking pgp signature
+sha256 f0ab9eede5a0ccacbf6e50682649f9377b9199e49cf55641f1787cf72405acbe wine-1.6.2.tar.bz2
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index d6fb9c6..38576db 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -6,7 +6,7 @@
 
 WINE_VERSION = 1.6.2
 WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
-WINE_SITE = http://downloads.sourceforge.net/project/wine/Source
+WINE_SITE = https://dl.winehq.org/wine/source/1.6
 WINE_LICENSE = LGPLv2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_DEPENDENCIES = host-bison host-flex host-wine
-- 
1.9.1
