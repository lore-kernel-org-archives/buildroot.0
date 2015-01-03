From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jan 2015 22:08:59 +0100
Subject: [Buildroot] [git commit] libsecret: bump to version 0.18
Message-ID: <20150103211007.8B82B803C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf2c54b25b8f6311fce81604a07d3d43ffbdfd3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsecret/libsecret.hash |    2 ++
 package/libsecret/libsecret.mk   |   15 +++++++--------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/libsecret/libsecret.hash b/package/libsecret/libsecret.hash
new file mode 100644
index 0000000..8e5bbf7
--- /dev/null
+++ b/package/libsecret/libsecret.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/GNOME/sources/libsecret/0.18/libsecret-0.18.sha256sum
+sha256	0c73aa762dbd1e38ba7b03de350e23ce818cb810b0784375e95ef61e004b02e3	libsecret-0.18.tar.xz
diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index a059a79..5a230ae 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -4,22 +4,21 @@
 #
 ################################################################################
 
-LIBSECRET_VERSION = 0.15
+LIBSECRET_VERSION = 0.18
 LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION)
 LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
-LIBSECRET_LICENSE = LGPLv2.1+
-LIBSECRET_LICENSE_FILES = COPYING
 LIBSECRET_INSTALL_STAGING = YES
-
 LIBSECRET_DEPENDENCIES = libglib2 host-intltool
 LIBSECRET_CONF_OPTS = --disable-manpages --disable-strict --disable-coverage --enable-vala=no
+LIBSECRET_LICENSE = LGPLv2.1+
+LIBSECRET_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-	LIBSECRET_DEPENDENCIES += libgcrypt
-	LIBSECRET_CONF_OPTS += --enable-gcrypt \
-		--with-libgcrypt-prefix=$(STAGING_DIR)/usr
+LIBSECRET_DEPENDENCIES += libgcrypt
+LIBSECRET_CONF_OPTS += --enable-gcrypt \
+	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
-	LIBSECRET_CONF_OPTS += --disable-gcrypt
+LIBSECRET_CONF_OPTS += --disable-gcrypt
 endif
 
 $(eval $(autotools-package))
