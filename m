From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Apr 2015 17:01:36 -0300
Subject: [Buildroot] [PATCH] libcurl: disable curldebug
Message-ID: <1429819296-8647-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

curldebug is a more advanced form of debugging for curl which audits
source code with the checksource.pl tool, and treats warnings as errors.
Normally users won't want/need this so disable it since it leads to
failed builds when debug info is enabled (which is what people normally
want).
When buildroot does --enable-debug curl inherently enables curldebug too.

Solves bug #8041.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index acb2b42..3390399 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -20,7 +20,7 @@ LIBCURL_INSTALL_STAGING = YES
 # probably almost never used. See
 # http://curl.haxx.se/docs/manpage.html#--ntlm.
 LIBCURL_CONF_OPTS = --disable-verbose --disable-manual --disable-ntlm-wb \
-	--enable-hidden-symbols --with-random=/dev/urandom
+	--enable-hidden-symbols --with-random=/dev/urandom --disable-curldebug
 LIBCURL_CONFIG_SCRIPTS = curl-config
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.0.5
