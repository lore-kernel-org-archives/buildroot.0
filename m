From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Sep 2018 18:56:13 +0200
Subject: [Buildroot] [git commit] libxslt: point to the correct xml2-config
 location
Message-ID: <20180922165711.90EE288872@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8f8ff33472641f9192a5e1ca65ebc614821665a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently libxslt configure finds native /usr/bin/xml2-config.

Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxslt/libxslt.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 972d5b80d5..5b1c0ae268 100644
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
 
