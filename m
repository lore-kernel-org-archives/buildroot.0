From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  6 Feb 2020 11:04:16 -0800
Subject: [Buildroot] [PATCH 3/3] package/qemu: add support for sparc64
In-Reply-To: <20200206190416.48560-1-aduskett@gmail.com>
References: <20200206190416.48560-1-aduskett@gmail.com>
Message-ID: <20200206190416.48560-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This prevents illegal instruction errors when running qemu.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/qemu/qemu.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 6794157709..f6c14c6a47 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -237,6 +237,9 @@ endif
 ifeq ($(HOST_QEMU_ARCH),sh4aeb)
 HOST_QEMU_ARCH = sh4eb
 endif
+ifeq ($(HOST_QEMU_ARCH),sparc64)
+HOST_QEMU_ARCH = sparc64
+endif
 ifeq ($(HOST_QEMU_ARCH),csky)
 ifeq ($(BR2_ck610),y)
 HOST_QEMU_ARCH = cskyv1
-- 
2.21.1 (Apple Git-122.3)
