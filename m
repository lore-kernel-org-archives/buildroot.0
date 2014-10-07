From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:35 +0200
Subject: [Buildroot] [PATCH 26/30] package/qemu: option to build the docs
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <13ee01be55a7de533c670c246bbcd039ceb14e8e.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b79e60f..b808c96 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -260,6 +260,12 @@ ifeq ($(BR2_PACKAGE_QEMU_BLOBS),)
 QEMU_OPTS += --disable-blobs
 endif
 
+ifeq ($(BR2_HAVE_DOCUMENTATION),y)
+QEMU_OPTS += --enable-docs
+else
+QEMU_OPTS += --disable-docs
+endif
+
 # Post-install removal of unwanted keymaps:
 # - if we want 'all', we do nothing;
 # - if we want none, we completely remove the keymap dir
@@ -334,7 +340,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-brlapi                    \
 	        --disable-fdt                       \
 	        --disable-guest-base                \
-	        --disable-docs                      \
 	        --disable-rbd                       \
 	        --disable-smartcard-nss             \
 	        --disable-strip                     \
-- 
1.9.1
