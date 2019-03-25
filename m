From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 26 Mar 2019 01:42:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/uftp: Fix compilation with openssl
Message-ID: <20190325234237.11349-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build fails with -lssl but succeeds with -lcrypto, also thats how it is
linked by default in 'makefile'.

Fixes:
	http://autobuild.buildroot.net/results/01a455ddcbc16cd2111352d22bf6603842df4ab2

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/uftp/uftp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uftp/uftp.mk b/package/uftp/uftp.mk
index abdb0a4def..edf22cf5ce 100644
--- a/package/uftp/uftp.mk
+++ b/package/uftp/uftp.mk
@@ -11,7 +11,7 @@ UFTP_LICENSE_FILES = LICENSE.txt
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 UFTP_DEPENDENCIES += host-pkgconf openssl
-UFTP_MAKE_OPTS += CRYPT_LIB="`$(PKG_CONFIG_HOST_BINARY) --libs libssl`"
+UFTP_MAKE_OPTS += CRYPT_LIB="`$(PKG_CONFIG_HOST_BINARY) --libs libcrypto`"
 else
 UFTP_MAKE_OPTS += NO_ENCRYPTION=1
 endif
-- 
2.14.1
