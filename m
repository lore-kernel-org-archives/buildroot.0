From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Feb 2011 17:45:55 -0300
Subject: [Buildroot] [PATCH 1/3] openssl: fix libdir issue bug #3205
Message-ID: <1296765957-5137-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenSSL's build system tries to be too wise for it's own good when
guessing what libdir should be.
This causes problems like the one reported in bug #3205 so just specify
libdir to point to /lib (since it's prefixed it would finally be
/usr/lib) since it should be present on 32 and 64 bit targets.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index e35eaa3..95459ec 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -41,6 +41,7 @@ define OPENSSL_CONFIGURE_CMDS
 			linux-$(OPENSSL_TARGET_ARCH) \
 			--prefix=/usr \
 			--openssldir=/etc/ssl \
+			--libdir=/lib \
 			threads \
 			shared \
 			no-idea \
-- 
1.7.3.4
