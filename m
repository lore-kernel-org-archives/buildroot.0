From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Sep 2009 14:50:50 +0200
Subject: [Buildroot] [git commit master] openssl: use generic support for
	avr32
Message-ID: <20090923125104.DA48F77661@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=db5e30586779b3f8b7f97ed3342cd2bf38878167
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream openssl doesn't have avr32 support, and we dropped the
avr32 optimization patch some time ago.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssl/openssl.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 8c24db1..dcfcf4b 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -9,9 +9,6 @@ OPENSSL_SITE:=http://www.openssl.org/source
 OPENSSL_TARGET_ARCH=generic32
 
 # Some architectures are optimized in OpenSSL
-ifeq ($(ARCH),avr32)
-OPENSSL_TARGET_ARCH=avr32
-endif
 ifeq ($(ARCH),ia64)
 OPENSSL_TARGET_ARCH=ia64
 endif
-- 
1.6.3.3
