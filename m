From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 12:57:46 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: update
 CSV after musl toolchain rename
Message-ID: <20190803105501.DC1238377F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=228b0b1f0088ee8f8d1775b618a8725b8a4e0534
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit a5893254055610e416316803de0095b0ce6f03f6
("support/config-fragments/autobuild: rename br-riscv64-musl config"),
the RISC-V 64-bit musl toolchain config snippet was renamed, but the
toolchain.csv file was not updated accordingly.

Due to this, utils/genrandconfig was no longer able to generate any
configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/toolchain-configs.csv | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index da689c5fe7..9b41e2173b 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -53,7 +53,7 @@ support/config-fragments/autobuild/br-powerpc-e500mc-full.config,x86_64
 support/config-fragments/autobuild/br-powerpc-internal-full.config,any
 support/config-fragments/autobuild/br-riscv32.config,x86_64
 support/config-fragments/autobuild/br-riscv64.config,x86_64
-support/config-fragments/autobuild/br-riscv64-musl.config,any
+support/config-fragments/autobuild/br-riscv64-internal-musl.config,any
 support/config-fragments/autobuild/br-sh4-full.config,x86_64
 support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
