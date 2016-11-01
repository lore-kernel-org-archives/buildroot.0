From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue,  1 Nov 2016 15:53:04 +1100
Subject: [Buildroot] [PATCH 1/1] Autobuilder: add powerpc64 and powerpc64le
Message-ID: <955cacaf56560ef6d27555e5e969a576187daba3.1477975719.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add autobuilder configuration for powerpc64le, with a Power8 CPU.
Add autobuilder configuration for powerpc64 (big endian), with a
generic PowerPC CPU.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
Hello Buildroot,

Here are autobuilder configurations for powerpc64le and powerpc64
(big endian).

The powerpc64le configuration is set up for Power8 CPUs, because
that's where little endian support starts.

The powerpc64 configuration is set up for a generic PowerPC CPU, as
that makes it as widely usable as possible but Power7 would be another
reasonable choice.

I tried to follow the same style as the other configurations but I
should point out that:
* I did not prefix the name with "br-". I'm not sure what it means.
* For the actual configuration (.config files) I cut and trimmed the
  "Target options" section of a working Buildroot configuration.
* I haven't inlcuded a pre-built tool chain. I'd like to have one
  but I assume it can be set up separately.
* I wasn't sure if I needed to put anything in the commit message so
  it's pretty bare.

I've run the autobuilder locally on my configurations and it seems to
work (I produced some successful builds), although I did hack the
autobuilder script a bit so that it would use the local configuration.

Anyway, I hope this is pretty close :-)

Cheers,
Sam.

 web/toolchains/configs/powerpc64.config          | 6 ++++++
 web/toolchains/configs/powerpc64le-power8.config | 5 +++++
 web/toolchains/configs/toolchain-configs.csv     | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 web/toolchains/configs/powerpc64.config
 create mode 100644 web/toolchains/configs/powerpc64le-power8.config

diff --git a/web/toolchains/configs/powerpc64.config b/web/toolchains/configs/powerpc64.config
new file mode 100644
index 0000000..13986b1
--- /dev/null
+++ b/web/toolchains/configs/powerpc64.config
@@ -0,0 +1,6 @@
+BR2_ARCH_IS_64=y
+BR2_powerpc64=y
+BR2_ARCH="powerpc64"
+BR2_ENDIAN="BIG"
+BR2_generic_powerpc=y
+BR2_powerpc_CLASSIC=y
diff --git a/web/toolchains/configs/powerpc64le-power8.config b/web/toolchains/configs/powerpc64le-power8.config
new file mode 100644
index 0000000..d35c579
--- /dev/null
+++ b/web/toolchains/configs/powerpc64le-power8.config
@@ -0,0 +1,5 @@
+BR2_ARCH_IS_64=y
+BR2_powerpc64le=y
+BR2_ARCH="powerpc64le"
+BR2_ENDIAN="LITTLE"
+BR2_powerpc_power8=y
diff --git a/web/toolchains/configs/toolchain-configs.csv b/web/toolchains/configs/toolchain-configs.csv
index 0bb0741..2389743 100644
--- a/web/toolchains/configs/toolchain-configs.csv
+++ b/web/toolchains/configs/toolchain-configs.csv
@@ -40,6 +40,8 @@ http://autobuild.buildroot.org/toolchains/configs/linaro-aarch64.config,x86,glib
 http://autobuild.buildroot.org/toolchains/configs/linaro-arm.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/mips64el-ctng_n32-linux-gnu.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/mips64el-ctng_n64-linux-gnu.config,x86,glibc
+http://autobuild.buildroot.org/toolchains/configs/powerpc64.config,x86_64,glibc
+http://autobuild.buildroot.org/toolchains/configs/powerpc64le-power8.config,x86_64,glibc
 http://autobuild.buildroot.org/toolchains/configs/powerpc-ctng_e500v2-linux-gnuspe.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/sourcery-arm-armv4t.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/sourcery-arm.config,x86,glibc
-- 
2.10.0.297.gf6727b0
