From: Mark Corbin <mark.corbin@embecosm.com>
Date: Sun, 21 Oct 2018 20:12:03 +0100
Subject: [Buildroot] [PATCH v4 3/3] support/config-fragments: add RISC-V
 32-bit to autobuild configs
In-Reply-To: <20181021191203.2148-1-mark.corbin@embecosm.com>
References: <20181021191203.2148-1-mark.corbin@embecosm.com>
Message-ID: <20181021191203.2148-3-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a minimal RISC-V 32-bit autobuild configuration for the
internal toolchain with glibc.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>

---
Changes v3 -> v4:
  - set new variable BR2_RISCV_32 in br-riscv32-internal-glibc.config
---
 .../autobuild/br-riscv32-internal-glibc.config                 | 3 +++
 support/config-fragments/autobuild/toolchain-configs.csv       | 1 +
 2 files changed, 4 insertions(+)
 create mode 100644 support/config-fragments/autobuild/br-riscv32-internal-glibc.config

diff --git a/support/config-fragments/autobuild/br-riscv32-internal-glibc.config b/support/config-fragments/autobuild/br-riscv32-internal-glibc.config
new file mode 100644
index 0000000000..c5348a28da
--- /dev/null
+++ b/support/config-fragments/autobuild/br-riscv32-internal-glibc.config
@@ -0,0 +1,3 @@
+BR2_riscv=y
+BR2_RISCV_32=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index f24ec9ced0..3681bc519f 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -51,6 +51,7 @@ support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-e500mc-full.config,x86_64
 support/config-fragments/autobuild/br-powerpc-internal-full.config,any
+support/config-fragments/autobuild/br-riscv32-internal-glibc.config,any
 support/config-fragments/autobuild/br-riscv64-internal-glibc.config,any
 support/config-fragments/autobuild/br-sh4-full.config,x86_64
 support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
-- 
2.17.1
