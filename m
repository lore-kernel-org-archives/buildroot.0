From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Feb 2018 14:57:48 +0100
Subject: [Buildroot] [git commit] libcurl: add host variant
Message-ID: <20180205140233.8BC5684D6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=736e0fc5d6103300fb5d6b0cde5e22ce978b8a80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index a1d2aa7a60..39ed3e4da5 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -88,4 +88,18 @@ endef
 LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
 endif
 
+HOST_LIBCURL_DEPENDENCIES = host-openssl
+HOST_LIBCURL_CONF_OPTS = \
+	--disable-manual \
+	--disable-ntlm-wb \
+	--disable-curldebug \
+	--with-ssl \
+	--without-gnutls \
+	--without-mbedtls \
+	--without-polarssl \
+	--without-nss
+
+HOST_LIBCURL_POST_PATCH_HOOKS += LIBCURL_FIX_DOT_PC
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
