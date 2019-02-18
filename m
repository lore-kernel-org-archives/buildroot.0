From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Feb 2019 17:45:31 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/dovecot: security
 bump to version 2.2.36.1
Message-ID: <20190218164503.68E4680DE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5da81070a96f00af2b6fc3fbbcddfe722566bd55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

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
https://www.dovecot.org/list/dovecot-news/2019-February/000393.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 438c3cccef..1e21278b9d 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256 cce15db2fc5233386b63a3cf21c465c09e6e55014ed66c4f184b7d221a47180c  dovecot-2.2.35.tar.gz
+sha256 38c7304a02246f80709fac72a81685082de8873fd94d67d2bf02cf1cbeb12f03  dovecot-2.2.36.1.tar.gz
 sha256 a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256 52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 783ca06a0e..d19c87df64 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).35
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).36.1
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
