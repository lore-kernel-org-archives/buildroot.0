From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 12 May 2013 20:56:15 +0200
Subject: [Buildroot] [PATCH] openssl: fix host-openssl dependencies
Message-ID: <1368384975-20193-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Support for ocf-linux or cryptodev-linux added a dependency of host-openssl
on host-ocf-linux / host-cryptodev-linux, which we don't have and the
dependency is anyway not needed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openssl/openssl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 2e04789..081fc90 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -10,6 +10,7 @@ OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
+HOST_OPENSSL_DEPENDENCIES = host-zlib
 OPENSSL_TARGET_ARCH = generic32
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
 
-- 
1.8.2.1
