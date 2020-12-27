From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:01:01 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/mutt: fix
 activation of openssl on imap
Message-ID: <20201227082347.D7F2788DD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09658e44ba86f660eae5ea44fdfea00403189f61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
index 21d27a11ad..e11cb471eb 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -48,7 +48,7 @@ MUTT_CONF_OPTS += --disable-pop
 endif
 
 # SSL support is only used by imap or pop3 module
-ifneq ($(BR2_PACKAGET_MUTT_IMAP)$(BR2_PACKAGE_MUTT_POP3),)
+ifneq ($(BR2_PACKAGE_MUTT_IMAP)$(BR2_PACKAGE_MUTT_POP3),)
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MUTT_DEPENDENCIES += openssl
 MUTT_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
