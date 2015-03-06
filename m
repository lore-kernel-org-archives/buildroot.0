From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 11:00:43 +0100
Subject: [Buildroot] [git commit] samba4: fix indentation
Message-ID: <20150306100152.DAC428080B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7152a50588e7eabfc4ba3bbe30e608fc2187e8bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation to the bump of samba4 to 4.2, let's re-indent the
samba4.mk to the usual Buildroot convention.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/samba4.mk |   48 +++++++++++++++++++++++-----------------------
 1 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index bd8ed12..3932124 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -14,59 +14,59 @@ SAMBA4_DEPENDENCIES = host-e2fsprogs host-heimdal e2fsprogs popt python zlib \
 	$(if $(BR2_PACKAGE_READLINE),readline)
 
 ifeq ($(BR2_PACKAGE_ACL),y)
-	SAMBA4_CONF_OPTS += --with-acl-support
-	SAMBA4_DEPENDENCIES += acl
+SAMBA4_CONF_OPTS += --with-acl-support
+SAMBA4_DEPENDENCIES += acl
 else
-	SAMBA4_CONF_OPTS += --without-acl-support
+SAMBA4_CONF_OPTS += --without-acl-support
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
-	SAMBA4_CONF_ENV += CUPS_CONFIG="$(STAGING_DIR)/usr/bin/cups-config"
-	SAMBA4_CONF_OPTS += --enable-cups
-	SAMBA4_DEPENDENCIES += cups
+SAMBA4_CONF_ENV += CUPS_CONFIG="$(STAGING_DIR)/usr/bin/cups-config"
+SAMBA4_CONF_OPTS += --enable-cups
+SAMBA4_DEPENDENCIES += cups
 else
-	SAMBA4_CONF_OPTS += --disable-cups
+SAMBA4_CONF_OPTS += --disable-cups
 endif
 
 ifeq ($(BR2_PACKAGE_LIBAIO),y)
-	SAMBA4_CONF_OPTS += --with-aio-support
-	SAMBA4_DEPENDENCIES += libaio
+SAMBA4_CONF_OPTS += --with-aio-support
+SAMBA4_DEPENDENCIES += libaio
 else
-	SAMBA4_CONF_OPTS += --without-aio-support
+SAMBA4_CONF_OPTS += --without-aio-support
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
-	SAMBA4_CONF_OPTS += --enable-avahi
-	SAMBA4_DEPENDENCIES += avahi
+SAMBA4_CONF_OPTS += --enable-avahi
+SAMBA4_DEPENDENCIES += avahi
 else
-	SAMBA4_CONF_OPTS += --disable-avahi
+SAMBA4_CONF_OPTS += --disable-avahi
 endif
 
 ifeq ($(BR2_PACKAGE_GAMIN),y)
-	SAMBA4_CONF_OPTS += --with-fam
-	SAMBA4_DEPENDENCIES += gamin
+SAMBA4_CONF_OPTS += --with-fam
+SAMBA4_DEPENDENCIES += gamin
 else
-	SAMBA4_CONF_OPTS += --without-fam
+SAMBA4_CONF_OPTS += --without-fam
 endif
 
 ifeq ($(BR2_PACKAGE_GETTEXT),y)
-	SAMBA4_CONF_OPTS += --with-gettext=$(STAGING_DIR)/usr
-	SAMBA4_DEPENDENCIES += gettext
+SAMBA4_CONF_OPTS += --with-gettext=$(STAGING_DIR)/usr
+SAMBA4_DEPENDENCIES += gettext
 else
-	SAMBA4_CONF_OPTS += --without-gettext
+SAMBA4_CONF_OPTS += --without-gettext
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-	SAMBA4_CONF_OPTS += --enable-gnutls
-	SAMBA4_DEPENDENCIES += gnutls
+SAMBA4_CONF_OPTS += --enable-gnutls
+SAMBA4_DEPENDENCIES += gnutls
 else
-	SAMBA4_CONF_OPTS += --disable-gnutls
+SAMBA4_CONF_OPTS += --disable-gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_FORM)$(BR2_PACKAGE_NCURSES_TARGET_MENU)$(BR2_PACKAGE_NCURSES_TARGET_PANEL),yyy)
-	SAMBA4_DEPENDENCIES += ncurses
+SAMBA4_DEPENDENCIES += ncurses
 else
-	SAMBA4_CONF_OPTS += --without-regedit
+SAMBA4_CONF_OPTS += --without-regedit
 endif
 
 define SAMBA4_CONFIGURE_CMDS
