From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 15 May 2019 13:44:56 +0300
Subject: [Buildroot] [PATCH 1/1] package/lynx: remove duplicate dependency
 for host-pkg-conf
Message-ID: <1557917096-20967-1-git-send-email-email@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vadim Kochan <vadim4j@gmail.com>

host-pkg-conf is already in default lynx's dependencies so remove it
from openssl condition block.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/lynx/lynx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index b6cc1b2..07a3ddf 100644
--- a/package/lynx/lynx.mk
+++ b/package/lynx/lynx.mk
@@ -21,7 +21,7 @@ LYNX_CONF_OPTS += --with-screen=slang
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LYNX_DEPENDENCIES += host-pkgconf openssl
+LYNX_DEPENDENCIES += openssl
 LYNX_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
 LYNX_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
-- 
2.7.4
