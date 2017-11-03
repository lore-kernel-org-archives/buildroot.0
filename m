From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 21:57:08 +0100
Subject: [Buildroot] [git commit] moarvm: use host-lua instead of host-luajit
Message-ID: <20171103204947.2E3C381214@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7e216845800c257c9c0bf427d2871de62c70d11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-luajit has limited architecture support, and moarvm does not need
anything luajit specific - So use host-lua instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/moarvm/moarvm.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 276fb2c..705c939 100644
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
