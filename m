From: Nylon Chen <nylon7@andestech.com>
Date: Thu, 7 Mar 2019 10:11:25 +0800
Subject: [Buildroot] [PATCH v3 3/3] upport/config-fragments/autobuild: test
 the Andes nds32 toolchain
In-Reply-To: <20190307021125.8530-1-nylon7@andestech.com>
References: <20190307021125.8530-1-nylon7@andestech.com>
Message-ID: <20190307021125.8530-4-nylon7@andestech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
Signed-off-by: Greentime Hu <greentime@andestech.com>
Signed-off-by: Nylon Chen <nylon7@andestech.com>
---
 support/config-fragments/autobuild/br-andes-nds32.config | 9 +++++++++
 support/config-fragments/autobuild/toolchain-configs.csv | 1 +
 2 files changed, 10 insertions(+)
 create mode 100644 support/config-fragments/autobuild/br-andes-nds32.config

diff --git a/support/config-fragments/autobuild/br-andes-nds32.config b/support/config-fragments/autobuild/br-andes-nds32.config
new file mode 100644
index 0000000000..cd093a20f9
--- /dev/null
+++ b/support/config-fragments/autobuild/br-andes-nds32.config
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
index 3681bc519f..7a3b91df27 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -25,6 +25,7 @@ support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config,x86
 support/config-fragments/autobuild/arm-aarch64.config,x86_64
 support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config,x86
 support/config-fragments/autobuild/br-aarch64-glibc.config,x86_64
+support/config-fragments/autobuild/br-andes-nds32.config,x86
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
 support/config-fragments/autobuild/br-arcle-hs38.config,x86_64
-- 
2.18.0
