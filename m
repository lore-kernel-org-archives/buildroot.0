From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 22:15:54 +0100
Subject: [Buildroot] [git commit] package/qemu: enable host QEMU for
	powerpc64/powerpc64le
Message-ID: <20161125211619.D7306817AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a8d3f83b54c901fb84525148dfc1bf58b98798b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed to fix:

  http://autobuild.buildroot.net/results/f58ec73d906a5da49a88ed78492e3b5bf8cecdd4/

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
