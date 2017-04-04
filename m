From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue,  4 Apr 2017 19:50:17 -0300
Subject: [Buildroot] [PATCH 09/11] tesseract-ocr: fix typo in variable name
In-Reply-To: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
References: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
Message-ID: <20170404225019.27916-9-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TESSERACT_OCF_CONF_OPTS
            ^

Found using [1]:
check-package --include-only TypoInPackageVariable $(find * -type f)
and manually fixed.

[1] http://patchwork.ozlabs.org/patch/729672/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
From get-developers:
Cc: Gilles Talis <gilles.talis@gmail.com>

build-tested using:
$ echo BR2_PACKAGE_TESSERACT_OCR=y > tesseract-ocr.config
$ test-pkg -c tesseract-ocr.config -d /tmp/pkg/ -p tesseract-ocr
49 builds, 10 skipped, 0 failed
---
 package/tesseract-ocr/tesseract-ocr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index 76ca930d8..9e315b239 100644
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
-- 
2.11.0
