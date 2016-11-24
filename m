From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Thu, 24 Nov 2016 16:56:42 +1100
Subject: [Buildroot] [PATCH 1/1] package/qemu: fixup enable host QEMU for
	powerpc64/powerpc64le
Message-ID: <a9e27a3340744ae0233852ec320e0039be8c828e.1479966991.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes next commit d634d9dda7f3c328d63469cb628c79da49a09e89.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
Baruch,

I've rebased the patch onto next, I'm not sure what other changes to
make. Does it look OK now? (Will it get squashed in next?)

Cheers,
Sam.

 package/qemu/qemu.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index ae4e0ad..45fc0fa 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -35,7 +35,7 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-p
 #       mips64el        mips64el
 #       powerpc         ppc
 #       powerpc64       ppc64
-#       powerpc64le     ppc64 (ppc64 supports little-endian)
+#       powerpc64le     ppc64le
 #       sh2a            not supported
 #       sh4             sh4
 #       sh4eb           sh4eb
@@ -61,7 +61,7 @@ ifeq ($(HOST_QEMU_ARCH),powerpc64)
 HOST_QEMU_ARCH = ppc64
 endif
 ifeq ($(HOST_QEMU_ARCH),powerpc64le)
-HOST_QEMU_ARCH = ppc64
+HOST_QEMU_ARCH = ppc64le
 endif
 ifeq ($(HOST_QEMU_ARCH),sh4a)
 HOST_QEMU_ARCH = sh4
-- 
2.10.0.297.gf6727b0
