From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 23 Jul 2017 10:12:03 +0200
Subject: [Buildroot] [Patch v7 07/10] libssh2: add host variant
In-Reply-To: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170723081206.7774-8-eric.le.bihan.dev@free.fr>
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
index 338f5b4..64c59bc 100644
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
2.9.4
