From: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
Date: Mon, 16 Mar 2015 18:00:13 +0800
Subject: [Buildroot] [PATCH 5/5] aarch64: ilp32 defconfig examples
In-Reply-To: <1426500013-1276-1-git-send-email-bamvor.zhangjian@huawei.com>
References: <1426500013-1276-1-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <1426500013-1276-6-git-send-email-bamvor.zhangjian@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DO NOT APPLY.

Here is the examples about how do I test my patches.

Signed-off-by: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
---
 configs/aarch64_be_defconfig       | 10 ++++++++++
 configs/aarch64_be_ilp32_defconfig | 12 ++++++++++++
 configs/aarch64_ilp32_defconfig    | 12 ++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 configs/aarch64_be_defconfig
 create mode 100644 configs/aarch64_be_ilp32_defconfig
 create mode 100644 configs/aarch64_ilp32_defconfig

diff --git a/configs/aarch64_be_defconfig b/configs/aarch64_be_defconfig
new file mode 100644
index 0000000..0d1119d
--- /dev/null
+++ b/configs/aarch64_be_defconfig
@@ -0,0 +1,10 @@
+# Architecture
+BR2_aarch64_be=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y
+BR2_TOOLCHAIN_EXTERNAL_PATH="/path/to/toolchain/"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux-gnu"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/aarch64_be_ilp32_defconfig b/configs/aarch64_be_ilp32_defconfig
new file mode 100644
index 0000000..1a228df
--- /dev/null
+++ b/configs/aarch64_be_ilp32_defconfig
@@ -0,0 +1,12 @@
+# Architecture
+BR2_aarch64_be=y
+BR2_AARCH64_ILP32=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y
+BR2_TOOLCHAIN_EXTERNAL_PATH="/path/to/toolchain/"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux-gnu"
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/aarch64_ilp32_defconfig b/configs/aarch64_ilp32_defconfig
new file mode 100644
index 0000000..c6841c5
--- /dev/null
+++ b/configs/aarch64_ilp32_defconfig
@@ -0,0 +1,12 @@
+# Architecture
+BR2_aarch64=y
+BR2_AARCH64_ILP32=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y
+BR2_TOOLCHAIN_EXTERNAL_PATH="/path/to/toolchain/"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux-gnu"
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
-- 
1.8.4.5
