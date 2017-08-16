From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 22:53:59 +0200
Subject: [Buildroot] [git commit] boot/syslinux: renumber patches
Message-ID: <20170816210158.DFE318211C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4867d07d354a0f2edb9df37c0dc9b64e840aa8d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also the last two are regenerated, their context has changed due to
the patches that have been removed earlier.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ... => 0003-memdisk-Force-ld-output-format-to-32-bits.patch} |  0
 ...atch => 0004-utils-Use-the-host-toolchain-to-build.patch} |  0
 ...ch => 0005-lzo-Use-the-host-toolchain-for-prepcore.patch} |  0
 ...e-VPrint-definition-is-now-part-of-the-exports-of-.patch} |  0
 ...date-the-longjump-calls-to-fit-the-new-declaration.patch} | 12 ++++++------
 ... 0008-efi-wrapper-build-it-with-the-host-toolchain.patch} |  8 ++++----
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/boot/syslinux/0004-memdisk-Force-ld-output-format-to-32-bits.patch b/boot/syslinux/0003-memdisk-Force-ld-output-format-to-32-bits.patch
similarity index 100%
rename from boot/syslinux/0004-memdisk-Force-ld-output-format-to-32-bits.patch
rename to boot/syslinux/0003-memdisk-Force-ld-output-format-to-32-bits.patch
diff --git a/boot/syslinux/0005-utils-Use-the-host-toolchain-to-build.patch b/boot/syslinux/0004-utils-Use-the-host-toolchain-to-build.patch
similarity index 100%
rename from boot/syslinux/0005-utils-Use-the-host-toolchain-to-build.patch
rename to boot/syslinux/0004-utils-Use-the-host-toolchain-to-build.patch
diff --git a/boot/syslinux/0006-lzo-Use-the-host-toolchain-for-prepcore.patch b/boot/syslinux/0005-lzo-Use-the-host-toolchain-for-prepcore.patch
similarity index 100%
rename from boot/syslinux/0006-lzo-Use-the-host-toolchain-for-prepcore.patch
rename to boot/syslinux/0005-lzo-Use-the-host-toolchain-for-prepcore.patch
diff --git a/boot/syslinux/0007-The-VPrint-definition-is-now-part-of-the-exports-of-.patch b/boot/syslinux/0006-The-VPrint-definition-is-now-part-of-the-exports-of-.patch
similarity index 100%
rename from boot/syslinux/0007-The-VPrint-definition-is-now-part-of-the-exports-of-.patch
rename to boot/syslinux/0006-The-VPrint-definition-is-now-part-of-the-exports-of-.patch
diff --git a/boot/syslinux/0009-Update-the-longjump-calls-to-fit-the-new-declaration.patch b/boot/syslinux/0007-Update-the-longjump-calls-to-fit-the-new-declaration.patch
similarity index 76%
rename from boot/syslinux/0009-Update-the-longjump-calls-to-fit-the-new-declaration.patch
rename to boot/syslinux/0007-Update-the-longjump-calls-to-fit-the-new-declaration.patch
index cb36998..90d0b81 100644
--- a/boot/syslinux/0009-Update-the-longjump-calls-to-fit-the-new-declaration.patch
+++ b/boot/syslinux/0007-Update-the-longjump-calls-to-fit-the-new-declaration.patch
@@ -1,4 +1,4 @@
-From db49dbac8a0c563fb6d07c348873e8ae50fee2a6 Mon Sep 17 00:00:00 2001
+From 3bd5c2d951421a89f76b2423e5810862f53486c1 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
 Date: Fri, 9 Jun 2017 11:59:43 +0200
 Subject: [PATCH] Update the longjump calls to fit the new declaration
@@ -12,7 +12,7 @@ Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/efi/main.c b/efi/main.c
-index fd95f5c..b5383cd 100644
+index 208fee4f..71d31a5c 100644
 --- a/efi/main.c
 +++ b/efi/main.c
 @@ -10,7 +10,6 @@
@@ -23,15 +23,15 @@ index fd95f5c..b5383cd 100644
  
  #include "efi.h"
  #include "fio.h"
-@@ -31,7 +30,7 @@ uint32_t timer_irq;
+@@ -30,7 +29,7 @@ uint32_t timer_irq;
  __export uint8_t KbdMap[256];
  char aux_seg[256];
  
 -static jmp_buf load_error_buf;
 +static jmp_buf *load_error_buf;
  
- EFI_HANDLE image_handle, image_device_handle, mnpsb_handle;
- 
+ static inline EFI_STATUS
+ efi_close_protocol(EFI_HANDLE handle, EFI_GUID *guid, EFI_HANDLE agent,
 -- 
-2.1.4
+2.13.3
 
diff --git a/boot/syslinux/0010-efi-wrapper-build-it-with-the-host-toolchain.patch b/boot/syslinux/0008-efi-wrapper-build-it-with-the-host-toolchain.patch
similarity index 81%
rename from boot/syslinux/0010-efi-wrapper-build-it-with-the-host-toolchain.patch
rename to boot/syslinux/0008-efi-wrapper-build-it-with-the-host-toolchain.patch
index c8ff9eb..9ec12a1 100644
--- a/boot/syslinux/0010-efi-wrapper-build-it-with-the-host-toolchain.patch
+++ b/boot/syslinux/0008-efi-wrapper-build-it-with-the-host-toolchain.patch
@@ -1,4 +1,4 @@
-From 755c947e9166366bd1a78efb1e0c7d6e6e2daa07 Mon Sep 17 00:00:00 2001
+From ca8aaded0c7c3900397029bd9520132b62629308 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
 Date: Mon, 12 Jun 2017 14:59:16 +0200
 Subject: [PATCH] efi/wrapper: build it with the host toolchain.
@@ -15,10 +15,10 @@ Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/efi/Makefile b/efi/Makefile
-index d3788d9..a17258a 100644
+index d5443bd5..d24d16db 100644
 --- a/efi/Makefile
 +++ b/efi/Makefile
-@@ -78,7 +78,7 @@ syslinux.so: $(OBJS) $(CORE_OBJS) $(LIB_OBJS)
+@@ -79,7 +79,7 @@ syslinux.so: $(OBJS) $(CORE_OBJS) $(LIB_OBJS)
  #	cp $^ $@
  
  wrapper: wrapper.c
@@ -28,5 +28,5 @@ index d3788d9..a17258a 100644
  #
  # Build the wrapper app and wrap our .so to produce a .efi
 -- 
-2.1.4
+2.13.3
 
