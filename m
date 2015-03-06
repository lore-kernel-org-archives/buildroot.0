From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 12:38:45 +0100
Subject: [Buildroot] [git commit] samba4: specify ncurses-config
Message-ID: <20150306113907.1378F81822@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e55cddfe9e48193fc0d4b831e1e2c09b3937237e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When ncurses wide is enabled samba doesn't automatically find the
appropiate ncurses-config script and finds the host variant (which is
non-widec) which leaks improper library directories into the build.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/samba4.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
