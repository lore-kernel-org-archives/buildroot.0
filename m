From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:16:09 +0200
Subject: [Buildroot] [git commit] gutenprint: forcibly disable ijs-config
Message-ID: <20130628195139.C05779B28F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=048b39db8234ac334478db6c8e9073f2f736a967
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ijs-config (ghostscript) is looked up in /usr/bin, if you've got a host
that has ghostscript with development headers installed then the build
fails when trying to link to the host libijs.
Forcibly disable ghostscript support since we lack a package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gutenprint/gutenprint.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
