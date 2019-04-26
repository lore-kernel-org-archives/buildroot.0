From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 15:06:22 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/dovecot: security
 bump to version 2.3.5.2
Message-ID: <20190426130224.07DF280163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fcaff911df5a52e14625766b33ac329b728d298
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issue:

* CVE-2019-10691: Trying to login with 8bit username containing
  invalid UTF8 input causes auth process to crash if auth policy is
  enabled. This could be used rather easily to cause a DoS. Similar
  crash also happens during mail delivery when using invalid UTF8 in
  From or Subject header when OX push notification driver is used.

https://dovecot.org/pipermail/dovecot-news/2019-April/000406.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 89c7e417ede23c9f3583391a882c10d825527727)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index a1c2c8ff84..2b8492a3c8 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256 d78f9d479e3b2caa808160f86bfec1c9c7b46344d8b14b88f5fa9bbbf8c7c33f  dovecot-2.3.5.1.tar.gz
+sha256 ba14e41aefd81a868a35b83bcb54194116106424d37690519b50ea83c0f31bf2  dovecot-2.3.5.2.tar.gz
 sha256 a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256 52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index e56517b0a2..d9b94eb83a 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).5.1
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).5.2
 DOVECOT_SITE = https://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
