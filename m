From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 15 Jul 2016 00:07:31 +0200
Subject: [Buildroot] [Patch v2 1/4] libssh2: add host variant
In-Reply-To: <1468534054-14110-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1468534054-14110-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1468534054-14110-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow build of host variant of libssh2, which depends on host-openssl.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/libssh2/libssh2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 221fac4..9a52d59 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -37,4 +37,10 @@ else
 LIBSSH2_CONF_OPTS += --without-libz
 endif
 
+HOST_LIBSSH2_DEPENDENCIES += host-openssl
+HOST_LIBSSH2_CONF_OPTS += --with-openssl \
+	--with-libssl-prefix=$(HOST_DIR)/usr \
+	--without-libgcrypt
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.4.11
