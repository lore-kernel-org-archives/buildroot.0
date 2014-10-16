From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Oct 2014 09:57:47 -0300
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.1j
Message-ID: <1413464267-4698-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-3513 - SRTP memory leak
CVE-2014-3567 - Session ticket memory leak
CVE-2014-3568 - Build option no-ssl3 is incomplete
And adds SSL3 fallback protection against POODLE.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.hash | 8 ++++----
 package/openssl/openssl.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index aa45a76..22b1529 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,4 +1,4 @@
-# From https://www.openssl.org/source/openssl-1.0.1i.tar.gz.md5
-# From https://www.openssl.org/source/openssl-1.0.1i.tar.gz.sha1
-md5	c8dc151a671b9b92ff3e4c118b174972	openssl-1.0.1i.tar.gz
-sha1	74eed314fa2c93006df8d26cd9fc630a101abd76	openssl-1.0.1i.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.1j.tar.gz.md5
+# From https://www.openssl.org/source/openssl-1.0.1j.tar.gz.sha1
+md5	f7175c9cd3c39bb1907ac8bba9df8ed3	openssl-1.0.1j.tar.gz
+sha1	cff86857507624f0ad42d922bb6f77c4f1c2b819	openssl-1.0.1j.tar.gz
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 4911034..7c1c7f0 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSL_VERSION = 1.0.1i
+OPENSSL_VERSION = 1.0.1j
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
-- 
2.0.4
