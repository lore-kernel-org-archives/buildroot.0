From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 22:15:57 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: add
 Linaro AArch64 BE support
Message-ID: <20180628201800.B90D983647@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78968330e3293f622e5f4a4dbbe98ba5665034fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ofer Heifetz <oferh@marvell.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/linaro-aarch64-be.config | 3 +++
 support/config-fragments/autobuild/toolchain-configs.csv    | 1 +
 utils/genrandconfig                                         | 1 +
 3 files changed, 5 insertions(+)

diff --git a/support/config-fragments/autobuild/linaro-aarch64-be.config b/support/config-fragments/autobuild/linaro-aarch64-be.config
new file mode 100644
index 0000000000..e075fe7eb0
--- /dev/null
+++ b/support/config-fragments/autobuild/linaro-aarch64-be.config
@@ -0,0 +1,3 @@
+BR2_aarch64_be=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 64abfb3fd4..136a67f54b 100644
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
index 06701ce565..27f84ea555 100755
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
