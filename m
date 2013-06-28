From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 13:46:34 -0300
Subject: [Buildroot] [PATCH] gutenprint: forcibly disable ijs-config
Message-ID: <1372437994-28897-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ijs-config (ghostscript) is looked up in /usr/bin, if you've got a host
that has ghostscript with development headers installed then the build
fails when trying to link to the host libijs.
Forcibly disable ghostscript support since we lack a package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gutenprint/gutenprint.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index c9ac046..978675f 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -22,7 +22,8 @@ GUTENPRINT_DEPENDENCIES = cups host-pkgconf \
 # so we need to build both a host package and a target package
 GUTENPRINT_DEPENDENCIES += host-gutenprint
 
-GUTENPRINT_CONF_ENV = ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
+GUTENPRINT_CONF_ENV = ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config \
+	ac_cv_path_IJS_CONFIG=""
 
 GUTENPRINT_CONF_OPT = --disable-libgutenprintui2 \
                       --disable-samples \
-- 
1.8.1.5
