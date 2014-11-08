From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Nov 2014 10:39:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/dovecot: Adjust LIBDOVECOT in
	dovecot-config to STAGING_DIR
Message-ID: <1415439548-3290-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/3e6/3e6c258d7636fedbb87ba62069094291666e6a85/
http://autobuild.buildroot.net/results/410/410b68afece06ddb03a00245cfdc3de4d9a4e5f1/
http://autobuild.buildroot.net/results/bd3/bd37ee92eeb00adb1558dbb61315465a0cdfe635/
http://autobuild.buildroot.net/results/fd1/fd18c3678eded431476b4e61a10c48e160ffd51a//
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/dovecot.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index fd597ee..a60dd4d 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -90,6 +90,7 @@ DOVECOT_POST_CONFIGURE_HOOKS += DOVECOT_POST_CONFIGURE
 # DOVECOT_CONFIG_SCRIPTS can not be used to rewrite paths
 define DOVECOT_FIX_STAGING_DOVECOT_CONFIG
 	$(SED) 's,^LIBDOVECOT_INCLUDE=.*$$,LIBDOVECOT_INCLUDE=\"-I$(STAGING_DIR)/usr/include/dovecot\",' $(STAGING_DIR)/usr/lib/dovecot-config
+	$(SED) 's,^LIBDOVECOT=.*$$,LIBDOVECOT=\"-L$(STAGING_DIR)/usr/lib -ldovecot\",' $(STAGING_DIR)/usr/lib/dovecot-config
 endef
 
 DOVECOT_POST_INSTALL_STAGING_HOOKS += DOVECOT_FIX_STAGING_DOVECOT_CONFIG
-- 
1.7.10.4
