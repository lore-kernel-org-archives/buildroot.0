From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Apr 2015 18:17:56 -0300
Subject: [Buildroot] [PATCH] libksba: security bump to version 1.3.3
Message-ID: <1428959876-32242-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes (no CVEs assigned yet):

* integer overflow in the DN decoder src/dn.c (append_quoted,
append_atv)

* integer overflow in the BER decoder src/ber-decoder.c (ber_decoder_s)

* denial of service due to stack overflow in src/ber-decoder.c
(push_decoder_state, pop_decoder_state)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libksba/libksba.hash | 4 ++--
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index 3bd6ef0..f7727f1 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,2 +1,2 @@
-# From http://lists.gnupg.org/pipermail/gnupg-announce/2014q4/000359.html
-sha1	37d0893a587354af2b6e49f6ae701ca84f52da67	libksba-1.3.2.tar.bz2
+# Locally calculated after checking pgp signature
+sha256	0c7f5ffe34d0414f6951d9880a46fcc2985c487f7c36369b9f11ad41131c7786	libksba-1.3.3.tar.bz2
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index b48cac5..7651534 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.3.2
+LIBKSBA_VERSION = 1.3.3
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
 LIBKSBA_LICENSE = LGPLv3+ or GPLv2+ (library, headers), GPLv3+ (manual, tests, build system)
-- 
2.0.5
