From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 12:04:09 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] package/dovecot: bump
 version to 2.2.33.2
Message-ID: <20180131123622.F3EAA8568A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4caafafc2d9d7733690bceac71af50600eccee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Added license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 746f94c282fcc2c0728b53e24d96e7553fcaa46a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-byteorder.h-fix-uclibc-build.patch        | 32 ++++++++++++++++++++++
 package/dovecot/dovecot.hash                       |  5 +++-
 package/dovecot/dovecot.mk                         |  2 +-
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/0001-byteorder.h-fix-uclibc-build.patch b/package/dovecot/0001-byteorder.h-fix-uclibc-build.patch
new file mode 100644
index 0000000000..b6d3ed3ec0
--- /dev/null
+++ b/package/dovecot/0001-byteorder.h-fix-uclibc-build.patch
@@ -0,0 +1,32 @@
+From 902917880ca29f1007750a70cf46e7246b2d0a2a Mon Sep 17 00:00:00 2001
+From: Josef 'Jeff' Sipek <jeff.sipek@dovecot.fi>
+Date: Tue, 14 Nov 2017 06:01:21 +0100
+Subject: [PATCH] byteorder.h: fix uclibc build
+
+Patch suggested on upstream mailinglist:
+https://www.dovecot.org/pipermail/dovecot/2017-November/110019.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/lib/byteorder.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/lib/byteorder.h b/src/lib/byteorder.h
+index 2f5dc7c17..4ffe8da21 100644
+--- a/src/lib/byteorder.h
++++ b/src/lib/byteorder.h
+@@ -23,6 +23,11 @@
+ #ifndef BYTEORDER_H
+ #define BYTEORDER_H
+ 
++#undef bswap_8
++#undef bswap_16
++#undef bswap_32
++#undef bswap_64
++
+ /*
+  * These prototypes exist to catch bugs in the code generating macros below.
+  */
+-- 
+2.11.0
+
diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 184745b394..33163d6d8c 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,5 @@
 # Locally computed after checking signature
-sha256 034be40907748128d65088a4f59789b2f99ae7b33a88974eae0b6a68ece376a1  dovecot-2.2.31.tar.gz
+sha256 fe1e3b78609a56ee22fc209077e4b75348fa1bbd54c46f52bde2472a4c4cee84  dovecot-2.2.33.2.tar.gz
+sha256 a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
+sha256 52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index fa69acfa20..71a76c2818 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).31
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).33.2
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
