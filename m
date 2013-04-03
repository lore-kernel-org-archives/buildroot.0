From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Apr 2013 22:42:38 +0200
Subject: [Buildroot] [git commit] gnuplot: gd support needs libpng
Message-ID: <20130403204841.B9F899B467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18ff7e0503651aa5b76bc5ccb9c75ba6b85da2c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GD support in gnuplot needs PNG support in GD.
So make sure we are getting the full package to enable it, fixes:
http://autobuild.buildroot.net/results/678bd3babfcb3535e3a9ed1e111f741c3d3101f3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnuplot/gnuplot.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
