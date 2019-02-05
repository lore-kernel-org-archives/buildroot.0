From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 20:27:06 +0100
Subject: [Buildroot] [git commit] package/dovecot: security bump to version
 2.3.4.1
Message-ID: <20190205193816.5727183BE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a30d577a4b1592f9bec441de3aee6f75d2ef3fd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

 * CVE-2019-3814: If imap/pop3/managesieve/submission client has
   trusted certificate with missing username field
   (ssl_cert_username_field), under some configurations Dovecot
   mistakenly trusts the username provided via authentication instead
   of failing.

 * ssl_cert_username_field setting was ignored with external SMTP AUTH,
   because none of the MTAs (Postfix, Exim) currently send the
   cert_username field. This may have allowed users with trusted
   certificate to specify any username in the authentication. This bug
   didn't affect Dovecot's Submission service.

For more details, see the announcement:
https://www.dovecot.org/list/dovecot-news/2019-February/000394.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index c4abc18bea..e4a07ba4e4 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256 d91b76eff8df6185c1799f1b279f780105bdeeea27e3286b42f4cab18efbef05  dovecot-2.3.4.tar.gz
+sha256 b8873e2ce5c33e58963bb7a8d2ff8427c09dbfdd63e13a0b0f4502864043aa07  dovecot-2.3.4.1.tar.gz
 sha256 a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256 52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 45c9f67c3c..bffc8ac54f 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).4
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).4.1
 DOVECOT_SITE = https://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
