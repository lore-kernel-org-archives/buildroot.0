From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Feb 2013 08:36:05 -0300
Subject: [Buildroot] [PATCH 5/5] config/kb9202_defconfig: update to latest
	at91 kernel and lock headers
In-Reply-To: <1360323365-5936-1-git-send-email-gustavo@zacarias.com.ar>
References: <1360323365-5936-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1360323365-5936-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/kb9202_defconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 50b278c..1d01a22 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -5,10 +5,14 @@ BR2_arm920t=y
 # Filesystem
 BR2_TARGET_ROOTFS_TAR=y
 
+# Lock down headers to avoid breaking with new defaults
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="2.6.38.8"
+
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.33"
-BR2_LINUX_KERNEL_PATCH="http://maxim.org.za/AT91RM9200/2.6/2.6.33-at91.patch.gz"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.8"
+BR2_LINUX_KERNEL_PATCH="http://maxim.org.za/AT91RM9200/2.6/2.6.38-at91.patch.gz"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="kb9202"
-- 
1.7.12.4
