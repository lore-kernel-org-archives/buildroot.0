From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 Jul 2009 21:49:45 +0200
Subject: [Buildroot] [git commit] openssl: fix arch handling
Message-ID: <20090729195158.099A8777F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2a966bcd3bbf0323add5bc5426107bb3af24767d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #497

Use ARCH instead of BR2_ARCH as BR2_ARCH won't match because of the
surrounding quotes.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    1 +
 package/openssl/openssl.mk |    8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 77c4398..c1bfe38 100644
--- a/CHANGES
+++ b/CHANGES
@@ -46,6 +46,7 @@
 	#451: Upgrade from unmaintained dosfstools-2.11 to dosfstools-3.0.3
 	#467: DirectFB 1.4.1
 	#473: memstat_0.5.tar.gz has install with -D and that fails "make"
+	#497: OpenSSL RSA key generation hangs on x86_64
 
 2009.05, Released June 1st, 2009:
 
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index a0e6f7e..16938f4 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -9,16 +9,16 @@ OPENSSL_SITE:=http://www.openssl.org/source
 OPENSSL_TARGET_ARCH=generic32
 
 # Some architectures are optimized in OpenSSL
-ifeq ($(BR2_ARCH),avr32)
+ifeq ($(ARCH),avr32)
 OPENSSL_TARGET_ARCH=avr32
 endif
-ifeq ($(BR2_ARCH),ia64)
+ifeq ($(ARCH),ia64)
 OPENSSL_TARGET_ARCH=ia64
 endif
-ifeq ($(BR2_ARCH),powerpc)
+ifeq ($(ARCH),powerpc)
 OPENSSL_TARGET_ARCH=ppc
 endif
-ifeq ($(BR2_ARCH),x86_64)
+ifeq ($(ARCH),"x86_64")
 OPENSSL_TARGET_ARCH=x86_64
 endif
 
-- 
1.6.3.3
