From: Nylon Chen <nylon7@andestech.com>
Date: Wed, 23 Jan 2019 20:39:47 +0800
Subject: [Buildroot] [PATCH v2 3/3] support/config-fragments: add Andes
 32-bit (nds32) to autobuild configs
In-Reply-To: <20190123123947.5084-1-nylon7@andestech.com>
References: <20190123123947.5084-1-nylon7@andestech.com>
Message-ID: <20190123123947.5084-4-nylon7@andestech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a minimal nds32 autobuild configuration for the
internal toolchain with glibc.

Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
Signed-off-by: Greentime Hu <greentime@andestech.com>
Signed-off-by: Nylon Chen <nylon7@andestech.com>
---
 .../autobuild/br-andes-nds32-glibc.config                | 9 +++++++++
 support/config-fragments/autobuild/toolchain-configs.csv | 1 +
 2 files changed, 10 insertions(+)
 create mode 100644 support/config-fragments/autobuild/br-andes-nds32-glibc.config

diff --git a/support/config-fragments/autobuild/br-andes-nds32-glibc.config b/support/config-fragments/autobuild/br-andes-nds32-glibc.config
new file mode 100644
index 0000000000..cd093a20f9
--- /dev/null
+++ b/support/config-fragments/autobuild/br-andes-nds32-glibc.config
@@ -0,0 +1,9 @@
+BR2_nds32=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz"
+BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_17=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="nds32le-linux"
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 3681bc519f..4fa5f63b2b 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -74,3 +74,4 @@ support/config-fragments/autobuild/sourcery-mips.config,x86
 support/config-fragments/autobuild/sourcery-nios2.config,x86
 support/config-fragments/autobuild/sourcery-x86-64.config,x86
 support/config-fragments/autobuild/x86_64-ctng_locales-linux-gnu.config,x86
+support/config-fragments/autobuild/br-andes-nds32-glibc.config,x86
-- 
2.18.0
