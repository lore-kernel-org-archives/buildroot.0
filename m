From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 20 Feb 2015 13:28:56 +0100
Subject: [Buildroot] [PATCH 1/7] libsigrok: remove --disable-udev from
	CONF_OPTS
In-Reply-To: <1424435342-2188-1-git-send-email-bgolaszewski@baylibre.com>
References: <1424435342-2188-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1424435342-2188-2-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option is invalid and thus ignored by libsigrok configure.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/libsigrok/libsigrok.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index f91b8cb..109d4d3 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -13,7 +13,7 @@ LIBSIGROK_LICENSE_FILES = COPYING
 LIBSIGROK_AUTORECONF = YES
 LIBSIGROK_INSTALL_STAGING = YES
 LIBSIGROK_DEPENDENCIES = libglib2 libzip host-pkgconf
-LIBSIGROK_CONF_OPTS = --disable-libudev --disable-bindings --disable-glibtest
+LIBSIGROK_CONF_OPTS = --disable-bindings --disable-glibtest
 
 define LIBSIGROK_ADD_MISSING
 	mkdir -p $(@D)/autostuff
-- 
2.1.4
