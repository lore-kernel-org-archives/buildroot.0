From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2019 11:29:46 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/cups-filters:
 disable Braille embosing filters
Message-ID: <20191001093456.EDD858437C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50aa6673f159fb589083f0420581d81f8e82f878
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

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
index 95f8f2068c..292c8e9be9 100644
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
