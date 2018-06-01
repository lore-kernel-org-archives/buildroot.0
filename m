From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jun 2018 16:37:48 +0200
Subject: [Buildroot] [git commit] linux: config.in: add comment for Arm
 Cortex-M
Message-ID: <20180601144051.31A5E7FF2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f13477b68fc228709764262431faf3458c28ccab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When binutils > 2.28 are selected on Arm Cortex-M cpu,
linux kernel does not boot due to a new implementation
of 'adr pseudo instruction' on binutils.

Bugzilla thread: https://bugs.busybox.net/show_bug.cgi?id=11051

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 73a3299b8f..b5957b61d3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -8,6 +8,10 @@ config BR2_LINUX_KERNEL
 
 if BR2_LINUX_KERNEL
 
+comment "Linux kernel will not boot with binutils >= 2.29"
+	depends on BR2_ARM_CPU_ARMV7M
+	depends on !BR2_BINUTILS_VERSION_2_28_X
+
 # Packages that need to have a kernel with support for loadable modules,
 # but do not use the kernel-modules infrastructure, should select that
 # option.
