From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 26 Apr 2020 16:03:30 +0200
Subject: [Buildroot] [PATCH] boot/uboot: switch to host-python3
Message-ID: <20200426140330.6498-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

that fixes the following build failures with olimex_a20_olinuxino_lime*_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/526035680
https://gitlab.com/buildroot.org/buildroot/-/jobs/526035682

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2bfa50779..688cc17cc 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -160,7 +160,7 @@ UBOOT_DEPENDENCIES += host-dtc
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
-UBOOT_DEPENDENCIES += host-python host-swig
+UBOOT_DEPENDENCIES += host-python3 host-swig
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS),y)
-- 
2.20.1
