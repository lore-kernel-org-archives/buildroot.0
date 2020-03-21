From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 18:54:43 +0100
Subject: [Buildroot] [git commit] package/screen: add linux-pam optional
 dependency
Message-ID: <20200321174151.6F38783A42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c685bded08f02ded5d45136e7a1328354bf6515f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linux-pam is an optional dependency for more than 5 years:
https://git.savannah.gnu.org/cgit/screen.git/commit/src/configure.ac?h=screen-v4&id=a8dc1fb5b47ee52c79884fc5270805a3a39cda4a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/screen/screen.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 055dc015c0..c1705f742d 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -14,6 +14,13 @@ SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
 SCREEN_CONF_OPTS = --enable-colors256
 SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+SCREEN_DEPENDENCIES += linux-pam
+SCREEN_CONF_OPTS += --enable-pam
+else
+SCREEN_CONF_OPTS += --disable-pam
+endif
+
 define SCREEN_INSTALL_SCREENRC
 	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
 endef
