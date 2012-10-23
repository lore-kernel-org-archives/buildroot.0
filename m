From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Oct 2012 22:47:55 -0300
Subject: [Buildroot] [PATCHv6 5/5] iw: pkg-config cleanup
In-Reply-To: <1350956875-1726-1-git-send-email-gustavo@zacarias.com.ar>
References: <1350956875-1726-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1350956875-1726-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer need to specify PKG_CONFIG_PATH since it's handled by the
host-pkgconf wrapper.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iw/iw.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 7633124..651a2ca 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -9,8 +9,7 @@ IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
 IW_DEPENDENCIES = host-pkgconf libnl
 IW_CONFIG = $(IW_DIR)/.config
-IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
-	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
+IW_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
 	GIT_DIR=$(IW_DIR)
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-- 
1.7.8.6
