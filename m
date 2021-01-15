From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 15 Jan 2021 18:01:56 +0100
Subject: [Buildroot] [PATCH v2] uboot: fix binman with a new dependency
Message-ID: <20210115170156.917086-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

since 2021.01, tools/binman is broken.
tools/binman/control.py imports pkg_resources
the module pkg_resources is supplied by setuptools,
so this new dependency is required.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 boot/uboot/uboot.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d2b4e8dc6..3d057e709 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -166,9 +166,9 @@ UBOOT_DEPENDENCIES += host-dtc
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON2),y)
-UBOOT_DEPENDENCIES += host-python
+UBOOT_DEPENDENCIES += host-python host-python-setuptools
 else ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
-UBOOT_DEPENDENCIES += host-python3
+UBOOT_DEPENDENCIES += host-python3 host-python3-setuptools
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
-- 
2.27.0
