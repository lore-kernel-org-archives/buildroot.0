From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Nov 2014 00:06:54 +0100
Subject: [Buildroot] [git commit] package/dovecot: Adjust LIBDOVECOT in
	dovecot-config to STAGING_DIR
Message-ID: <20141108230843.1610BB3814@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5278753c204477b465930c13868ff9da20eba75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/3e6/3e6c258d7636fedbb87ba62069094291666e6a85/
http://autobuild.buildroot.net/results/410/410b68afece06ddb03a00245cfdc3de4d9a4e5f1/
http://autobuild.buildroot.net/results/bd3/bd37ee92eeb00adb1558dbb61315465a0cdfe635/
http://autobuild.buildroot.net/results/fd1/fd18c3678eded431476b4e61a10c48e160ffd51a//
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
