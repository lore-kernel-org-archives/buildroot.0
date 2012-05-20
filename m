From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 May 2012 00:21:03 +0200
Subject: [Buildroot] [git commit branch/next] connman: bump version
Message-ID: <20120520222122.A0EB596D47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfba6613a261ccd91961361b6c0f1962572226fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/connman/Config.in  |    1 +
 package/connman/connman.mk |    9 +++------
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 118ad91..3373ec1 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CONNMAN
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_IPTABLES
+	select BR2_PACKAGE_GNUTLS
 	depends on !(BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32)
 	help
 	  The Connection Manager (ConnMan) project provides a daemon for
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 6b9bbe6..0aa7ec7 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,9 +4,9 @@
 #
 #######################################################
 
-CONNMAN_VERSION = 0.78
-CONNMAN_SITE = git://git.kernel.org/pub/scm/network/connman/connman.git
-CONNMAN_DEPENDENCIES = libglib2 dbus iptables
+CONNMAN_VERSION = 1.0
+CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
+CONNMAN_DEPENDENCIES = libglib2 dbus iptables gnutls
 CONNMAN_INSTALL_STAGING = YES
 CONNMAN_CONF_OPT += --localstatedir=/var \
 	$(if $(BR2_PACKAGE_CONNMAN_THREADS),--enable-threads,--disable-threads)		\
@@ -17,9 +17,6 @@ CONNMAN_CONF_OPT += --localstatedir=/var \
 	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback)	\
 	$(if $(BR2_PACKAGE_CONNMAN_NTPD),--enable-ntpd,--disable-ntpd)
 
-# as long as sources are obtained from git, we need to generate the autofoo stuff
-CONNMAN_AUTORECONF = YES
-
 define CONNMAN_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
 endef
