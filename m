From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Mar 2012 20:34:22 +0100
Subject: [Buildroot] [git commit] glib-networking: fix build without gnutls
Message-ID: <20120304193501.99DC890CE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b38f41736e33df75a802828dfc5f6673f6419e8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure errors out when it doesn't find gnutls unless explicitly
disabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/glib-networking/glib-networking.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index b1ad621..47415d8 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -16,7 +16,9 @@ GLIB_NETWORKING_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libin
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 GLIB_NETWORKING_DEPENDENCIES += gnutls
-GLIB_NETWORKING_CONF_OPT = --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+GLIB_NETWORKING_CONF_OPT += --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+else
+GLIB_NETWORKING_CONF_OPT += --without-gnutls
 endif
 
 $(eval $(call AUTOTARGETS))
