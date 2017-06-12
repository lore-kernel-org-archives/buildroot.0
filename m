From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Mon, 12 Jun 2017 15:16:41 +0200
Subject: [Buildroot] [PATCH] syslinux: Add patch to build efi/wrapper with
	the host toolchain
Message-ID: <1497273401-4010-1-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
 ...-wrapper-build-it-with-the-host-toolchain.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 boot/syslinux/0010-efi-wrapper-build-it-with-the-host-toolchain.patch

diff --git a/boot/syslinux/0010-efi-wrapper-build-it-with-the-host-toolchain.patch b/boot/syslinux/0010-efi-wrapper-build-it-with-the-host-toolchain.patch
new file mode 100644
index 0000000..e32f4d8
--- /dev/null
+++ b/boot/syslinux/0010-efi-wrapper-build-it-with-the-host-toolchain.patch
@@ -0,0 +1,29 @@
+From 755c947e9166366bd1a78efb1e0c7d6e6e2daa07 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
+Date: Mon, 12 Jun 2017 14:59:16 +0200
+Subject: [PATCH] efi/wrapper: build it with the host toolchain.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
+---
+ efi/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/efi/Makefile b/efi/Makefile
+index d3788d9..a17258a 100644
+--- a/efi/Makefile
++++ b/efi/Makefile
+@@ -78,7 +78,7 @@ syslinux.so: $(OBJS) $(CORE_OBJS) $(LIB_OBJS)
+ #	cp $^ $@
+ 
+ wrapper: wrapper.c
+-	$(CC) $^ -o $@
++	$(CC_FOR_BUILD) $^ -o $@
+ 
+ #
+ # Build the wrapper app and wrap our .so to produce a .efi
+-- 
+2.1.4
+
-- 
2.1.4
