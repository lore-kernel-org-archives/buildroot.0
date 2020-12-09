From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Dec 2020 09:38:38 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/libkrb5: security
 bump to version 1.17.2
Message-ID: <20201209082449.2DF5A815BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c38f411d36db5a71ecb2fa175365a1fdaafa8b6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues:

- CVE-2020-28196: MIT Kerberos 5 (aka krb5) before 1.17.2 and 1.18.x before
  1.18.3 allows unbounded recursion via an ASN.1-encoded Kerberos message
  because the lib/krb5/asn.1/asn1_encode.c support for BER indefinite
  lengths lacks a recursion limit.

Also fix .hash file indentation and update the NOTICE hash for a change of
copyright year.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libkrb5/libkrb5.hash | 4 ++--
 package/libkrb5/libkrb5.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index aa7c3a3778..ea8eb14731 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	5a6e2284a53de5702d3dc2be3b9339c963f9b5397d3fbbc53beb249380a781f5	krb5-1.17.tar.gz
+sha256  1a4bba94df92f6d39a197a10687653e8bfbc9a2076e129f6eb92766974f86134  krb5-1.17.2.tar.gz
 
 # Hash for license file:
-sha256	5149ea464bde245388d313309539e142156d371788ae57bbd4feb223757f6da1	NOTICE
+sha256  b7a5f14a8719bce5e49a761998aa55438fc890fb40f71228d6a49546f6d5690d  NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 44a20b3707..26d9175298 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBKRB5_VERSION_MAJOR = 1.17
-LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR)
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).2
 LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
