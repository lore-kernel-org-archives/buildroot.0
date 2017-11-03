From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  3 Nov 2017 16:51:40 +0100
Subject: [Buildroot] [PATCH] moarvm: use host-lua instead of host-luajit
Message-ID: <20171103155140.1790-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-luajit has limited architecture support, and moarvm does not need
anything luajit specific - So use host-lua instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/moarvm/moarvm.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 276fb2c463..705c93934d 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -10,7 +10,7 @@ MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
 MOARVM_LICENSE_FILES = Artistic2.txt
 MOARVM_INSTALL_STAGING = YES
-MOARVM_DEPENDENCIES = host-luajit host-pkgconf libuv libtommath libatomic_ops
+MOARVM_DEPENDENCIES = host-lua host-pkgconf libuv libtommath libatomic_ops
 
 MOARVM_CONF_OPTS = \
 	--build=$(GNU_HOST_NAME) \
@@ -20,7 +20,7 @@ MOARVM_CONF_OPTS = \
 	--ld="$(TARGET_CC)" \
 	--prefix="/usr" \
 	--pkgconfig=$(PKG_CONFIG_HOST_BINARY) \
-	--lua=$(HOST_DIR)/bin/luajit \
+	--lua=$(HOST_DIR)/bin/lua \
 	--has-libuv \
 	--has-libtommath \
 	--has-libatomic
-- 
2.11.0
