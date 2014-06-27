From: Alexandre Coffignal <acoffignal@geral.com>
Date: Fri, 27 Jun 2014 16:18:04 +0200
Subject: [Buildroot] [PATCH 1/1] libssh2: fix library search path issues
	when zlib support enabled
Message-ID: <1403878684-11934-1-git-send-email-acoffignal@geral.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Alexandre Coffignal <acoffignal@geral.com>
---
 package/libssh2/libssh2.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 19df9af..73aae8e 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -28,7 +28,8 @@ endif
 # Add zlib support if enabled
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBSSH2_DEPENDENCIES += zlib
-LIBSSH2_CONF_OPT += --with-libz
+LIBSSH2_CONF_OPT += --with-libz \
+	--with-libz-prefix=$(STAGING_DIR)/usr
 else
 LIBSSH2_CONF_OPT += --without-libz
 endif
-- 
1.7.9.5
