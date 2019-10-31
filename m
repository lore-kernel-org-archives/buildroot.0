From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 21:52:05 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/samba4: security
 bump to vesion 4.9.15
Message-ID: <20191031211111.095AC8E34B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=064b224eb0d76735c7dabcc18ee8e02d197010e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

 - CVE-2019-10218:
   Malicious servers can cause Samba client code to return filenames containing
   path separators to calling code.

 - CVE-2019-14833:
   When the password contains multi-byte (non-ASCII) characters, the check
   password script does not receive the full password string.

 - CVE-2019-14847:
   Users with the "get changes" extended access right can crash the AD DC LDAP
   server by requesting an attribute using the range= syntax.

Release notes:
https://www.samba.org/samba/history/samba-4.9.15.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index d225112cb0..e0ea49a6f1 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.13.tar.asc
-sha256 ab18331e37766b13dbb07d1f115bda3d794917baf502d0ca2b2b8fff014b88f2  samba-4.9.13.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.15.tar.asc
+sha256 377102b80b97941bf0d131b828cae8415190e5bdd2928c2e2c954e29f1904496  samba-4.9.15.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 0e3c66e178..3f30efac60 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.13
+SAMBA4_VERSION = 4.9.15
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
