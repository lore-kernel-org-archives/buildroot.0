From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Sep 2020 09:35:50 +0200
Subject: [Buildroot] [git commit] package/gnupg2: security bump to version
 2.2.23
Message-ID: <20200905072751.4D9B2870E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=918a9fb455aeda08a04d87fdd4bb36e688594d91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

CVE-2020-25125: Importing an OpenPGP key having a preference list for AEAD
algorithms will lead to an array overflow and thus often to a crash or other
undefined behaviour (affected: 2.2.21 / 2.2.22)

For more details, see the announcement:
https://lists.gnupg.org/pipermail/gnupg-announce/2020q3/000448.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg2/gnupg2.hash | 8 ++++----
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 470681cda9..ac78385f7a 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2020q3/000446.html
-sha1  4af4c6fe5f9dd7d866243f715b32775500468943  gnupg-2.2.21.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2020q3/000448.html
+sha1   bd949b4af7426e4afc13667d678503063c6aa4b5 gnupg-2.2.23.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.21.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.23.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  61e83278fb5fa7336658a8b73ab26f379d41275bb1c7c6e694dd9f9a6e8e76ec  gnupg-2.2.21.tar.bz2
+sha256  10b55e49d78b3e49f1edb58d7541ecbdad92ddaeeb885b6f486ed23d1cd1da5c  gnupg-2.2.23.tar.bz2
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index e77c84d41e..af13a8d6c9 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.21
+GNUPG2_VERSION = 2.2.23
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
