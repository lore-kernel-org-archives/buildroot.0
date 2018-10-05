From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 13:57:14 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] libxslt: point to the
 correct xml2-config location
Message-ID: <20181005115635.8D5FF8D2A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c44cc1c649811e5070a62f8579d6928ec153376f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Currently libxslt configure finds native /usr/bin/xml2-config.

Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f8f8ff33472641f9192a5e1ca65ebc614821665a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxslt/libxslt.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index f05bc5a70a..ae58e14a0e 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -13,7 +13,8 @@ LIBXSLT_LICENSE_FILES = COPYING
 LIBXSLT_CONF_OPTS = \
 	--with-gnu-ld \
 	--without-debug \
-	--without-python
+	--without-python \
+	--with-libxml-prefix=$(STAGING_DIR)/usr
 LIBXSLT_CONFIG_SCRIPTS = xslt-config
 LIBXSLT_DEPENDENCIES = host-pkgconf libxml2
 
