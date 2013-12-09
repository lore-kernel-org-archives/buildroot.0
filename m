From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 09 Dec 2013 11:39:01 +0800
Subject: [Buildroot] [PATCH] poppler: bump to version 0.24.4
Message-ID: <1386560341.2364.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upgrade to latest stable release.

Release 0.24.4
        core:
         * Fix regression in broken endstream detection. Bug #70854
         * Catalog: sort entries of NameTrees to make sure lookup works. Bug #26049
         * Don't infinite loop if reading from GooFile::read fails. Bug #71835

        utils:
         * pdftotext: Do not close stdout. Bug #71639
         * pdftotext: Silence warning for may be used uninitialized variable. Bug #71640
         * pdftotext: Escape the text of the xml headers
         * Warn the user if he provides a wrong range

        qt4:
         * Fix typo in xml API. Bug #71643

        qt5:
         * Fix typo in xml API. Bug #71643

Release 0.24.3
        core:
         * PSOutputDev: Fix PFB font embedding. Bug #69717
         * CairoOutputDev: Do not set an invalid matrix in drawImage(). Bug #70085

        qt4:
         * Don't crash if getXRef()->copy() fails

        qt5:
         * Don't crash if getXRef()->copy() fails

        utils:
         * pdfseparate: Allow only one %d in the filename. Bug #69434

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/poppler/poppler.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 56a4d3f..040327f 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.24.2
+POPPLER_VERSION = 0.24.4
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig
-- 
1.8.1.2
