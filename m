From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat,  8 Feb 2020 13:15:12 -0800
Subject: [Buildroot] [PATCH v2 3/3] package/qemu: add support for sparc64
In-Reply-To: <20200208211512.994361-1-aduskett@gmail.com>
References: <20200208211512.994361-1-aduskett@gmail.com>
Message-ID: <20200208211512.994361-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

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
2.24.1
