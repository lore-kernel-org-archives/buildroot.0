From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 22:04:28 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: add
	ARC glibc fragment
Message-ID: <20171021195852.9E8D57FBD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdc7567bbdcef4d26b2c96a284795d64f4b79e38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glibc is now supported for ARC so let's kick-start autobuilders
with glibc toolchain for ARC HS.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/config-fragments/autobuild/br-arc-internal-glibc.config | 4 ++++
 support/config-fragments/autobuild/toolchain-configs.csv        | 1 +
 2 files changed, 5 insertions(+)

diff --git a/support/config-fragments/autobuild/br-arc-internal-glibc.config b/support/config-fragments/autobuild/br-arc-internal-glibc.config
new file mode 100644
index 0000000..b9d6857
--- /dev/null
+++ b/support/config-fragments/autobuild/br-arc-internal-glibc.config
@@ -0,0 +1,4 @@
+BR2_arcle=y
+BR2_archs38=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 80a6d04..efb78ee 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -2,6 +2,7 @@ support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config,x86
 support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config,x86
 support/config-fragments/autobuild/br-aarch64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
+support/config-fragments/autobuild/br-arc-internal-glibc.config,any
 support/config-fragments/autobuild/br-arcle-hs38.config,x86_64
 support/config-fragments/autobuild/br-arm-basic.config,x86_64
 support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config,x86_64
