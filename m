From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 23 Mar 2016 18:56:44 +0100
Subject: [Buildroot] [PATCH] moarvm: remove host-luajit dependency
Message-ID: <1458755804-9455-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

now, use the minilua which is embedded in the package.
that fixes the build issue, see http://autobuild.buildroot.net/results/4dc/4dcbcde0046e265317e170a977e699e5c3a06b87/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/moarvm/moarvm.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 7456902..b89060b 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -10,7 +10,7 @@ MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
 MOARVM_LICENSE_FILES = Artistic2.txt
 MOARVM_INSTALL_STAGING = YES
-MOARVM_DEPENDENCIES = host-luajit libuv libatomic_ops
+MOARVM_DEPENDENCIES = libuv libatomic_ops
 
 MOARVM_CONF_OPTS = \
 	--build=$(GNU_HOST_NAME) \
@@ -19,7 +19,6 @@ MOARVM_CONF_OPTS = \
 	--cc="$(TARGET_CC)" \
 	--ld="$(TARGET_CC)" \
 	--prefix="/usr" \
-	--lua=$(HOST_DIR)/usr/bin/luajit \
 	--has-libuv \
 	--has-libatomic
 
-- 
1.9.1
