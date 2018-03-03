From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Mar 2018 17:19:20 +0100
Subject: [Buildroot] [git commit] board/qemu/ppc64le-pseries: use
 qemu-system-ppc64
Message-ID: <20180303162031.E9B75815FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62e8305358641da03a827e3d729ed0187927650f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qemu-system-ppc64le doesn't necessarily exist: it isn't installed by
Qemu, and only created as a symlink to qemu-system-ppc64 by some
distributions (Ubuntu). Other distributions (Fedora) just have
qemu-system-ppc64.

But qemu-system-ppc64 is capable of running little-endian PPC64
systems, so use this one instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/ppc64le-pseries/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/ppc64le-pseries/readme.txt b/board/qemu/ppc64le-pseries/readme.txt
index dd188c505f..beda5c0618 100644
--- a/board/qemu/ppc64le-pseries/readme.txt
+++ b/board/qemu/ppc64le-pseries/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-qemu-system-ppc64le -M pseries -nographic \
+qemu-system-ppc64 -M pseries -nographic \
 		-kernel output/images/vmlinux \
 		-initrd output/images/rootfs.ext2
 
