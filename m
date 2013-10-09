From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Oct 2013 23:44:19 +0200
Subject: [Buildroot] [PATCH 3/9] package/wayland: install wayland-scanner to
	$(HOST)
In-Reply-To: <cover.1381354867.git.yann.morin.1998@free.fr>
References: <cover.1381354867.git.yann.morin.1998@free.fr>
Message-ID: <448f7432fc0b7c091413dd494e6b9d838cf51527.1381354867.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

wayland-scanner is needed by weston.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wayland/wayland.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 0810536..739971b 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -22,7 +22,8 @@ WAYLAND_CONF_OPT = --disable-scanner
 define WAYLAND_BUILD_SCANNER
 	(cd $(@D)/src/; \
 		$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
-			-o wayland-scanner scanner.c wayland-util.c -lexpat)
+			-o wayland-scanner scanner.c wayland-util.c -lexpat; \
+	 install -m 0755 -D wayland-scanner $(HOST_DIR)/usr/bin/wayland-scanner )
 endef
 
 WAYLAND_POST_CONFIGURE_HOOKS += WAYLAND_BUILD_SCANNER
-- 
1.8.1.2
