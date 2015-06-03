From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:42 +0200
Subject: [Buildroot] [PATCH 25/32 v2] package/matchbox-keyboard: enforce
	disabling support for cairo
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <e4446fde326327cf9570405a754ae9022fe74741.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We usually explicitly enforce disabling optional support when it is
possible.

Do so for Cairo.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/matchbox-keyboard/matchbox-keyboard.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox-keyboard/matchbox-keyboard.mk
index fcdd8b1..ba524c0 100644
--- a/package/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox-keyboard/matchbox-keyboard.mk
@@ -24,6 +24,7 @@ ifeq ($(BR2_PACKAGE_CAIRO),y)
 MATCHBOX_KEYBOARD_CONF_OPTS += --enable-cairo
 MATCHBOX_KEYBOARD_DEPENDENCIES += cairo
 else
+MATCHBOX_KEYBOARD_CONF_OPTS += --disable-cairo
 MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
 endif
 
-- 
1.9.1
