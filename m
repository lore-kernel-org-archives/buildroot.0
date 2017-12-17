From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 17 Dec 2017 18:58:04 +0100
Subject: [Buildroot] [PATCH 5/9] libssh2: add host variant
In-Reply-To: <20171217175808.31392-1-eric.le.bihan.dev@free.fr>
References: <20171217175808.31392-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171217175808.31392-6-eric.le.bihan.dev@free.fr>
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
index 18e772c722..c5b0bd855e 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -40,4 +40,10 @@ else
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
2.14.3
