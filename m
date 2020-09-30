From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 30 Sep 2020 20:26:41 +0200
Subject: [Buildroot] [PATCH] support/config-fragments: add s390x z13 to
 autobuild configs
Message-ID: <20200930182641.5588-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a minimal s390x s13 autobuild configuration for the
internal toolchain with glibc.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 .../autobuild/br-s390x-z13-internal-glibc.config              | 4 ++++
 support/config-fragments/autobuild/toolchain-configs.csv      | 1 +
 2 files changed, 5 insertions(+)
 create mode 100644 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config

diff --git a/support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config b/support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config
new file mode 100644
index 0000000000..56af5fb1ba
--- /dev/null
+++ b/support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config
@@ -0,0 +1,4 @@
+BR2_s390x=y
+BR2_s390x_z13=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 5b8b9da7e7..f84f27ddcd 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -56,6 +56,7 @@ support/config-fragments/autobuild/br-riscv32.config,x86_64
 support/config-fragments/autobuild/br-riscv64.config,x86_64
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-riscv64-musl.config,x86_64
+support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
 support/config-fragments/autobuild/br-sh4-full.config,x86_64
 support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
-- 
2.25.4
