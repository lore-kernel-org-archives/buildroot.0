From: oferh at marvell.com <oferh@marvell.com>
Date: Wed, 27 Jun 2018 17:55:47 +0300
Subject: [Buildroot] [PATCH 2/2] support/config-fragments/autobuild: add
 Linaro AArch64 BE support
In-Reply-To: <1530111347-28773-1-git-send-email-oferh@marvell.com>
References: <1530111347-28773-1-git-send-email-oferh@marvell.com>
Message-ID: <1530111347-28773-2-git-send-email-oferh@marvell.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ofer Heifetz <oferh@marvell.com>

Signed-off-by: Ofer Heifetz <oferh@marvell.com>
---
 support/config-fragments/autobuild/linaro-aarch64-be.config | 3 +++
 support/config-fragments/autobuild/toolchain-configs.csv    | 1 +
 utils/genrandconfig                                         | 1 +
 3 files changed, 5 insertions(+)
 create mode 100644 support/config-fragments/autobuild/linaro-aarch64-be.config

diff --git a/support/config-fragments/autobuild/linaro-aarch64-be.config b/support/config-fragments/autobuild/linaro-aarch64-be.config
new file mode 100644
index 0000000..7e69350
--- /dev/null
+++ b/support/config-fragments/autobuild/linaro-aarch64-be.config
@@ -0,0 +1,3 @@
+BR2_aarch64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 64abfb3..136a67f 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -58,6 +58,7 @@ support/config-fragments/autobuild/br-xtensa-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
 support/config-fragments/autobuild/i686-ctng-linux-gnu.config,x86
 support/config-fragments/autobuild/linaro-aarch64.config,x86
+support/config-fragments/autobuild/linaro-aarch64-be.config,x86
 support/config-fragments/autobuild/linaro-arm.config,x86
 support/config-fragments/autobuild/mips64el-ctng_n32-linux-gnu.config,x86
 support/config-fragments/autobuild/mips64el-ctng_n64-linux-gnu.config,x86
diff --git a/utils/genrandconfig b/utils/genrandconfig
index 06701ce..27f84ea 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -187,6 +187,7 @@ def is_toolchain_usable(configfile, config):
     if platform.machine() == 'x86_64':
         if 'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y\n' in configlines or \
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
+           'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y\n' in configlines or \
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
             ldd_version_output = subprocess.check_output(['ldd', '--version'])
             glibc_version = ldd_version_output.splitlines()[0].split()[-1]
-- 
2.7.4
