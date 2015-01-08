From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  8 Jan 2015 16:18:22 -0300
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.1k
Message-ID: <1420744702-30123-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-3571 - DTLS segmentation fault in dtls1_get_record
CVE-2015-0206 - DTLS memory leak in dtls1_buffer_record
CVE-2014-3569 - no-ssl3 configuration sets method to NULL
CVE-2014-3572 - ECDHE silently downgrades to ECDH [Client]
CVE-2015-0204 - RSA silently downgrades to EXPORT_RSA [Client]
CVE-2015-0205 - DH client certificates accepted without verification
[Server]
CVE-2014-8275 - Certificate fingerprints can be modified
CVE-2014-3570 - Bignum squaring may produce incorrect results

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.hash | 8 ++++----
 package/openssl/openssl.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index 22b1529..0d27eae 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,4 +1,4 @@
-# From https://www.openssl.org/source/openssl-1.0.1j.tar.gz.md5
-# From https://www.openssl.org/source/openssl-1.0.1j.tar.gz.sha1
-md5	f7175c9cd3c39bb1907ac8bba9df8ed3	openssl-1.0.1j.tar.gz
-sha1	cff86857507624f0ad42d922bb6f77c4f1c2b819	openssl-1.0.1j.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.1k.tar.gz.md5
+# From https://www.openssl.org/source/openssl-1.0.1k.tar.gz.sha1
+md5	d4f002bd22a56881340105028842ae1f	openssl-1.0.1k.tar.gz
+sha1	19d818e202558c212a9583fcdaf876995a633ddf	openssl-1.0.1k.tar.gz
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 5dc937a..522224c 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSL_VERSION = 1.0.1j
+OPENSSL_VERSION = 1.0.1k
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
-- 
2.0.5
