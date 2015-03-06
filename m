From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  6 Mar 2015 07:42:48 -0300
Subject: [Buildroot] [PATCH] samba4: specify ncurses-config
Message-ID: <1425638568-1345-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When ncurses wide is enabled samba doesn't automatically find the
appropiate ncurses-config script and finds the host variant (which is
non-widec) which leaks improper library directories into the build.

samba4: specify ncurses-config
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index e4c9ef2..527d584 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -64,6 +64,7 @@ SAMBA4_CONF_OPTS += --disable-gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_FORM)$(BR2_PACKAGE_NCURSES_TARGET_MENU)$(BR2_PACKAGE_NCURSES_TARGET_PANEL),yyy)
+SAMBA4_CONF_ENV += NCURSES_CONFIG="$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)"
 SAMBA4_DEPENDENCIES += ncurses
 else
 SAMBA4_CONF_OPTS += --without-regedit
-- 
2.0.5
