From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon, 23 Sep 2019 22:15:42 -0300
Subject: [Buildroot] [PATCH v2] package/cups-filters: select bash
Message-ID: <20190924011542.12831-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The following files installed by cups-filters are bash scripts:

    /usr/lib/cups/filter/brftoembosser
    /usr/lib/cups/filter/imageubrltoindexv3
    /usr/lib/cups/filter/imageubrltoindexv4
    /usr/lib/cups/filter/textbrftoindexv3
    /usr/lib/cups/filter/imagetobrf
    /usr/lib/cups/filter/vectortopdf
    /usr/lib/cups/filter/vectortobrf
    /usr/lib/cups/filter/texttobrf
    /usr/lib/cups/filter/brftopagedbrf
    /usr/lib/cups/filter/musicxmltobrf

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
Changes v1->v2:
- fix typo in commit message (cips->cups)
---
 package/cups-filters/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
index 5badf0e1f1..bb54bc1d1b 100644
--- a/package/cups-filters/Config.in
+++ b/package/cups-filters/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_CUPS_FILTERS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_CUPS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	select BR2_PACKAGE_BASH
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
-- 
2.18.1
