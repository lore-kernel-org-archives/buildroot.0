From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:45:21 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/openjpeg: add
 CVE-2020-15389 entry
Message-ID: <20200828174508.933898653F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ee1539bd04cd85b6a5bda02eef8bffddd4b529d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Commit b006cc373f96ec86c027779e113c8f70bc40d1c3 forgot to add
the OPENJPEG_IGNORE_CVES entry

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 77ef9c333cdc13d1a51d88dbad8c4459c2dca156)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjpeg/openjpeg.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index 1ff3111d64..b65dbce807 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -20,6 +20,9 @@ OPENJPEG_IGNORE_CVES += CVE-2020-6851
 # 0007-opj_tcd_init_tile-avoid-integer-overflow.patch
 OPENJPEG_IGNORE_CVES += CVE-2020-8112
 
+# 0008-opj_decompress-fix-double-free-on-input-directory-with-mix-of-valid.patch
+OPENJPEG_IGNORE_CVES += CVE-2020-15389
+
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
