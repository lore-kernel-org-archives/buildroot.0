From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  3 Apr 2013 08:04:23 -0300
Subject: [Buildroot] [PATCH] gnuplot: gd support needs libpng
Message-ID: <1364987063-6252-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GD support in gnuplot needs PNG support in GD.
So make sure we are getting the full package to enable it, fixes:
http://autobuild.buildroot.net/results/678bd3babfcb3535e3a9ed1e111f741c3d3101f3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnuplot/gnuplot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index a68c7ae..25ba90d 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -24,7 +24,7 @@ GNUPLOT_CONF_OPT = --without-x \
 		--without-latex \
 	        --without-cairo
 
-ifeq ($(BR2_PACKAGE_GD),y)
+ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
 GNUPLOT_CONF_OPT += --with-gd
 GNUPLOT_DEPENDENCIES += gd
 GNUPLOT_CONF_ENV += \
-- 
1.8.1.5
