From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 17 Dec 2017 18:58:06 +0100
Subject: [Buildroot] [PATCH 7/9] libcurl: add host variant
In-Reply-To: <20171217175808.31392-1-eric.le.bihan.dev@free.fr>
References: <20171217175808.31392-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171217175808.31392-8-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/libcurl/libcurl.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 0aab58a7de..c95b0eea6b 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -88,4 +88,17 @@ endef
 LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
 endif
 
+HOST_LIBCURL_DEPENDENCIES = host-openssl
+HOST_LIBCURL_CONF_OPTS = \
+	--disable-manual \
+	--disable-ntlm-wb \
+	--disable-curldebug \
+	--without-gnutls \
+	--without-mbedtls \
+	--without-polarssl \
+	--without-nss
+
+HOST_LIBCURL_POST_PATCH_HOOKS += LIBCURL_FIX_DOT_PC
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.14.3
