From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2020 00:21:49 +0100
Subject: [Buildroot] [PATCH] package/libkrb5: security bump to version 1.18.3
Message-ID: <20201121232149.7823-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

- CVE-2020-28196: MIT Kerberos 5 (aka krb5) before 1.17.2 and 1.18.x before
  1.18.3 allows unbounded recursion via an ASN.1-encoded Kerberos message
  because the lib/krb5/asn.1/asn1_encode.c support for BER indefinite
  lengths lacks a recursion limit.

Also fix .hash file indentation.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libkrb5/libkrb5.hash | 4 ++--
 package/libkrb5/libkrb5.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index 658c4539f6..e5b24a3f70 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	02a4e700f10936f937cd1a4c303cab8687a11abecc6107bd4b706b9329cd5400	krb5-1.18.1.tar.gz
+sha256	e61783c292b5efd9afb45c555a80dd267ac67eebabca42185362bee6c4fbd719  krb5-1.18.3.tar.gz
 
 # Hash for license file:
-sha256	b7a5f14a8719bce5e49a761998aa55438fc890fb40f71228d6a49546f6d5690d	NOTICE
+sha256	b7a5f14a8719bce5e49a761998aa55438fc890fb40f71228d6a49546f6d5690d  NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index f7cd677def..b46e7c6c50 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBKRB5_VERSION_MAJOR = 1.18
-LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).1
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).3
 LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
-- 
2.20.1
