From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:35 +0200
Subject: [Buildroot] [PATCH 24/30] package/matchbox-keyboard: enforce
	disabling support for cairo
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <082cf033f1f2c8e12260b05f14b9c6300c5d44b5.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We usually explicitly enforce disabling optional support when it is
possible.

Do so for Cairo.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/matchbox-keyboard/matchbox-keyboard.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index 2017730..368a883 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -24,6 +24,7 @@ ifeq ($(BR2_PACKAGE_CAIRO),y)
 MATCHBOX_KEYBOARD_CONF_OPTS += --enable-cairo
 MATCHBOX_KEYBOARD_DEPENDENCIES += cairo
 else
+MATCHBOX_KEYBOARD_CONF_OPTS += --disable-cairo
 MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
 endif
 
-- 
1.9.1
