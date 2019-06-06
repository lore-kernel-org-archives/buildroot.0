From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 08:40:33 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/lynx: remove
 duplicate dependency for host-pkg-conf
Message-ID: <20190606064907.2FBD981347@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ca1f870c0399e2c870a30a52fbc69b820df5f36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

host-pkg-conf is already in default lynx's dependencies so remove it
from openssl condition block.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lynx/lynx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index b6cc1b2b91..07a3ddfcf0 100644
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
