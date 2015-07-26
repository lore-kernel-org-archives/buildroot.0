From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 26 Jul 2015 20:45:14 +0200
Subject: [Buildroot] [PATCH 2/6] conntrack-tools: use pkg-config for
	libtirpc flags
In-Reply-To: <1437936318-9450-1-git-send-email-patrickdepinguin@gmail.com>
References: <1437936318-9450-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1437936318-9450-2-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Instead of hardcoding the flags needed for libtirpc, use pkg-config.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/conntrack-tools/conntrack-tools.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index c01501a..983f954 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -15,8 +15,8 @@ CONNTRACK_TOOLS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 CONNTRACK_TOOLS_CONF_ENV += \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
-CONNTRACK_TOOLS_DEPENDENCIES += libtirpc
+	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
+CONNTRACK_TOOLS_DEPENDENCIES += libtirpc host-pkgconf
 endif
 
 $(eval $(autotools-package))
-- 
1.8.5.1
