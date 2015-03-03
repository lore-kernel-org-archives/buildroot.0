From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:16 +0100
Subject: [Buildroot] [RFC v3 11/30] iw: use TARGET_CONFIGURE_OPTS
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-12-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is in order to support the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/iw/iw.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index df6e257..460c83b 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -10,9 +10,8 @@ IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
 IW_LICENSE_FILES = COPYING
 IW_DEPENDENCIES = host-pkgconf libnl
-IW_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
-IW_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
-	GIT_DIR=$(IW_DIR)
+IW_MAKE_OPTS =
+IW_MAKE_ENV = $(TARGET_CONFIGURE_OPTS) GIT_DIR=$(IW_DIR)
 
 ifeq ($(BR2_STATIC_LIBS),y)
 # libnl needs pthread/m, so we need to explicitly with them when static
-- 
2.3.1
