From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Dec 2009 14:25:08 +0100
Subject: [Buildroot] [git commit master] package/autoconf: autoconf for the
	target needs m4 for the host
Message-ID: <20091204132633.17DEC777F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4fe7607b469716e7c27dc3ab7dca9e1a8d417934
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    2 +-
 package/autoconf/autoconf.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 75ad1bd..2307019 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2010.02, Not yet released:
 
-	Updated/fixed packages: busybox
+	Updated/fixed packages: autoconf, busybox
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 32f10e3..931d551 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -14,7 +14,7 @@ endif
 AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 		    ac_cv_prog_gnu_m4_gnu=no
 
-AUTOCONF_DEPENDENCIES = microperl
+AUTOCONF_DEPENDENCIES = microperl host-m4
 
 $(eval $(call AUTOTARGETS,package,autoconf))
 
-- 
1.6.3.3
