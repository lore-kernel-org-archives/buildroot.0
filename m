From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 30 Apr 2019 20:08:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/dovecot: security bump to version
 2.3.6
Message-ID: <20190430180822.30857-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
* CVE-2019-11494: Submission-login crashed with signal 11 due to null
  pointer access when authentication was aborted by disconnecting.
* CVE-2019-11499: Submission-login crashed when authentication was
  started over TLS secured channel and invalid authentication message
  was sent.

Release notes:
https://dovecot.org/pipermail/dovecot-news/2019-April/000408.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 2b8492a3c8..a57e51405d 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256 ba14e41aefd81a868a35b83bcb54194116106424d37690519b50ea83c0f31bf2  dovecot-2.3.5.2.tar.gz
+sha256 ed1d8dc1beeae9c6c73deac73a62ef19fe9262fbffd86604a3f690452f5536c7  dovecot-2.3.6.tar.gz
 sha256 a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256 52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index d9b94eb83a..78bc41bff2 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).5.2
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).6
 DOVECOT_SITE = https://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
-- 
2.20.1
