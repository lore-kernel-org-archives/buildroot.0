From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  7 Dec 2015 10:40:59 -0300
Subject: [Buildroot] [PATCH] gnutls: re-enable gnutls-openssl compat library
Message-ID: <1449495659-25501-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This was disabled in the 3.4.x branch by default and is required by
inadyn, fixes:
http://autobuild.buildroot.net/results/51f/51f7e9275c2d23952c7558a126a8843d5476e4b1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index a7342d6..d97e5e5 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -17,6 +17,7 @@ GNUTLS_CONF_OPTS = \
 	--disable-libdane \
 	--disable-rpath \
 	--enable-local-libopts \
+	--enable-openssl-compatibility \
 	--with-libnettle-prefix=$(STAGING_DIR)/usr \
 	--with-librt-prefix=$(STAGING_DIR) \
 	--without-tpm
-- 
2.4.10
