From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 22:16:08 +0100
Subject: [Buildroot] [git commit] package/qemu: fixup enable host QEMU for
	powerpc64/powerpc64le
Message-ID: <20161125211619.E2C87817AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2ff457e88ff4106f97e29516d467978827d30c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes next commit d634d9dda7f3c328d63469cb628c79da49a09e89, which itself
fixes:

  http://autobuild.buildroot.net/results/f58ec73d906a5da49a88ed78492e3b5bf8cecdd4/

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
