From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 26 Sep 2012 07:48:42 -0300
Subject: [Buildroot] [PATCHv2 4/4] iw: pkg-config nitpicking
In-Reply-To: <1348656522-13698-1-git-send-email-gustavo@zacarias.com.ar>
References: <1348656522-13698-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1348656522-13698-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we're now using pkgconf with a wrapper script we no longer need to
pass PKG_CONFIG_PATH to pkg-config to do the right thing.
Also point PKG_CONFIG to PKG_CONFIG_HOST_BINARY rather than the
hardcoded option.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iw/iw.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index b1a86b3..af11140 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -9,9 +9,7 @@ IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
 IW_DEPENDENCIES = host-pkgconf libnl
 IW_CONFIG = $(IW_DIR)/.config
-IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
-	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
-	GIT_DIR=$(IW_DIR)
+IW_MAKE_ENV = PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)"
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 # libnl needs pthread/m, so we need to explicitly with them when static
-- 
1.7.8.6
