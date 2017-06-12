From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 23:49:09 +0200
Subject: [Buildroot] [git commit] syslinux: Add patch to build efi/wrapper
	with the host toolchain
Message-ID: <20170612215502.8B4BB803A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b235aa6f6383b03dae59d1fec9586df077cb274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'wrapper' tool built by syslinux is executed on the build machine,
so it should be built with CC_FOR_BUILD.

Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-wrapper-build-it-with-the-host-toolchain.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/boot/syslinux/0010-efi-wrapper-build-it-with-the-host-toolchain.patch b/boot/syslinux/0010-efi-wrapper-build-it-with-the-host-toolchain.patch
new file mode 100644
index 0000000..c8ff9eb
--- /dev/null
+++ b/boot/syslinux/0010-efi-wrapper-build-it-with-the-host-toolchain.patch
@@ -0,0 +1,32 @@
+From 755c947e9166366bd1a78efb1e0c7d6e6e2daa07 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
+Date: Mon, 12 Jun 2017 14:59:16 +0200
+Subject: [PATCH] efi/wrapper: build it with the host toolchain.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The wrapper program is executed on the build machine, so it should be
+built with CC_FOR_BUILD.
+
+Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
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
