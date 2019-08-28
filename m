From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 17:16:34 +0200
Subject: [Buildroot] [git commit] package/dovecot: security bump version to
 2.3.7.2
Message-ID: <20190828151309.B041888110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4afd405effdb56af0e09ee83ec4511deb835e630
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://dovecot.org/pipermail/dovecot/2019-August/116874.html

Fixes
* CVE-2019-11500: IMAP protocol parser does not properly handle NUL byte
  when scanning data in quoted strings, leading to out of bounds heap
  memory writes. Found by Nick Roessler and Rafi Rubin.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index e0d7e14bea..3d78af0092 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256 c5a51d6f76e6e9c843df69e52a364a4c65c4c60e0c51d992eaa45f22f71803c3  dovecot-2.3.7.1.tar.gz
+sha256 666ce084760a47e601d49a9be3c7993c48789d332631e8dfb45f443b367b1260  dovecot-2.3.7.2.tar.gz
 sha256 a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256 52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 859d64f026..65c2bcef69 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).7.1
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).7.2
 DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
