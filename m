From: Shawn J. Goff <shawn7400@gmail.com>
Date: Wed, 17 Apr 2013 14:38:01 -0400
Subject: [Buildroot] [PATCH] libcurl: specify capath
Message-ID: <1366223881-6367-1-git-send-email-shawn7400@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Shawn J. Goff" <shawn7400@gmail.com>

Since openssl's path is '/etc/ssl/' (specified in our openssl package),
we should also make sure that's what curl is using.

Previously, it's hasn't been specified, which means it changes depending
on the host system where it's compiled.

Signed-off-by: Shawn J. Goff <shawn7400@gmail.com>
---
 package/libcurl/libcurl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index a631953..75c9601 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -16,7 +16,7 @@ LIBCURL_INSTALL_STAGING = YES
 # probably almost never used. See
 # http://curl.haxx.se/docs/manpage.html#--ntlm.
 LIBCURL_CONF_OPT = --disable-verbose --disable-manual \
-	--enable-hidden-symbols --disable-ntlm-wb
+	--enable-hidden-symbols --disable-ntlm-wb --with-ca-path=/etc/ssl/certs
 LIBCURL_CONFIG_SCRIPTS = curl-config
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
1.8.1.5
