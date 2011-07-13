From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 13 Jul 2011 18:58:44 +0200
Subject: [Buildroot] [PATCH 2/2] libsoup: explicitly pass gcrypt prefix to
	the configure script
In-Reply-To: <1310576324-9603-1-git-send-email-s.neumann@raumfeld.com>
References: <1310576324-9603-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1310576324-9603-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libsoup build failes to pick up gcrypt otherwise.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/libsoup/libsoup.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 697f426..97b5ef5 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -25,7 +25,8 @@ LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBSOUP_DEPENDENCIES += gnutls
-LIBSOUP_CONF_OPT += --enable-ssl
+LIBSOUP_CONF_OPT += --enable-ssl \
+	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
 LIBSOUP_CONF_OPT += --disable-ssl
 endif
-- 
1.7.1
