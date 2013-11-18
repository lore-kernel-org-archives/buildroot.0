From: sonic.adi at gmail.com <sonic.adi@gmail.com>
Date: Mon, 18 Nov 2013 11:53:39 +0800
Subject: [Buildroot] [PATCH] alsa-lib: Disable mixer in alsa-lib when
	BR2_PREFER_STATIC_LIB is selected.
Message-ID: <1384746819-16110-1-git-send-email-Sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

The mixer in ALSA library depends on runtime library loader which
doesn't available if building for static library.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/alsa-lib/alsa-lib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index a7ffd77..145bcf8 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -19,7 +19,7 @@ ALSA_LIB_CONF_OPT = --with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVD
 
 # Can't build with static & shared at the same time (1.0.25+)
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-ALSA_LIB_CONF_OPT += --enable-shared=no
+ALSA_LIB_CONF_OPT += --enable-shared=no --disable-mixer
 else
 ALSA_LIB_CONF_OPT += --enable-static=no
 endif
-- 
1.8.2.3
