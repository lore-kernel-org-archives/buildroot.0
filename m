From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 11:23:00 +0100
Subject: [Buildroot] [PATCH] wolfssl: install into staging
Message-ID: <20181030102300.10254-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wolfssl is a library, so it should be installed into staging so other
packages can find the header files / library.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index ec83d7d1dd..c246b08513 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -7,6 +7,7 @@
 WOLFSSL_VERSION = 3.14.0
 WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/archive
 WOLFSSL_SOURCE = v$(WOLFSSL_VERSION)-stable.tar.gz
+WOLFSSL_INSTALL_STAGING = YES
 
 WOLFSSL_LICENSE = GPL-2.0
 WOLFSSL_LICENSE_FILES = COPYING LICENSING
-- 
2.11.0
