From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:01:06 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/mutt: fix
 activation of openssl on imap
Message-ID: <20201227082413.4A842815BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c47c1aa2e9ec69a1c2490da40763488b2de4c91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Activation of openssl for imap is broken since commit
0fcd010a2db771c259224ad1d025fb4c5a9baf3b because of the following typo:
BR2_PACKAGET_MUTT_IMAP

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dc1ec5b78bb9cc6ccc1ffb7367eb8ce68dc04fa8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
