From: Mark Corbin <mark@dibsco.co.uk>
Date: Fri,  8 May 2020 11:33:38 +0100
Subject: [Buildroot] [PATCH 2/2] support/config-fragments: add RISC-V 64-bit
 uclibc autobuild config
In-Reply-To: <20200508103338.16391-1-mark@dibsco.co.uk>
References: <20200508103338.16391-1-mark@dibsco.co.uk>
Message-ID: <20200508103338.16391-2-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that RISC-V 64 bit can use uclibc, glibc and musl we can add
uclibc to the autobuild internal toolchain configurations by
removing the musl specific config file and adding a generic one.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 ...v64-internal-musl.config => br-riscv64-full-internal.config} | 1 -
 support/config-fragments/autobuild/toolchain-configs.csv        | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)
 rename support/config-fragments/autobuild/{br-riscv64-internal-musl.config => br-riscv64-full-internal.config} (57%)

diff --git a/support/config-fragments/autobuild/br-riscv64-internal-musl.config b/support/config-fragments/autobuild/br-riscv64-full-internal.config
similarity index 57%
rename from support/config-fragments/autobuild/br-riscv64-internal-musl.config
rename to support/config-fragments/autobuild/br-riscv64-full-internal.config
index 89e7afb276..c729eb55e9 100644
--- a/support/config-fragments/autobuild/br-riscv64-internal-musl.config
+++ b/support/config-fragments/autobuild/br-riscv64-full-internal.config
@@ -1,3 +1,2 @@
 BR2_riscv=y
-BR2_TOOLCHAIN_BUILDROOT_MUSL=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 9b41e2173b..88b0e72ab3 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -53,7 +53,7 @@ support/config-fragments/autobuild/br-powerpc-e500mc-full.config,x86_64
 support/config-fragments/autobuild/br-powerpc-internal-full.config,any
 support/config-fragments/autobuild/br-riscv32.config,x86_64
 support/config-fragments/autobuild/br-riscv64.config,x86_64
-support/config-fragments/autobuild/br-riscv64-internal-musl.config,any
+support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-sh4-full.config,x86_64
 support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
-- 
2.20.1
