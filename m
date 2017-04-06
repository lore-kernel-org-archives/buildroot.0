From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:43:29 +0200
Subject: [Buildroot] [git commit] tesseract-ocr: fix typo in variable name
Message-ID: <20170406204348.706C97FCED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a51b54fba97ae794b36930dbb77ba618d000f9c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TESSERACT_OCF_CONF_OPTS
            ^

Found using [1]:
check-package --include-only TypoInPackageVariable $(find * -type f)
and manually fixed.

[1] http://patchwork.ozlabs.org/patch/729672/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tesseract-ocr/tesseract-ocr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index 76ca930..9e315b2 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -20,7 +20,7 @@ TESSERACT_OCR_DEPENDENCIES = leptonica host-pkgconf
 TESSERACT_OCR_INSTALL_STAGING = YES
 TESSERACT_OCR_CONF_ENV = \
 	LIBLEPT_HEADERSDIR=$(STAGING_DIR)/usr/include/leptonica
-TESSERACT_OCF_CONF_OPTS = \
+TESSERACT_OCR_CONF_OPTS = \
 	--disable-opencl
 
 # Language data files download
