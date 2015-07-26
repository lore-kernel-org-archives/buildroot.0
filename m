From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 26 Jul 2015 20:45:13 +0200
Subject: [Buildroot] [PATCH 1/6] rpcbind: use pkg-config for libtirpc flags
Message-ID: <1437936318-9450-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Instead of hardcoding the flags needed for libtirpc, use pkg-config.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/rpcbind/rpcbind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index d879de1..1e28af9 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -11,7 +11,7 @@ RPCBIND_LICENSE = BSD-3c
 RPCBIND_LICENSE_FILES = COPYING
 
 RPCBIND_CONF_ENV += \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
+	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
 RPCBIND_DEPENDENCIES += libtirpc host-pkgconf
 RPCBIND_CONF_OPTS += --with-rpcuser=root
 RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=no
-- 
1.8.5.1
