From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 23 Dec 2020 11:59:48 +0100
Subject: [Buildroot] [PATCH 1/3] package/mutt: fix activation of openssl on
 imap
Message-ID: <20201223105950.2278971-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Activation of openssl for imap is broken since commit
0fcd010a2db771c259224ad1d025fb4c5a9baf3b because of the following typo:
BR2_PACKAGET_MUTT_IMAP

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 58c80d445d..cc4b5f56b4 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -43,7 +43,7 @@ MUTT_CONF_OPTS += --disable-pop
 endif
 
 # SSL support is only used by imap or pop3 module
-ifneq ($(BR2_PACKAGET_MUTT_IMAP)$(BR2_PACKAGE_MUTT_POP3),)
+ifneq ($(BR2_PACKAGE_MUTT_IMAP)$(BR2_PACKAGE_MUTT_POP3),)
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MUTT_DEPENDENCIES += openssl
 MUTT_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
-- 
2.29.2
