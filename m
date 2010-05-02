From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 May 2010 09:41:29 +0200
Subject: [Buildroot] [git commit master] autoconf: add AUTOHEADER variable
Message-ID: <20100502074444.83A258A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e411497c3a364add13105a91a79b5a96b18378e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

autoheader is used by autoreconf, therefor we need to give the right
path to this tools for host/target autoreconfiguration.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/autoconf/autoconf.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index d82c2c5..b7c1fe4 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -17,7 +17,7 @@ AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 AUTOCONF_DEPENDENCIES = microperl host-m4
 
 HOST_AUTOCONF_CONF_ENV = ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
-                    	 ac_cv_prog_gnu_m4_gnu=no
+			ac_cv_prog_gnu_m4_gnu=no
 
 HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
 
@@ -26,4 +26,5 @@ $(eval $(call AUTOTARGETS,package,autoconf,host))
 
 # variables used by other packages
 AUTOCONF:=$(HOST_DIR)/usr/bin/autoconf
-AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" $(HOST_DIR)/usr/bin/autoreconf -v -f -i -I "$(ACLOCAL_DIR)"
+AUTOHEADER:=$(HOST_DIR)/usr/bin/autoheader
+AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOHEADER="$(AUTOHEADER)" $(HOST_DIR)/usr/bin/autoreconf -v -f -i -I "$(ACLOCAL_DIR)"
-- 
1.6.3.3
