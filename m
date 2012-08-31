From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 31 Aug 2012 10:21:35 +0200
Subject: [Buildroot] [git commit] rrdtool: fix build with high BR2_JLEVEL
	settings
Message-ID: <20120831083509.B9DF6994E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8627654df717080a078d6022345226c255a3c418
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/3dc64c2d74c54c665f16649992052a39b1665d4d

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rrdtool/rrdtool.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 112ddf9..1057d5d 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -13,6 +13,7 @@ RRDTOOL_CONF_ENV = rd_cv_ieee_works=yes rd_cv_null_realloc=nope \
 			ac_cv_func_mmap_fixed_mapped=yes
 RRDTOOL_CONF_OPT = --disable-perl --disable-python --disable-ruby \
 			--disable-tcl --program-transform-name=''
+RRDTOOL_MAKE = $(MAKE1)
 
 define RRDTOOL_REMOVE_EXAMPLES
 	rm -rf $(TARGET_DIR)/usr/share/rrdtool/examples
