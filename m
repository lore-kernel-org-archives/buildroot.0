From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Sat, 11 Apr 2020 12:40:20 +0300
Subject: [Buildroot] [PATCH 1/3] package/qpdf: fix 'no such file' exeption
In-Reply-To: <20200411094022.13773-1-skif@skif-web.ru>
References: <20200411094022.13773-1-skif@skif-web.ru>
Message-ID: <20200411094022.13773-2-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qpdf need '--with-random' option for proper work.
This problem broke cups printing.

Without it, app crashed with 'no such file' error.
It's can me tested by command like 'qpd some_pdf.pdf -'.

This patch change configure options to '--with-random=/dev/random'

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
 package/qpdf/qpdf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index ac703d716e..9368496069 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -11,7 +11,7 @@ QPDF_LICENSE = Apache-2.0 or Artistic-2.0
 QPDF_LICENSE_FILES = LICENSE.txt Artistic-2.0
 QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
 
-QPDF_CONF_OPTS = --without-random
+QPDF_CONF_OPTS += --with-random=/dev/random
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 QPDF_CONF_OPTS += --enable-crypto-gnutls
-- 
2.17.1
