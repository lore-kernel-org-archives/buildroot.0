From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 21:38:12 +0200
Subject: [Buildroot] [git commit] package/cups-filters: add image printing
 support
Message-ID: <20200501192506.915C08F358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59acde11f9f93e99df309b2ed7a14795bedbcfa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable image filters, to directly print images from cups.

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
[yann.morin.1998 at free.fr:
  - explicitly enable it, don;t rely on defaults
  -  reword commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cups-filters/cups-filters.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 3bb33d963c..1f17018bc5 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -11,10 +11,11 @@ CUPS_FILTERS_LICENSE_FILES = COPYING
 
 CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
 
-CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
+CUPS_FILTERS_CONF_OPTS = \
 	--disable-mutool \
 	--disable-foomatic \
 	--disable-braille \
+	--enable-imagefilters \
 	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
 	--with-sysroot=$(STAGING_DIR) \
 	--with-pdftops=pdftops \
