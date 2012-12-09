From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Dec 2012 17:35:19 +0100
Subject: [Buildroot] [PATCH 46/51] package/qemu: option to build the docs
In-Reply-To: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355070924-8009-47-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 1fbc810..5aa12ab 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -261,6 +261,12 @@ ifeq ($(BR2_PACKAGE_QEMU_BLOBS),)
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
@@ -340,7 +346,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-brlapi                    \
 	        --disable-fdt                       \
 	        --disable-guest-base                \
-	        --disable-docs                      \
 	        --disable-rbd                       \
 	        --disable-smartcard                 \
 	        --disable-strip                     \
-- 
1.7.2.5
