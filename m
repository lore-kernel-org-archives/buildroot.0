From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:39:05 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libkrb5: fix
 build with NLS
Message-ID: <20190426130223.1042181470@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0e078567e680ad3ca85130a583bde3ccf8820e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/b35dd775015772b0f322f77470debe09d24173ff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 491b13def5a4dfce21e98becda1f2c6ea99e9fa0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libkrb5/libkrb5.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 5ba0ab1806..56345416aa 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -11,7 +11,7 @@ LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
 LIBKRB5_LICENSE = MIT
 LIBKRB5_LICENSE_FILES = NOTICE
-LIBKRB5_DEPENDENCIES = host-bison
+LIBKRB5_DEPENDENCIES = host-bison $(TARGET_NLS_DEPENDENCIES)
 LIBKRB5_INSTALL_STAGING = YES
 
 # The configure script uses AC_TRY_RUN tests to check for those values,
@@ -20,7 +20,8 @@ LIBKRB5_INSTALL_STAGING = YES
 LIBKRB5_CONF_ENV = \
 	ac_cv_printf_positional=yes \
 	ac_cv_func_regcomp=yes \
-	krb5_cv_attr_constructor_destructor=yes,yes
+	krb5_cv_attr_constructor_destructor=yes,yes \
+	LIBS=$(TARGET_NLS_LIBS)
 
 # Never use the host packages
 LIBKRB5_CONF_OPTS = \
