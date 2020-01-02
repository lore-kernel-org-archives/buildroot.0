From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 09:15:43 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: fix
 riscv toolchains
Message-ID: <20200102080619.F317F8EB4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dbea2216df610cca543c56e6a1e327797b07db1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit aee39cbf27e (arch/riscv: set the default float ABI based on
ISA extensions), the default ABI changed, so the config fragments used
by the autobuilders were adapated accordingly, in commit f89871e81085
(support/config-fragments: fix br-riscv{32,64} toolchain fragments).

But now, we need to revert again, because the newer toolchains are now
using the default ABI again.

We do not really do a revert, though, because the original change was
right, and a revert would mean it was not.

Fixes:
    http://autobuild.buildroot.org/results/b59/b593267fb9fc9a002b977e049b2a5389dbaded30/ (riscv32)
    http://autobuild.buildroot.org/results/b42/b42a4b22b29f47d5c85be119b310f1dfb61112a1/ (riscv64)
    ... and so many others on various packages...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mark Corbin <mark.corbin@embecosm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-riscv32.config | 1 -
 support/config-fragments/autobuild/br-riscv64.config | 1 -
 2 files changed, 2 deletions(-)

diff --git a/support/config-fragments/autobuild/br-riscv32.config b/support/config-fragments/autobuild/br-riscv32.config
index 4ec6ca9f89..f8901edf2d 100644
--- a/support/config-fragments/autobuild/br-riscv32.config
+++ b/support/config-fragments/autobuild/br-riscv32.config
@@ -1,6 +1,5 @@
 BR2_riscv=y
 BR2_RISCV_32=y
-BR2_RISCV_ABI_ILP32=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
 BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv32-glibc-2019.11.tar.bz2"
diff --git a/support/config-fragments/autobuild/br-riscv64.config b/support/config-fragments/autobuild/br-riscv64.config
index 0706c7b5da..f98675d8dd 100644
--- a/support/config-fragments/autobuild/br-riscv64.config
+++ b/support/config-fragments/autobuild/br-riscv64.config
@@ -1,5 +1,4 @@
 BR2_riscv=y
-BR2_RISCV_ABI_LP64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
 BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-glibc-2019.11.tar.bz2"
