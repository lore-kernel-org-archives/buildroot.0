From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 23:41:45 +0200
Subject: [Buildroot] [git commit] glib-networking: bump to version 2.42.1
Message-ID: <20150331214154.BEEC17FEB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e032d8dcafdb97f2b874f47f6651fd7ab5a21480
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash file and drop libgcrypt tweak since it's no longer required.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glib-networking/glib-networking.hash |    2 ++
 package/glib-networking/glib-networking.mk   |   11 ++---------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
new file mode 100644
index 0000000..0d85782
--- /dev/null
+++ b/package/glib-networking/glib-networking.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.42/glib-networking-2.42.1.sha256sum
+sha256	c06bf76da3353695fcc791b7b02e5d60c01c379e554f7841dc6cbca32f65f3a0	glib-networking-2.42.1.tar.xz
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 2da7858..43536d9 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.36
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).2
+GLIB_NETWORKING_VERSION_MAJOR = 2.42
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
@@ -24,11 +24,4 @@ else
 GLIB_NETWORKING_CONF_OPTS += --without-gnutls
 endif
 
-# gnutls 3.x+ doesn't use libgcrypt, it uses nettle/hogweed
-define GLIB_NETWORKING_NO_LIBGCRYPT
-	$(SED) 's:#include <gcrypt.h>::' $(@D)/tls/gnutls/gtlsbackend-gnutls.c
-endef
-
-GLIB_NETWORKING_POST_EXTRACT_HOOKS += GLIB_NETWORKING_NO_LIBGCRYPT
-
 $(eval $(autotools-package))
