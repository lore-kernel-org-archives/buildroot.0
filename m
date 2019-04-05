From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Apr 2019 17:25:55 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/dovecot: security
 bump to version 2.3.5.1
Message-ID: <20190405152520.2F1C97FFC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e915555849baee09e8e023912563de239e93f05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issue:

 * CVE-2019-7524: Missing input buffer size validation leads into
   arbitrary buffer overflow when reading fts or pop3 uidl header
   from Dovecot index. Exploiting this requires direct write access to
   the index files.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e3c53aa8a1eeff63cfe7a5e80ad00cce503119cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index a37cc68cf6..a1c2c8ff84 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256 bfe112ec6d11f7d6c6f7f0440e3b6e2c840c15cec1e99466b5495765d54aaaff  dovecot-2.3.5.tar.gz
+sha256 d78f9d479e3b2caa808160f86bfec1c9c7b46344d8b14b88f5fa9bbbf8c7c33f  dovecot-2.3.5.1.tar.gz
 sha256 a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256 52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 0960d20da7..e56517b0a2 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).5
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).5.1
 DOVECOT_SITE = https://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
