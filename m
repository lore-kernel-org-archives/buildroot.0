From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2019 11:29:34 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] package/cups-filters:
 disable Braille embosing filters
Message-ID: <20191001093500.646918444A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b952431bf3f3dd603a8fccf5a6249e6c62beabc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Otherwise they are installed even though the Braille support is not
built because it requires liblouis, which is not available.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3da92264c6dd693022d06fd2500878f7f5d492c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups-filters/cups-filters.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index b7a79bba81..fa7627ee96 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -16,6 +16,7 @@ CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
 CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
 	--disable-mutool \
 	--disable-foomatic \
+	--disable-braille \
 	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
 	--with-sysroot=$(STAGING_DIR) \
 	--with-pdftops=pdftops \
