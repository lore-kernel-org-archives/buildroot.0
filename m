From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 21:12:29 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/qpdf: fix 'no
 such file' exeption
Message-ID: <20200510191328.DAF3191343@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=578f0936f2c2f36b585c24b4871d13958ffb47a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Without a source for randomness, qpdf will crash with 'no such file'
error. It's can me tested by command like 'qpd some_pdf.pdf -'.
This problem breaks cups printing.

This patch change configure options to '--with-random=/dev/urandom'

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
[yann.morin.1998 at free.fr: reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 69dfbbd33b2afab0814c5674b0bc7f5464941fbc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qpdf/qpdf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index ac703d716e..fd31140b0c 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -11,7 +11,7 @@ QPDF_LICENSE = Apache-2.0 or Artistic-2.0
 QPDF_LICENSE_FILES = LICENSE.txt Artistic-2.0
 QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
 
-QPDF_CONF_OPTS = --without-random
+QPDF_CONF_OPTS = --with-random=/dev/urandom
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 QPDF_CONF_OPTS += --enable-crypto-gnutls
