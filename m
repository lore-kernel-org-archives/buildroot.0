From: Mark Corbin <mark@dibsco.co.uk>
Date: Sun, 10 May 2020 16:43:47 +0100
Subject: [Buildroot] [PATCH v2 3/3] support/config-fragments: use external
 riscv64 musl toolchain
In-Reply-To: <20200510154347.5711-1-mark@dibsco.co.uk>
References: <20200510154347.5711-1-mark@dibsco.co.uk>
Message-ID: <20200510154347.5711-3-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move to an external RISC-V 64 bit musl toolchain to ease the load
on the autobuilders.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 .../autobuild/br-riscv64-internal-musl.config            | 3 ---
 .../config-fragments/autobuild/br-riscv64-musl.config    | 9 +++++++++
 2 files changed, 9 insertions(+), 3 deletions(-)
 delete mode 100644 support/config-fragments/autobuild/br-riscv64-internal-musl.config
 create mode 100644 support/config-fragments/autobuild/br-riscv64-musl.config

diff --git a/support/config-fragments/autobuild/br-riscv64-internal-musl.config b/support/config-fragments/autobuild/br-riscv64-internal-musl.config
deleted file mode 100644
index 89e7afb276..0000000000
--- a/support/config-fragments/autobuild/br-riscv64-internal-musl.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_riscv=y
-BR2_TOOLCHAIN_BUILDROOT_MUSL=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-riscv64-musl.config b/support/config-fragments/autobuild/br-riscv64-musl.config
new file mode 100644
index 0000000000..fd6ef822aa
--- /dev/null
+++ b/support/config-fragments/autobuild/br-riscv64-musl.config
@@ -0,0 +1,9 @@
+BR2_riscv=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-musl-2020.02.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
-- 
2.20.1
