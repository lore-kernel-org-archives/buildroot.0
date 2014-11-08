From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Nov 2014 23:03:45 +0100
Subject: [Buildroot] [git commit] package/*/*.mk: Fix indent
Message-ID: <20141108220742.B8FFEB32CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd44b9431291909185b60254909295f09eafb8ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix indent for LIBFOO_USERS and LIBFOO_PERMISSIONS  as per the manual example.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk           |    2 +-
 package/busybox/busybox.mk     |    4 ++--
 package/dbus/dbus.mk           |    2 +-
 package/exim/exim.mk           |    2 +-
 package/openntpd/openntpd.mk   |    2 +-
 package/openssh/openssh.mk     |    2 +-
 package/sudo/sudo.mk           |    2 +-
 package/tvheadend/tvheadend.mk |    2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 690ca3e..06c6601 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -88,7 +88,7 @@ BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_REMOVE_TOOLS
 endif
 
 define BIND_USERS
-named -1 named -1 * /etc/bind - - BIND daemon
+	named -1 named -1 * /etc/bind - - BIND daemon
 endef
 
 $(eval $(autotools-package))
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 98d1bd1..0ceaab1 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -50,8 +50,8 @@ BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
 BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
 define BUSYBOX_PERMISSIONS
-/bin/busybox			 f 4755	0 0 - - - - -
-/usr/share/udhcpc/default.script f 755  0 0 - - - - -
+	/bin/busybox			 f 4755	0 0 - - - - -
+	/usr/share/udhcpc/default.script f 755  0 0 - - - - -
 endef
 
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 197f052..519146c 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -11,7 +11,7 @@ DBUS_LICENSE_FILES = COPYING
 DBUS_INSTALL_STAGING = YES
 
 define DBUS_PERMISSIONS
-/usr/libexec/dbus-daemon-launch-helper f 4755 0 0 - - - - -
+	/usr/libexec/dbus-daemon-launch-helper f 4755 0 0 - - - - -
 endef
 
 define DBUS_USERS
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 77f51e3..ba184f0 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -105,7 +105,7 @@ define EXIM_INSTALL_TARGET_CMDS
 endef
 
 define EXIM_USERS
-exim 88 mail 8 * - - - exim
+	exim 88 mail 8 * - - - exim
 endef
 
 define EXIM_INSTALL_INIT_SYSV
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 3441c8b..38526dd 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -16,7 +16,7 @@ define OPENNTPD_INSTALL_INIT_SYSV
 endef
 
 define OPENNTPD_USERS
-_ntp -1 _ntp -1 * - - - Network Time Protocol daemon
+	_ntp -1 _ntp -1 * - - - Network Time Protocol daemon
 endef
 
 $(eval $(autotools-package))
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 4b16c34..d08b468 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -13,7 +13,7 @@ OPENSSH_CONF_OPTS = --sysconfdir=/etc/ssh --disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip
 
 define OPENSSH_USERS
-sshd -1 sshd -1 * - - - SSH drop priv user
+	sshd -1 sshd -1 * - - - SSH drop priv user
 endef
 
 # uClibc toolchain for ARC doesn't support PIE at the moment
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 9a294f1..283a40c 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -29,7 +29,7 @@ endef
 SUDO_POST_CONFIGURE_HOOKS += SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
 
 define SUDO_PERMISSIONS
-/usr/bin/sudo			 f 4755	0 0 - - - - -
+	/usr/bin/sudo			 f 4755	0 0 - - - - -
 endef
 
 $(eval $(autotools-package))
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index bf4b064..0fd6eea 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -85,7 +85,7 @@ define TVHEADEND_INSTALL_INIT_SYSV
 endef
 
 define TVHEADEND_USERS
-tvheadend -1 tvheadend -1 * /home/tvheadend - video TVHeadend daemon
+	tvheadend -1 tvheadend -1 * /home/tvheadend - video TVHeadend daemon
 endef
 
 $(eval $(generic-package))
