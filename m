From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed, 23 Nov 2016 13:25:02 +1100
Subject: [Buildroot] [PATCH 1/1] package/qemu: enable host QEMU for
	powerpc64/powerpc64le
Message-ID: <a335c60f72c52d158a29c757c1ee74b098de65fd.1479867900.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---

 package/qemu/qemu.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index cf23f16..ae4e0ad 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -34,6 +34,8 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-p
 #       mips64          mips64
 #       mips64el        mips64el
 #       powerpc         ppc
+#       powerpc64       ppc64
+#       powerpc64le     ppc64 (ppc64 supports little-endian)
 #       sh2a            not supported
 #       sh4             sh4
 #       sh4eb           sh4eb
@@ -55,6 +57,12 @@ endif
 ifeq ($(HOST_QEMU_ARCH),powerpc)
 HOST_QEMU_ARCH = ppc
 endif
+ifeq ($(HOST_QEMU_ARCH),powerpc64)
+HOST_QEMU_ARCH = ppc64
+endif
+ifeq ($(HOST_QEMU_ARCH),powerpc64le)
+HOST_QEMU_ARCH = ppc64
+endif
 ifeq ($(HOST_QEMU_ARCH),sh4a)
 HOST_QEMU_ARCH = sh4
 endif
-- 
2.10.0.297.gf6727b0
