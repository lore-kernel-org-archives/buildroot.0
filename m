From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:21 +0200
Subject: [Buildroot] [PATCH 33/36] package/qemu: option to build the docs
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-33-git-send-email-yann.morin.1998@free.fr>
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
index a1d192e..9e3e65f 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -177,6 +177,12 @@ ifeq ($(BR2_PACKAGE_QEMU_BLOBS),)
 QEMU_OPTS += --disable-blobs
 endif
 
+ifeq ($(BR2_HAVE_DOCUMENTATION),y)
+QEMU_OPTS += --enable-docs
+else
+QEMU_OPTS += --disable-docs
+endif
+
 #----------------------------------------------------------------------------
 # Package hooks
 
@@ -262,7 +268,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-vnc-sasl                  \
 	        --disable-brlapi                    \
 	        --disable-guest-base                \
-	        --disable-docs                      \
 	        --disable-rbd                       \
 	        --disable-guest-agent               \
 	        --disable-smartcard                 \
-- 
1.7.2.5
