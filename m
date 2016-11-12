From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 12 Nov 2016 21:29:56 +0200
Subject: [Buildroot] [PATCH] jasper: disable -pedantic-errors
Message-ID: <72941ffb162f0bdf077c0dc15faaff86f4abfa88.1478978996.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The -pedantic-errors gcc option turns -pedantic warnings into errors. This
mostly affects older gcc versions that default to the ISO90 C standard. Use
the --disable-strict configure option to remove -pedantic-errors.

Fixes:
http://autobuild.buildroot.net/results/191/191f80779df1a9e6f832106e6c4bdf601e2a9893/
http://autobuild.buildroot.net/results/1fe/1febccc7215814490fa3c776b34bc367363afe39/
http://autobuild.buildroot.net/results/a6f/a6f9bfec3406fc21b130f1669e3534651b9c9596/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/jasper/jasper.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 4616fed1885d..bacb1a6cfebb 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -10,6 +10,7 @@ JASPER_INSTALL_STAGING = YES
 JASPER_DEPENDENCIES = jpeg
 JASPER_LICENSE = JasPer License Version 2.0
 JASPER_LICENSE_FILES = LICENSE
+JASPER_CONF_OPTS = --disable-strict
 
 # Xtensa gcc is unable to generate correct code with -O0 enabled by
 # --enable-debug. Allow package build but disable debug.
-- 
2.10.2
