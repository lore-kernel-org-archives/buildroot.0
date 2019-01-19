From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 16:34:59 +0100
Subject: [Buildroot] [git commit] tesseract-ocr: disable documentation
Message-ID: <20190119153718.558F981796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebcb9103b6bf3f2408d5de38da33cac37da48441
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/a608e9bfb2b0161c45ae490e2866d96763593723

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tesseract-ocr/tesseract-ocr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index 0b92a1f3b5..74b344961f 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -19,6 +19,7 @@ TESSERACT_OCR_AUTORECONF = YES
 TESSERACT_OCR_DEPENDENCIES = leptonica host-pkgconf
 TESSERACT_OCR_INSTALL_STAGING = YES
 TESSERACT_OCR_CONF_ENV = \
+	ac_cv_prog_have_asciidoc=false \
 	LIBLEPT_HEADERSDIR=$(STAGING_DIR)/usr/include/leptonica
 TESSERACT_OCR_CONF_OPTS = \
 	--disable-opencl
