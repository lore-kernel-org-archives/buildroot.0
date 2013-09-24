From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Sep 2013 13:35:49 +0200
Subject: [Buildroot] [git commit] rrdtool: fix build without threads support
Message-ID: <20130924114030.94DB09B861@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f16e9476f42d13021a352ca633c39e25fe3a547a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/f7a/f7ab00ddae121ccfc6d54f7eda8ea8ac6df359c2/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rrdtool/rrdtool.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 354cff6..fe5b872 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -15,7 +15,8 @@ RRDTOOL_INSTALL_STAGING = YES
 RRDTOOL_CONF_ENV = rd_cv_ieee_works=yes rd_cv_null_realloc=nope \
 			ac_cv_func_mmap_fixed_mapped=yes
 RRDTOOL_CONF_OPT = --disable-perl --disable-python --disable-ruby \
-			--disable-tcl --program-transform-name=''
+			--disable-tcl --program-transform-name='' \
+			$(if $(BR2_TOOLCHAIN_HAS_THREADS),,--disable-pthread)
 RRDTOOL_MAKE = $(MAKE1)
 
 define RRDTOOL_REMOVE_EXAMPLES
