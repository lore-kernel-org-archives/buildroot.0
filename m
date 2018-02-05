From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Feb 2018 14:57:47 +0100
Subject: [Buildroot] [git commit] libssh2: add host variant
Message-ID: <20180205140233.611F4824EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93a911fd5b14536e5c32298f0aa264c285015bcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow build of host variant of libssh2, which depends on host-openssl.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
