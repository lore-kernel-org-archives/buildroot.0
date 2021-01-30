From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Jan 2021 14:42:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/mutt: add gpgme optional dependency
Message-ID: <20210130134244.2367892-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gpgme is supported since 2005 and
https://gitlab.com/muttmua/mutt/-/commit/4bb5db92a89158cc45c3480f2be62d0b435c9a4e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index c2188cebea..9557983a07 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -36,6 +36,15 @@ else
 MUTT_CONF_OPTS += --without-idn --without-idn2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGPGME),y)
+MUTT_DEPENDENCIES += libgpgme
+MUTT_CONF_OPTS += \
+	--enable-gpgme \
+	--with-gpgme-prefix=$(STAGING_DIR)/usr
+else
+MUTT_CONF_OPTS += --disable-gpgme
+endif
+
 ifeq ($(BR2_PACKAGE_MUTT_IMAP),y)
 MUTT_CONF_OPTS += --enable-imap
 else
-- 
2.29.2
