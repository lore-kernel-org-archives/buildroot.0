From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Thu, 31 May 2018 12:09:42 +0000
Subject: [Buildroot] [PATCH v2 4/4] linux: config.in: add comment for Arm
 Cortex-M
In-Reply-To: <1527768578-1351-1-git-send-email-christophe.priouzeau@st.com>
References: <1527761825-26682-4-git-send-email-christophe.priouzeau@st.com>
 <1527768578-1351-1-git-send-email-christophe.priouzeau@st.com>
Message-ID: <1527768578-1351-4-git-send-email-christophe.priouzeau@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When binutils > 2.28 are selected on Arm Cortex-M cpu,
linux kernel does not boot due to a new implementation
of 'adr pseudo instruction' on binutils.

Bugzilla thread: https://bugs.busybox.net/show_bug.cgi?id=11051

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
Changes v1 -> v2
 - correct depends on for comment

 linux/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 73a3299..04d4548 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -8,6 +8,10 @@ config BR2_LINUX_KERNEL
 
 if BR2_LINUX_KERNEL
 
+comment "Linux kernel will not boot with binutils >= 2.29"
+	depends on !BR2_ARMV7M
+	depends on !BR2_BINUTILS_VERSION_2_28_X
+
 # Packages that need to have a kernel with support for loadable modules,
 # but do not use the kernel-modules infrastructure, should select that
 # option.
-- 
2.7.4
