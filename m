From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 12:23:17 +0100
Subject: [Buildroot] [git commit] jasper: disable -pedantic-errors
Message-ID: <20161113112336.319E5800A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4605967780e9ecd14fba8100618963247ba72442
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The -pedantic-errors gcc option turns -pedantic warnings into errors. This
mostly affects older gcc versions that default to the ISO90 C standard. Use
the --disable-strict configure option to remove -pedantic-errors.

Fixes:
http://autobuild.buildroot.net/results/191/191f80779df1a9e6f832106e6c4bdf601e2a9893/
http://autobuild.buildroot.net/results/1fe/1febccc7215814490fa3c776b34bc367363afe39/
http://autobuild.buildroot.net/results/a6f/a6f9bfec3406fc21b130f1669e3534651b9c9596/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jasper/jasper.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 4616fed..bacb1a6 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -10,6 +10,7 @@ JASPER_INSTALL_STAGING = YES
 JASPER_DEPENDENCIES = jpeg
 JASPER_LICENSE = JasPer License Version 2.0
 JASPER_LICENSE_FILES = LICENSE
+JASPER_CONF_OPTS = --disable-strict
 
 # Xtensa gcc is unable to generate correct code with -O0 enabled by
 # --enable-debug. Allow package build but disable debug.
