From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Nov 2015 22:36:28 +0100
Subject: [Buildroot] [PATCH 1/3] package/skeleton: qstrip path before using
	it
In-Reply-To: <cover.1447190450.git.yann.morin.1998@free.fr>
References: <cover.1447190450.git.yann.morin.1998@free.fr>
Message-ID: <73f637e361b2fb11bc5a52d8e68be8d701cf6902.1447190450.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/skeleton/skeleton.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index d1b797d..11a609b 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -14,7 +14,7 @@ SKELETON_SOURCE =
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
-SKELETON_PATH = $(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
+SKELETON_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
 else
 SKELETON_PATH = system/skeleton
 endif
-- 
1.9.1
