From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Feb 2020 22:10:06 +0100
Subject: [Buildroot] [git commit] toolchain: use consistent code style for C
 code
Message-ID: <20200208205902.3BD7A8D5CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fd8dd203a73f51ff3bcfe5eee600d0526403c6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most, but not all our C code follows the Linux kernel code style (as
documented in Documentation/process/coding-style.rst).  Adjust the few
places doing differently:

- Braces:
  ..but the preferred way, as shown to us by the prophets Kernighan
  and Ritchie, is to put the opening brace last on the line

- Spaces after keywords:
  Use a space after (most) keywords

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/check-kernel-headers.sh | 3 +--
 toolchain/toolchain-wrapper.c           | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
index d1864cb05e..841df98b64 100755
--- a/support/scripts/check-kernel-headers.sh
+++ b/support/scripts/check-kernel-headers.sh
@@ -53,8 +53,7 @@ int main(int argc __attribute__((unused)),
     int l = LINUX_VERSION_CODE & ~0xFF;
     int h = KERNEL_VERSION(${HDR_M},${HDR_m},0);
 
-    if(l != h)
-    {
+    if (l != h) {
         printf("Incorrect selection of kernel headers: ");
         printf("expected %d.%d.x, got %d.%d.x\n", ${HDR_M}, ${HDR_m},
                ((LINUX_VERSION_CODE>>16) & 0xFF),
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index b7705a4cbf..8cfc963ccd 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -434,7 +434,7 @@ int main(int argc, char **argv)
 		/* Both args below can be set at compile/link time
 		 * and are ignored correctly when not used
 		 */
-		if(i == argc)
+		if (i == argc)
 			*cur++ = "-fPIE";
 
 		if (!found_shared)
