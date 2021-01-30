From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 22:18:53 +0100
Subject: [Buildroot] [git commit] package/mutt: add gpgme optional dependency
Message-ID: <20210130205927.BDFEE7FD45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2312e99499af0e432dedd87b0edd8a137c6a7e73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gpgme is supported since 2005 and
https://gitlab.com/muttmua/mutt/-/commit/4bb5db92a89158cc45c3480f2be62d0b435c9a4e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
