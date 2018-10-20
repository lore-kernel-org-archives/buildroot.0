From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 17:12:27 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: test
 the ARM AArch64 toolchain
Message-ID: <20181020151147.D9E088283F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6b766527e9303594c4fa7ac8f782cc5859ea2c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/arm-aarch64.config    | 4 ++++
 support/config-fragments/autobuild/toolchain-configs.csv | 1 +
 2 files changed, 5 insertions(+)

diff --git a/support/config-fragments/autobuild/arm-aarch64.config b/support/config-fragments/autobuild/arm-aarch64.config
new file mode 100644
index 0000000000..bed08dcb1d
--- /dev/null
+++ b/support/config-fragments/autobuild/arm-aarch64.config
@@ -0,0 +1,4 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index d5bba8949e..f24ec9ced0 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -22,6 +22,7 @@ support/config-fragments/autobuild/br-arm-full-static.config,x86_64
 support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config,x86
 
 # Toolchains used by test-pkg only when the '-a' option is passed:
+support/config-fragments/autobuild/arm-aarch64.config,x86_64
 support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config,x86
 support/config-fragments/autobuild/br-aarch64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
