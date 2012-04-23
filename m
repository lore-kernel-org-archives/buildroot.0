From: Vanya Sergeev <vsergeev@gmail.com>
Date: Mon, 23 Apr 2012 02:46:04 -0400
Subject: [Buildroot] [PATCH] libcurl: enabled IPv6 support
Message-ID: <1335163564-1368-1-git-send-email-vsergeev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: vsergeev <vsergeev@gmail.com>

Modified libcurl package Makefile to pass the configure option for IPv6 support
if BR2_INET_IPV6 is set.

Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
---
 package/libcurl/libcurl.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index e094e31..127d9ca 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -10,6 +10,10 @@ LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_INSTALL_STAGING = YES
 LIBCURL_CONF_OPT = --disable-verbose --disable-manual --enable-hidden-symbols
 
+ifeq ($(BR2_INET_IPV6),y)
+LIBCURL_CONF_OPT += --enable-ipv6
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
 LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
-- 
1.7.10
