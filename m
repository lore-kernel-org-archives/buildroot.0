From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Fri, 30 Apr 2010 02:24:11 +0200
Subject: [Buildroot] [PATCH 6/8] autoconf: added AUTOHEADER variable
In-Reply-To: <1272587053-19535-1-git-send-email-llandwerlin@gmail.com>
References: <1272587053-19535-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1272587053-19535-7-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

autoheader is used by autoreconf, therefor we need to give the right
path to this tools for host/target autoreconfiguration.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
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
1.7.0.4
