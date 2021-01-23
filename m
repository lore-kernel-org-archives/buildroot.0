From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2021 22:21:36 +0100
Subject: [Buildroot] [git commit] package/gnuplot: drop gdlib-config
Message-ID: <20210123210233.DCFDB81601@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33fbea7f85c0a5229271bb34169dca5d9074d42b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop gdlib-config and use pkg-config to find gd.
Indeed, gdlib.pc is available since version 2.1.0 and
https://github.com/libgd/libgd/commit/071a2a94ee9f9e5ce00ff689dfe67a0fcb885ad6
and gdlib-config has been dropped from version 2.3.0

gnuplot supports pkg-config to find gd since version 5.4.1 and
https://sourceforge.net/p/gnuplot/gnuplot-main/ci/4a64124cf5e7bf7d6fd7be1f1a7b853c022678fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gnuplot/gnuplot.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 746831275a..bebaf1fa76 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -31,9 +31,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
 GNUPLOT_CONF_OPTS += --with-gd
-GNUPLOT_DEPENDENCIES += gd
-GNUPLOT_CONF_ENV += \
-	ac_cv_path_GDLIB_CONFIG=$(STAGING_DIR)/usr/bin/gdlib-config
+GNUPLOT_DEPENDENCIES += host-pkgconf gd
 else
 GNUPLOT_CONF_OPTS += --without-gd
 endif
