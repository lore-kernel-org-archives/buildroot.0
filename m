From: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
Date: Tue, 21 Jul 2015 16:46:04 +0800
Subject: [Buildroot] [PATCH V3 5/5] aarch64: ilp32 defconfig examples
In-Reply-To: <1437468364-19245-1-git-send-email-bamvor.zhangjian@huawei.com>
References: <1437468364-19245-1-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <1437468364-19245-6-git-send-email-bamvor.zhangjian@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DO NOT APPLY.

Test aarch64 lp64 through qemu_aarch64_virt_defconfig.
Test aarch64 ilp32, aarch64_be lp64, aarch64_be ilp32 through the
following config.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
---
 configs/aarch64_be_defconfig       | 2 ++
 configs/aarch64_be_ilp32_defconfig | 8 ++++++++
 configs/aarch64_ilp32_defconfig    | 8 ++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 configs/aarch64_be_defconfig
 create mode 100644 configs/aarch64_be_ilp32_defconfig
 create mode 100644 configs/aarch64_ilp32_defconfig

diff --git a/configs/aarch64_be_defconfig b/configs/aarch64_be_defconfig
new file mode 100644
index 0000000..6995953
--- /dev/null
+++ b/configs/aarch64_be_defconfig
@@ -0,0 +1,2 @@
+# Architecture
+BR2_aarch64_be=y
diff --git a/configs/aarch64_be_ilp32_defconfig b/configs/aarch64_be_ilp32_defconfig
new file mode 100644
index 0000000..6a2848a
--- /dev/null
+++ b/configs/aarch64_be_ilp32_defconfig
@@ -0,0 +1,8 @@
+# Architecture
+BR2_aarch64_be=y
+BR2_AARCH64_ILP32=y
+BR2_TOOLCHAIN_EXTERNAL_PATH="/path/to/your/toolchain"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux-gnu"
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/aarch64_ilp32_defconfig b/configs/aarch64_ilp32_defconfig
new file mode 100644
index 0000000..2b59806
--- /dev/null
+++ b/configs/aarch64_ilp32_defconfig
@@ -0,0 +1,8 @@
+# Architecture
+BR2_aarch64=y
+BR2_AARCH64_ILP32=y
+BR2_TOOLCHAIN_EXTERNAL_PATH="/home/bamvor/works/software/toolchain/gcc-linaro-4.9~git82c1251-aarch64_aarch64-ilp32-linux-gnu-20150310"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-ilp32-linux-gnu"
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
-- 
2.1.4
